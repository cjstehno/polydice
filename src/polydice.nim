# This is just an example to get you started. A typical hybrid package
# uses this file as the main entry point of the application.

import polydicepkg/dice
import docopt, strutils

let doc = """
A polyhedral dice roller.

Usage:
    polydice [-n=<num_rolls>] <roll_defn>
    polydice (-h | --help)
    polydice --version
Options:
    -n=<num_rolls>  The number of rolls to make (defaults to 1).
    -h --help       Show this screen.
    --version       Show version.
"""

let args = docopt(doc, version = "Polydice v0.1.0")

let rollDefn = $args["<roll_defn>"]

echo "Rolling (", averageFromString(rollDefn), ") ", rollDefn, "..."

let numRolls = parseInt($args["-n"])
for rn in 0..(numRolls-1):
    let result = roll(rollDefn)
    echo "[", rn+1, "] ", result.value, "\t= (", join(result.rolls, " + "), ")\t+", result.modifier
