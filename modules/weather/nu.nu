def signatures [] {
  let sig = ([
      { name: "nu-nu"
        description: "signature test for nu-nu"
        extra_description: ""
        required_positional: [
            {
                name: "a"
                desc: "required int value"
                shape: "Int"
                var_id: None
            },
            {
                name: "b"
                desc: "required string value"
                shape: "String"
                var_id: None
            }
        ]
        optional_positional: [
            {
                name: "opt"
                desc: "optional number"
                shape: "Int"
                var_id: None
            }
        ]
        rest_positional: {
            name: "rest"
            desc: "rest value string"
            shape: "String"
            var_id: None
        }
        named: [
            {
                long: "help"
                short: "h"
                arg: None
                required: false
                desc: "display this help message"
                var_id: None
            }
            {
                long: "flag"
                short: "f"
                arg: None
                required: false
                desc: "a flag for the signature"
                var_id: None
            }
            {
                long: "named"
                short: "n"
                arg: "String"
                required: false
                desc: "named string"
                var_id: None
            }
        ]
        is_filter: false
        creates_scope: false
        category: "Experimental"
      }
  ])

  let jsonr = ($sig | to json)
  $jsonr
}

def process_call [plugin_call] {
    let ret =  ({
        Value: {
            List: {
                vals: [
                    {
                        Record: {
                            cols: ["one", "two", "three"],
                            vals: [
                                {
                                    Int: {
                                        val: 0,
                                        span: {start: 0, end: 1}
                                    }
                                }
                                {
                                    Int: {
                                        val: 0,
                                        span: {start: 0, end: 1}
                                    }
                                }
                                {
                                    Int: {
                                        val: 0,
                                        span: {start: 0, end: 1}
                                    }
                                }
                            ],
                            span: {start: 0, end: 1}
                        }
                    }
                    {
                        Record: {
                            cols: ["one", "two", "three"],
                            vals: [
                                {
                                    Int: {
                                        val: 0,
                                        span: {start: 0, end: 1}
                                    }
                                }
                                {
                                    Int: {
                                        val: 1,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                                {
                                    Int: {
                                        val: 2,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                            ],
                            span: { start: 0, end: 1 }
                        }
                    }
                    {
                        Record: {
                            cols: ["one", "two", "three"],
                            vals: [
                                {
                                    Int: {
                                        val: 0,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                                {
                                    Int: {
                                        val: 2,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                                {
                                    Int: {
                                        val: 4,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                            ],
                            span: { start: 0, end: 1 }
                        }
                    }
                    {
                        Record: {
                            cols: ["one", "two", "three"],
                            vals: [
                                {
                                    Int: {
                                        val: 0,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                                {
                                    Int: {
                                        val: 3,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                                {
                                    Int: {
                                        val: 6,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                            ],
                            span: { start: 0, end: 1 }
                        }
                    }
                    {
                        Record: {
                            cols: ["one", "two", "three"],
                            vals: [
                                {
                                    Int: {
                                        val: 0,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                                {
                                    Int: {
                                        val: 4,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                                {
                                    Int: {
                                        val: 8,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                            ],
                            span: { start: 0, end: 1 }
                        }
                    }
                    {
                        Record: {
                            cols: ["one", "two", "three"],
                            vals: [
                                {
                                    Int: {
                                        val: 0,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                                {
                                    Int: {
                                        val: 5,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                                {
                                    Int: {
                                        val: 10,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                            ],
                            span: { start: 0, end: 1 }
                        }
                    }
                    {
                        Record: {
                            cols: ["one", "two", "three"],
                            vals: [
                                {
                                    Int: {
                                        val: 0,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                                {
                                    Int: {
                                        val: 6,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                                {
                                    Int: {
                                        val: 12,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                            ],
                            span: { start: 0, end: 1 }
                        }
                    }
                    {
                        Record: {
                            cols: ["one", "two", "three"],
                            vals: [
                                {
                                    Int: {
                                        val: 0,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                                {
                                    Int: {
                                        val: 7,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                                {
                                    Int: {
                                        val: 14,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                            ],
                            span: { start: 0, end: 1 }
                        }
                    }
                    {
                        Record: {
                            cols: ["one", "two", "three"],
                            vals: [
                                {
                                    Int: {
                                        val: 0,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                                {
                                    Int: {
                                        val: 8,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                                {
                                    Int: {
                                        val: 16,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                            ],
                            span: { start: 0, end: 1 }
                        }
                    }
                    {
                        Record: {
                            cols: ["one", "two", "three"],
                            vals: [
                                {
                                    Int: {
                                        val: 0,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                                {
                                    Int: {
                                        val: 9,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                                {
                                    Int: {
                                        val: 18,
                                        span: { start: 0, end: 1 }
                                    }
                                }
                            ],
                            span: { start: 0, end: 1 }
                        }
                    }
                ],
                span: { start: 0, end: 1 }
            }
        }
    })

    let jsonr = ($ret | to json)
    $jsonr
}

def plugin [input] {
    let plugin_call = $input
    if $plugin_call == "Signature" {
        signatures
    } else if "CallInfo" in $plugin_call {
        process_call $plugin_call
    } else {
        let error = ({
            Error: {
                label: "ERROR from plugin",
                msg: "error message pointing to call head span",
                span: {start: 0, end: 1},
            }
        })

        let jsonr = ($error | to json)
        $jsonr
    }
}

def main [] {
    let params = (each {|param| echo $param })
    plugin $params
}
