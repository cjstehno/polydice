import strutils, random, math
import nre except toSeq

randomize()

# TODO: see if I can reduce the scope for the ints

type
    RollResult* = object
        rolls*: seq[int]
        modifier*: int
        value*: int

let regex = "([0-9]*)d([0-9]*)([+|-]?[0-9]*)".re

proc capturedInt(cap: string, orUse: int): int =
    if cap != "": cap.parseInt()
    else: orUse

proc rolling*(n:int, d:int, m:int): RollResult =
    ## Rolls the `d` die `n` times and add the the `m` modifier to the total.
    result.rolls = @[]
    result.modifier = m
    result.value = 0

    for r in 0..(n-1):
        let roll = rand(1..d)
        result.value += roll
        result.rolls.add(roll)

    result.value += m

    return result

proc parseDefn(rollDefn: string): (int, int, int)=
    let matches = rollDefn.match(regex).get
    let n = capturedInt(matches.captures[0], 1)
    let d = matches.captures[1].parseInt()
    let m = capturedInt(matches.captures[2], 0)
    return (n,d,m)

proc roll*(rollDefn: string): RollResult =
    ## Parses the roll definition in the form `NNNdDDD(+/-)MMM` and then calls the rolling function with the values.
    let (n,d,m) = parseDefn(rollDefn)
    return rolling(n, d, m)

proc averageRoll*(n:int, d:int, m:int): int =
    ## Calculates the average value for the roll configuration.
    return n * ceil(d/2).int + m

proc averageRollFromString*(rollDefn: string): int =
    ## Calculates the average value for the roll definiation.
    let (n,d,m) = parseDefn(rollDefn)
    return averageRoll(n, d, m)

