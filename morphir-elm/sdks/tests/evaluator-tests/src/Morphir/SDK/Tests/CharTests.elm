module Morphir.SDK.Tests.CharTests exposing (..)

import Morphir.UnitTest.Test exposing (..)
import Morphir.UnitTest.Expect as Expect
import Morphir.SDK.Char as Char exposing (..)


{-
    Test: Char/isUpper
-}
charIsUpperTest : Test
charIsUpperTest =
    describe "Char isUpper Tests"
    [
       test "Upper Case Letters"
        \_ -> 
            let
                testChars = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'X', 'Y', 'Z']
            in
                Expect.equalLists (List.map isUpper testChars) (List.repeat 14 True)
        , test "Lower Case Letters"
        \_ -> 
            let
                testChars = ['a', 'b', 'c', 'd', 'e', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
            in
                Expect.equalLists (List.map isUpper testChars) (List.repeat 14 False)
        , test "Numbers and Ambiguous Symbols"
        \_ ->
            let
                testChars = ['1', '2', '3', '0', '-', '+', '*', ')', '&']
            in
                Expect.equalLists (List.map isUpper testChars) (List.repeat 9 False)
        {-
            -- Decoding of IR doesn't seem to be supported for all characters
        , test "Upper Case Symbols"
        \_ ->
            let
                testChars = ['Σ', '𝛱']
            in
                Expect.equalLists (List.map isUpper testChars) (List.repeat 2 True)
        -}
    ]


{-|
    Test: Char/isLower
-}
charIsLowerTest : Test
charIsLowerTest =
    describe "Char isLower Tests"
    [
       test "Upper Case Letters"
        \_ -> 
            let
                testChars = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'X', 'Y', 'Z']
            in
                Expect.equalLists (List.map isLower testChars) (List.repeat 14 False)
        , test "Lower Case Letters"
        \_ -> 
            let
                testChars = ['a', 'b', 'c', 'd', 'e', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
            in
                Expect.equalLists (List.map isLower testChars) (List.repeat 14 True)
        , test "Numbers and Ambiguous Symbols"
        \_ ->
            let
                testChars = ['1', '2', '3', '0', '-', '+', '*', ')', '&']
            in
                Expect.equalLists (List.map isLower testChars) (List.repeat 9 False)
    ]


{-
    Test: Char/isAlpha
-}
charIsAlphaTest : Test
charIsAlphaTest =
    describe "Char isAlpha Tests"
    [
       test "Upper Case Letters"
        \_ -> 
            let
                testChars = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'X', 'Y', 'Z']
            in
                Expect.equalLists (List.map isAlpha testChars) (List.repeat 14 True)
        , test "Lower Case Letters"
        \_ -> 
            let
                testChars = ['a', 'b', 'c', 'd', 'e', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
            in
                Expect.equalLists (List.map isAlpha testChars) (List.repeat 14 True)
        , test "Numbers and Symbols"
        \_ ->
            let
                testChars = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '+', '*', ')', '&']
            in
                Expect.equalLists (List.map isAlpha testChars) (List.repeat 15 False)
    ]


{-|

    Test: Char/isAlphaNum
    expected('z') = True
    expected('A') = False
    expected('1') = True
    expected('π') = False

-}
charIsAlphaNumTest : Char -> Bool
charIsAlphaNumTest ch =
    isAlphaNum ch


{-|

    Test: Char/isDigit
    expected('1') = True
    expected('A') = False
    expected('π') = False

-}
charIsDigitTest : Char -> Bool
charIsDigitTest ch =
    isDigit ch


{-|

    Test: Char/isOctDigit
    expected('1') = True
    expected('8') = False
    expected('A') = False
    expected('π') = False

-}
charIsOctDigitTest : Char -> Bool
charIsOctDigitTest ch =
    isOctDigit ch


{-|

    Test: Char/isHexDigit
    expected('1') = True
    expected('A') = True
    expected('f') = True
    expected('g') = False
    expected('π') = False

-}
charIsHexDigitTest : Char -> Bool
charIsHexDigitTest ch =
    isHexDigit ch


{-|

    Test: Char/toUpper
    expected('z') = 'Z'

-}
charToUpperTest : Char -> Char
charToUpperTest ch =
    toUpper ch


{-|

    Test: Char/toLower
    expected('Z') = 'z'

-}
charToLowerTest : Char -> Char
charToLowerTest ch =
    toLower ch


{-|

    Test: Char/toLocaleUpper
    expected('z') = 'Z'

-}
charToLocaleUpperTest : Char -> Char
charToLocaleUpperTest ch =
    toLocaleUpper ch


{-|

    Test: Char/toLocaleLower
    expected('Z') = 'z'

-}
charToLocaleLowerTest : Char -> Char
charToLocaleLowerTest ch =
    toLocaleLower ch


{-|

    Test: Char/toCode
    expected('A') = 65
    expected('B') = 66
    expected('木') = 0x6728

-}
charToCodeTest : Char -> Int
charToCodeTest ch =
    toCode ch


{-|

    Test: Char/fromCode
    expected(65) = 'A'
    expected(66) = 'B'
    expected(0x6728) = '木'
    expected(-1) = '�'

-}
charFromCodeTest : Int -> Char
charFromCodeTest int =
    fromCode int
