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

The "dice definition" expression is in the format `NNdDDD(+/-)MM`, where N is the number of die rolls, D is the die to 
be rolled, and M is the modifier to the roll. As an example (shown above) `2d12+3` would roll a d12 twice and 
then add three to it, yielding a value range of 5-27 with an average of 15.

## Module Usage

To install the package for your project run:

    nimble install https://github.com/cjstehno/polydice

Add the dependency:

    requires "polydice >= 0.1.0"

Then you can import the dice library by adding `import polydicepkg/dice` to your source file to begin using it. See the 
module documentation for exposed features.