import polydicepkg/dice
import docopt, strutils

let doc = """
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
"""

let args = docopt(doc, version = "Polydice v0.2.0")

let rollDefn = $args["<roll_defn>"]

echo "Rolling (", averageRollFromString(rollDefn), ") ", rollDefn, "..."

let numRolls = parseInt(if args["-n"]: $args["-n"] else: "1")
for rn in 0..(numRolls-1):
    let result = roll(rollDefn)
    if args["--show-details"]:
        let modifier = (if result.modifier >= 0: "+" else: "") & $result.modifier
        echo "[", rn+1, "] ", result.value, "\t= (", join(result.rolls, " + "), ")\t", modifier
    else:
        echo "[", rn+1, "] ", result.value
