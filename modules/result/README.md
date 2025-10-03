# `result`
A module for storing and easily accessing previously output results.  To activate it, one should set
```nu
$env.config.hooks.display_output = { result hook }
```

The module provides the following commands
```nu
result  # return previous result
result ls  # return list of all stored results
result select  # interactively select a stored result
```
