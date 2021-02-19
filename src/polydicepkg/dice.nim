from os import paramStr, paramCount
import strutils, random, math
import nre except toSeq

randomize()

# TODO: see if I can reduce the scope for the ints
# TODO: module documentation

type
    RollResult* = object
        rolls*: seq[int]
        modifier*: int
        value*: int

let regex = "([0-9]*)d([0-9]*)[+]?([0-9]*)".re

proc capturedInt(cap: string, orUse: int): int =
    if cap != "": cap.parseInt()
    else: orUse

proc rolling*(n:int, d:int, m:int): RollResult =
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
    let (n,d,m) = parseDefn(rollDefn)
    return rolling(n, d, m)

proc average*(n:int, d:int, m:int): int =
    return n * ceil(d/2).int + m

proc averageFromString*(rollDefn: string): int =
    let (n,d,m) = parseDefn(rollDefn)
    return average(n, d, m)

