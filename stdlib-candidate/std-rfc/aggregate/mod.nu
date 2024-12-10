def aggregate-default-ops [] {
	{
		min: {math min},
		avg: {math avg},
		max: {math max},
		sum: {math sum},
	}
}

def aggregate-col-name [col: cell-path, op_name: string]: [nothing -> string] {
	$col | split cell-path | get value | str join "." | $"($in)_($op_name)"
}

# Run aggregations on output of `group-by --to-table`.
#
# # Example
#
# ```nushell
# ls
# | group-by type { get name | path parse | get extension } --to-table
# | aggregate size
# ```
export def aggregate [
	--ops: record, # default = {min: {math min}, avg: {math avg}, max: {math max}, sum: {math sum}}  
	...columns: cell-path, # columns to perform aggregations on
]: [
	table<items: table> -> table<count: int>
] {
	let IN = $in
	let md = metadata $in

	# Validate input
	try {
		use std/assert
		assert ("items" in ($IN | first | columns))
	} catch {
		error make {
			msg: "input must be a table with `items` column",
			label: {
				text: "from here",
				span: $md.span
			},
			help: "Are you using `group-by` with `--to-table`?"
		}
	}

	let agg_ops = $ops | default (aggregate-default-ops)

	$IN
	| update items {|group|
		$columns | each {|col| # col: cell-path
			let column = try {
				$group.items | get $col
			} catch {
				let full_cellpath = (
					$col
					| split cell-path
					| prepend {value: items, optional: false}
					| into cell-path
				)
				error make {
					msg: $"Cannot find column '($full_cellpath)'",
					label: {
						text: "value originates here",
						span: $md.span
					},
				}
			}
			$agg_ops | items {|op_name, op| # op_name: string, op: closure
				$column | do $op | wrap (aggregate-col-name $col $op_name)
			}
			| reduce {|it| merge $it}
		}
		| reduce --fold {} {|it| merge $it}
		| insert count ($group.items | length)
		| roll right  # put count as the first column
	}
	| flatten items
}
