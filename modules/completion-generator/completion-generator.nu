export def 'from tree' [
    schema
    --cmd-len(-c) = 1
    --selector = {value: 'value', description: 'description', next: 'next'}
] {
    let ctx = $in
    let argv = $ctx.0
        | str substring 0..$ctx.1
        | split row -r '\s+'
        | slice $cmd_len..
        | where not ($it | str starts-with '-')
    let menu = $argv
        | reduce -f {schema: $schema, path: []} {|x, acc|
            let acc = $acc | update path ($acc.path | append $x)
            if ($x | is-empty) {
                $acc
            } else {
                match ($acc.schema | describe -d | get type) {
                    record => {
                        if $x in $acc.schema {
                            $acc | merge { schema: ($acc.schema | get $x) }
                        } else {
                            $acc
                        }
                    }
                    list => {
                        let fst = $acc.schema.0? | describe -d | get type
                        if not ($fst in ['list', 'record'])  {
                            $acc
                        } else {
                            let r = $acc.schema | filter {|i| ($i | get $selector.value) == $x}
                            if ($r | is-empty) {
                                $acc
                            } else {
                                $acc | merge { schema: ($r | first | get $selector.next) }
                            }
                        }
                    }
                    _ => {
                        $acc
                    }
                }
            }
            | update schema {|x|
                if ($x.schema | describe -d | get type) == 'closure' {
                    do $x.schema $x.path
                } else {
                    $x.schema
                }
            }
        }
    match ($menu.schema | describe -d | get type) {
        record => {
            $menu.schema
            | transpose k v
            | each {|i|
                if ($i.v | describe -d | get type) == 'string' {
                    { value: $i.k, description: $i.v }
                } else {
                    $i.k
                }
            }
        }
        list => {
            if ($menu.schema.0? | describe -d | get type) == 'record' {
                $menu.schema
                | each {|x| {$selector.value: null, $selector.description: null} | merge $x }
                | select $selector.value $selector.description
                | rename value description
            } else {
                $menu.schema
            }
        }
    }
}

export def flare [...args:string@comflare] {
    print ($args | str join ' -> ')
}

def comflare [...context] {
    if not ('~/.cache/flare.json' | path exists) {
        http get https://gist.githubusercontent.com/curran/d2656e98b489648ab3e2071479ced4b1/raw/9f2499d63e971c2110e52b3fa2066ebed234828c/flare-2.json
        | to json
        | save ~/.cache/flare.json
    }
    let data = open ~/.cache/flare.json
    $context | from tree -c 2 --selector {value: name, description: value, next: children } [$data]
}

export def math [...args:string@commath] {
    print ($args | str join ' -> ')
}

def commath [...context] {
    $context | from tree -c 2 [
        {
            value: Count
            description: closure
            next: {|path| $path}
        }
        {
            value: PureMathematics
            next: {
                NumberSystems: [
                    { value: NaturalNumbers, description: '1, 2, 3, 4, 5', next: [Arithmetic ] }
                    { value: Integer, description: '-2, -1, 0, 1, 2' }
                    { value: RationalNumbers, description: '-7, 1/2, 2.32' }
                    { value: RealNumbers, description: '-4pi, sqrt(2), e' }
                    { value: ComplexNumbers, description: '3, i, 4+3i, -4i' }
                ]
                Structures: {
                    Algebra: {
                        Equation: null
                        LinearAlgebra: [ Vector Matrices ]
                    }
                    NumberTheory: null
                    Combinatorics: [Tree Graph]
                    GroupTheory: null
                    OrderTheory: null
                }
                Space: {
                    Geometry: {
                        Trigonometry: null
                        FractalGeometry: null
                    }
                    Topology: null
                    MeasureTheory: null
                    DifferentialGeometry: null
                }
                Changes: {
                    Calculus: {
                        Differentials: null
                        Integrals: null
                        Gradients: null
                    }
                    VectorCalculus: null
                    DynamicalSystems: {
                        FluidFlows: null
                        Ecosystems: null
                        ChaosTheory: null
                    }
                    ComplexAnalysis: null
                }
            }
        }
        {
            value: AppiledMathematics
            next: {
                Physics: {
                    TheoreticalPhysics: null
                }
                MathematicalChemistry: null
                Biomathematics: null
                Engineering : {
                    ControlTheory: null
                }
                NumericalAnalysis: null
                GameTheory: null
                Economics: null
                Probability: null
                Statistics: null
                MathematicalFinance: null
                Optimization: null
                ComputerScience: {
                    MachineLearning: null
                }
                Cryptography: null
            }
        }
        {
            value: Foundations
            next: {
                FundamentalRules: { GodelIncompletenessTheorems: null }
                MathematicalLogic: null
                SetTheory: null
                CategoryTheory: null
                TheoryOfComputation: null
            }
        }
    ]
}

