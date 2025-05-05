# Description
#
# Include `target/debug` and `target/release` in `$env.PATH`
# while `cd`-ing into a Rust project (assumed existence of `Cargo.lock`)
#
#
# Installation
#
# 1. Move this file under any directory in `$env.NU_LIB_DIRS`
# 2. Add `source rusty-paths.nu` to `$nu.config-path`


$env.config = ($env.config | upsert hooks.env_change.PWD {
	append {
		condition: {|_, after| ($after | path join 'Cargo.lock' | path exists) }
		code: {|_, after|
			$env.PATH = (
				$env.PATH
					| prepend ($after | path join 'target' 'debug')
					| prepend ($after | path join 'target' 'release')
					| uniq
			)
		}
	}
  | append {
		condition: {|before, _| ($before | default '' | path join 'Cargo.lock' | path exists) and ($before | is-not-empty)}
		code: {|before, _|
			$env.PATH = (
				$env.PATH
					| where $it != ($before | path join 'target' 'debug')
					| where $it != ($before | path join 'target' 'release')
					| uniq
			)
		}
	}
})
