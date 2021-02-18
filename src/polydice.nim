# This is just an example to get you started. A typical hybrid package
# uses this file as the main entry point of the application.

import polydicepkg/dice
import docopt, strutils

let doc = """
A polyhedral dice roller.

Usage:
    polydice [-n=<num_rolls>] [-r | --rolls] [-a | --average] <roll_defn>
    polydice (-h | --help)
    polydice --version
Options:
    -n=<num_rolls>  The number of rolls to make (defaults to 1).
    -r --rolls      Show the actual rolled numbers (off by default).
    -a --average    Show the average value for the roll definition (off by default).
    -h --help       Show this screen.
    --version       Show version.
"""

let args = docopt(doc, version = "Polydice v0.1.0")

let numRolls = parseInt($args["-n"])
for rn in 0..(numRolls-1):
    echo roll($args["<roll_defn>"])
