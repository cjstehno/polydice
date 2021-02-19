# Polydice

A polyhedral dice roller tool and reusable Nim module package.

## Build

    nimble build -d:release

## Run Tests

    nimble tests

## Install

    nimble install

## Tool Usage

```
A polyhedral dice roller.

Usage:
    polydice [-d | --show-details] [-n=<num_rolls>] <roll_defn>
    polydice (-h | --help)
    polydice --version
Options:
    -d --show-details   Shows the actual rolls and modifier in the result (hidden by default).
    -n=<num_rolls>      The number of rolls to make (defaults to 1).
    -h --help           Show this screen.
    --version           Show version.
```

Running `polydice -d -n 32d12+3` will result in something like the following:

```
Rolling (15) 2d12+3...
[1] 16  = (2 + 11)      +3
[2] 19  = (9 + 7)       +3
[3] 8   = (3 + 2)       +3
```

Where each roll is on a separate line, showing the total first followed by the individual rolls and modifier. The roll
details are hidden by default (remove the `-d` or `--show-details` flag).

The "dice definition" expression is in the format `NNdDDD+MM`

## Module Usage

> TBD...

import this file by writing `import polydicepkg/dice`