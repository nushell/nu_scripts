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


$env.config = ($env.config | update hooks.env_change.PWD {
	append {
		condition: {|_, after| ($after | path join 'Cargo.lock' | path exists) }
		code: {
			$env.PATH = (
				$env.PATH
					| prepend ($env.PWD | path join 'target/debug')
					| prepend ($env.PWD | path join 'target/release')
					| uniq
				)
		}
	}
})
