def "nu-complete --capture" [] { ["fd", "sys", "no", "tee-sys"] }
def "nu-complete --last-failed-no-failures" [] { ["all", "none"] }
def "nu-complete --tb" [] { ["auto", "long", "short", "line", "native", "no"] }
def "nu-complete --show-capture" [] { ["no", "stdout", "stderr", "log", "all"] }
def "nu-complete --color" [] { ["yes", "no", "auto"] }
def "nu-complete --code-highlight" [] { ["yes", "no"] }
def "nu-complete --pastebin" [] { ["failed", "all"] }
def "nu-complete --import-mode" [] { ["prepend", "append", "importlib"] }
def "nu-complete --doctest-report" [] { ["none", "cdiff", "ndiff", "udiff", "only_first_failure"] }
def "nu-complete --log-file-mode" [] { ["w"; "a"] }
def "nu-complete --assert" [] { ["plain"; "rewrite"] }
def "nu-complete --log-level" [] { ["DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"] }

export extern pytest [
  file_or_dir?: path        # List of files or directories to use for test discovery.
  -k: string                # Only run tests which match the given substring expression.
  --markers(-m): string     # Register new markers for test functions
  --exitfirst(-x)           # Exit instantly on first error or failed test
  --fixtures                # Show available fixtures, sorted by plugin appearance (fixtures with leading '_' are only shown with '-v')
  --fixtures-per-test       # Show fixtures per test
  --pdb                     # Start the interactive Python debugger on errors or KeyboardInterrupt
  --pdbcls:string           # Specify a custom interactive Python debugger for use with --pdb
  --trace                   # Immediately break when running each test
  --capture:string@"nu-complete --capture"    # Per-test capturing method
  -s                        # Shortcut for --capture=no
  --runxfail                # Report the results of xfail tests as if they were not marked
  --last-failed             # Rerun only the tests that failed at the last run (or all if none failed)
  --failed-first            # Run all tests, but run the last failures first. This may re-order tests and thus lead to repeated fixture setup/teardown.
  --new-first               # Run tests from new files first, then the rest of the tests sorted by file mtime
  --cache-show?:string      # Show cache contents, don't perform collection or tests. Optional argument: glob (default: '*').
  --cache-clear             # Remove all cache contents at start of test run
  --last-failed-no-failures:string@"nu-complete --last-failed-no-failures"  # Determines whether to execute tests when there are no previously (known) failures or when no
                                                                            # cached ``lastfailed`` data was found. ``all`` (the default) runs the full test suite again. ``none`` just
                                                                            # emits a message about no known failures and exits successfully.
  --stepwise                # Exit on test failure and continue from last failing test next time
  --stepwise-skip           # Ignore the first failing test but stop on the next failing test. Implicitly enables --stepwise.
  --durations:int           # Show N slowest setup/test durations (N=0 for all)
  --durations-min?:int      # Minimal duration in seconds for inclusion in slowest list. Default: 0.005.
  --verbose(-v)             # Increase verbosity
  --no-header               # Disable header
  --no-summary              # Disable summary
  --no-fold-skipped         # Do not fold skipped tests in short summary.
  --quiet(-q)               # Decrease verbosity
  --verbosity:int           # Set verbosity. Default: 0.
  -r:string                 # Show extra test summary info as specified (f)ailed, (E)rror, (s)kipped, (x)failed, (X)passed,
                            # (p)assed, (P)assed with output, (a)ll except passed (p/P), or (A)ll. (w)arnings are enabled by default (see
                            # --disable-warnings), 'N' can be used to reset the list. (default: 'fE').
  --disable-warnings        # Disable warnings summary
  --showlocals(-l)          # Show locals in tracebacks (disabled by default)
  --no-showlocals           # Hide locals in tracebacks (negate --showlocals passed through addopts)
  --tb:string@"nu-complete --tb"                          # Traceback print mode
  --xfail-tb                                              # Show tracebacks for xfail (as long as --tb != no)
  --show-capture:string@"nu-complete --show-capture"      # Controls how captured stdout/stderr/log is shown on failed tests. Default: all.
  --full-trace                                            # Don't cut any tracebacks (default is to cut)
  --color:string@"nu-complete --color"                    # Color terminal output
  --code-highlight:string@"nu-complete --code-highlight"  # Whether code should be highlighted (only if --color is also enabled). Default: yes.
  --pastebin:string@"nu-complete --pastebin"              # Send failed|all info to bpaste.net pastebin service
  --junit-xml:path                          # Create junit-xml style report file at given path
  --junit-prefix:string                     # Prepend prefix to classnames in junit-xml output
  --pythonwarnings(-W): string              # Set which warnings to report, see -W option of Python itself
  --maxfail:int                             # Exit after first num failures or errors
  --strict-config                           # Any warnings encountered while parsing the `pytest` section of the configuration file raise errors
  --strict-markers                          # Markers not registered in the `markers` section of the configuration file raise errors
  --config-file(-c):path                    # Load configuration from `FILE` instead of trying to locate one of the implicit configuration files.
  --continue-on-collection-errors           # Force test execution even if collection errors occur
  --rootdir:path            # Define root directory for tests. Can be relative path: 'root_dir', './root_dir', 'root_dir/another_dir/';
                            # absolute path: '/home/user/root_dir'; path with variables: '$HOME/root_dir'.
  --collect-only            # Only collect tests, don't execute them
  --pyargs                  # Try to interpret all arguments as Python packages
  --ignore:path             # Ignore path during collection (multi-allowed)
  --ignore-glob:path        # Ignore path pattern during collection (multi-allowed)
  --deselect:string         # Deselect item (via node id prefix) during collection (multi-allowed)
  --confcutdir:string       # Only load conftest.py's relative to specified dir
  --noconftest              # Don't load any conftest.py files
  --keep-duplicates         # Keep duplicate tests
  --collect-in-virtualenv                                   # Don't ignore tests in a local virtualenv directory
  --import-mode:string@"nu-complete --import-mode"          # Prepend/append to sys.path when importing test modules and conftest files. Default: prepend.
  --doctest-modules                                         # Run doctests in all .py modules
  --doctest-report:string@"nu-complete --doctest-report"    # Choose another output format for diffs on doctest failure
  --doctest-glob:string                                     # Doctests file matching pattern, default: test*.txt
  --doctest-ignore-import-errors                            # Ignore doctest collection errors
  --doctest-continue-on-failure                             # For a given doctest, continue to run after the first failure
  --basetemp:path           # Base temporary directory for this test run. (Warning: this directory is removed if it exists.)
  --version(-V)             # Display pytest version and information about plugins. When given twice, also display information about plugins.
  --help(-h)                # Show help message and configuration info
  -p:string                 # Early-load given plugin module name or entry point (multi-allowed). To avoid loading of plugins, use the #`no:` prefix, e.g. `no:doctest`.
  --trace-config            # Trace considerations of conftest.py files
  --debug?:path             # Store internal tracing debug information in this log file. This file is opened with 'w' and truncated as a
                            # result, care advised. Default: pytestdebug.log.
  --override-ini(-i): string                              # Override ini option with "option=value" style, e.g. `-o xfail_strict=True -o cache_dir=cache`.
  --assert:string@"nu-complete --assert"                  # Control assertion debugging tools. 'plain' performs no assertion debugging.
                                                          # 'rewrite' (the default) rewrites assert statements in test modules on import to provide assert expression information.
  --setup-only              # Only setup fixtures, do not execute tests
  --setup-show              # Show setup of fixtures while executing tests
  --setup-plan              # Show what fixtures and tests would be executed but don't execute anything
  --log-level:string@"nu-complete --log-level"            # Level of messages to catch/display. Not set by default, so it depends on the root/parent log handler's
                                                          # effective level, where it is "WARNING" by default.
  --log-format:string                                     # Log format used by the logging module
  --log-date-format:string                                # Log date format used by the logging module
  --log-cli-level:string@"nu-complete --log-level"        # CLI logging level
  --log-cli-format:string                                 # Log format used by the logging module
  --log-cli-date-format:string                            # Log date format used by the logging module
  --log-file:path                                         # Path to a file when logging will be written to
  --log-file-mode:string@"nu-complete --log-file-mode"    # Log file open mode
  --log-file-level:string@"nu-complete --log-level"       # Log file logging level
  --log-file-format:string                                # Log format used by the logging module
  --log-file-date-format:string                           # Log date format used by the logging module
  --log-auto-indent:int                                   # Auto-indent multiline messages passed to the logging module. Accepts true|on, false|off or an integer.
  --log-disable:string                                    # Disable a logger by name. Can be passed multiple times.
]
