import unittest
import polydicepkg/dice

suite "Testing dice":
    test "average from definition":
        check averageFromString("d2") == 1
        check averageFromString("d3") == 2
        check averageFromString("d6") == 3
        check averageFromString("2d6-1") == 5
        check averageFromString("d12+1") == 7
        check averageFromString("2d8+2") == 10
        check averageFromString("2d100+5") == 105

    test "average with values":
        check average(1, 6, 0) == 3
        check average(1, 12, 1) == 7
        check average(2, 8, 2) == 10
        check average(2, 6, -1) == 5

    test "roll from definition":
        var result = roll("d6")
        check len(result.rolls) == 1
        check result.modifier == 0
        check result.value > 0 and result.value <= 6

        result = roll("3d6+7")
        check len(result.rolls) == 3
        check result.modifier == 7
        check result.value >= 10 and result.value <= 25

        result = roll("3d6-2")
        check len(result.rolls) == 3
        check result.modifier == -2
        check result.value >= 1 and result.value <= 16

    test "roll with values":
        var result = rolling(1, 6, 0)
        check len(result.rolls) == 1
        check result.modifier == 0
        check result.value > 0 and result.value <= 6

        result = rolling(3, 6, 7)
        check len(result.rolls) == 3
        check result.modifier == 7
        check result.value >= 10 and result.value <= 25