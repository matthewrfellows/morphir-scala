module Morphir.SDK.Tests.CharTests exposing (..)

import Morphir.SDK.Char as Char exposing (..)
import Morphir.UnitTest.Expect as Expect
import Morphir.UnitTest.Test exposing (..)



{-
   Test: Char/isUpper
-}


charIsUpperTest : Test
charIsUpperTest =
    describe "Char isUpper Tests"
        [ test "Upper Case Letters" <|
            \_ ->
                let
                    testChars =
                        [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'X', 'Y', 'Z' ]
                in
                Expect.equalLists (List.map isUpper testChars) (List.repeat 14 True)
        , test "Lower Case Letters" <|
            \_ ->
                let
                    testChars =
                        [ 'a', 'b', 'c', 'd', 'e', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' ]
                in
                Expect.equalLists (List.map isUpper testChars) (List.repeat 14 False)
        , test "Numbers and Ambiguous Symbols" <|
            \_ ->
                let
                    testChars =
                        [ '1', '2', '3', '0', '-', '+', '*', ')', '&' ]
                in
                Expect.equalLists (List.map isUpper testChars) (List.repeat 9 False)
        , test "Upper Case Symbols" <|
            \_ ->
                let
                    testChars =
                        [ 'Σ', 'Φ' ]
                in
                Expect.equalLists (List.map isUpper testChars) (List.repeat 2 True)
        ]


{-|

    Test: Char/isLower

-}
charIsLowerTest : Test
charIsLowerTest =
    describe "Char isLower Tests"
        [ test "Upper Case Letters" <|
            \_ ->
                let
                    testChars =
                        [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'X', 'Y', 'Z' ]
                in
                Expect.equalLists (List.map isLower testChars) (List.repeat 14 False)
        , test "Lower Case Letters" <|
            \_ ->
                let
                    testChars =
                        [ 'a', 'b', 'c', 'd', 'e', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' ]
                in
                Expect.equalLists (List.map isLower testChars) (List.repeat 14 True)
        , test "Numbers and Ambiguous Symbols" <|
            \_ ->
                let
                    testChars =
                        [ '1', '2', '3', '0', '-', '+', '*', ')', '&' ]
                in
                Expect.equalLists (List.map isLower testChars) (List.repeat 9 False)
        ]



{-
   Test: Char/isAlpha
-}


charIsAlphaTest : Test
charIsAlphaTest =
    describe "Char isAlpha Tests"
        [ test "Upper Case Letters" <|
            \_ ->
                let
                    testChars =
                        [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'X', 'Y', 'Z' ]
                in
                Expect.equalLists (List.map isAlpha testChars) (List.repeat 14 True)
        , test "Lower Case Letters" <|
            \_ ->
                let
                    testChars =
                        [ 'a', 'b', 'c', 'd', 'e', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' ]
                in
                Expect.equalLists (List.map isAlpha testChars) (List.repeat 14 True)
        , test "Numbers and Symbols" <|
            \_ ->
                let
                    testChars =
                        [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '+', '*', ')', '&' ]
                in
                Expect.equalLists (List.map isAlpha testChars) (List.repeat 15 False)
        ]



{-
   Test: Char/isAlphaNum
-}


charIsAlphaNumTest : Test
charIsAlphaNumTest =
    describe "Char isAlphaNum Tests"
        [ test "Upper Case Letters" <|
            \_ ->
                let
                    testChars =
                        [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'X', 'Y', 'Z' ]
                in
                Expect.equalLists (List.map isAlphaNum testChars) (List.repeat 14 True)
        , test "Lower Case Letters" <|
            \_ ->
                let
                    testChars =
                        [ 'a', 'b', 'c', 'd', 'e', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' ]
                in
                Expect.equalLists (List.map isAlphaNum testChars) (List.repeat 14 True)
        , test "Numbers" <|
            \_ ->
                let
                    testChars =
                        [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' ]
                in
                Expect.equalLists (List.map isAlphaNum testChars) (List.repeat 10 True)
        , test "Symbols" <|
            \_ ->
                let
                    testChars =
                        [ '-', '+', '*', ')', '&' ]
                in
                Expect.equalLists (List.map isAlphaNum testChars) (List.repeat 5 False)
        ]



{-
   Test: Char/isDigit
-}


charIsDigitTest : Test
charIsDigitTest =
    describe "Char isDigit Tests"
        [ test "Upper Case Letters" <|
            \_ ->
                let
                    testChars =
                        [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'X', 'Y', 'Z' ]
                in
                Expect.equalLists (List.map isDigit testChars) (List.repeat 14 False)
        , test "Lower Case Letters" <|
            \_ ->
                let
                    testChars =
                        [ 'a', 'b', 'c', 'd', 'e', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' ]
                in
                Expect.equalLists (List.map isDigit testChars) (List.repeat 14 False)
        , test "Numbers" <|
            \_ ->
                let
                    testChars =
                        [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' ]
                in
                Expect.equalLists (List.map isDigit testChars) (List.repeat 10 True)
        , test "Symbols" <|
            \_ ->
                let
                    testChars =
                        [ '-', '+', '*', ')', '&' ]
                in
                Expect.equalLists (List.map isDigit testChars) (List.repeat 5 False)
        ]



{-
   Test: Char/isOctDigit
-}


charIsOctDigitTest : Test
charIsOctDigitTest =
    describe "Char isOctDigit Tests"
        [ test "Upper Case Letters" <|
            \_ ->
                let
                    testChars =
                        [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'X', 'Y', 'Z' ]
                in
                Expect.equalLists (List.map isOctDigit testChars) (List.repeat 14 False)
        , test "Lower Case Letters" <|
            \_ ->
                let
                    testChars =
                        [ 'a', 'b', 'c', 'd', 'e', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' ]
                in
                Expect.equalLists (List.map isOctDigit testChars) (List.repeat 14 False)
        , test "Numbers" <|
            \_ ->
                let
                    testChars =
                        [ '0', '1', '2', '3', '4', '5', '6', '7' ]
                in
                Expect.equalLists (List.map isOctDigit testChars) (List.repeat 8 True)
        , test "Symbols and non-octal Digits" <|
            \_ ->
                let
                    testChars =
                        [ '-', '+', '*', ')', '&', '8', '9' ]
                in
                Expect.equalLists (List.map isOctDigit testChars) (List.repeat 7 False)
        ]



{-
   Test: Char/isHexDigit
-}


charIsHexDigitTest : Test
charIsHexDigitTest =
    describe "Char isHexDigit Tests"
        [ test "Upper Case Letters" <|
            \_ ->
                let
                    testChars =
                        [ 'G', 'H', 'I', 'J', 'K', 'X', 'Y', 'Z' ]
                in
                Expect.equalLists (List.map isHexDigit testChars) (List.repeat 8 False)
        , test "Lower Case Letters" <|
            \_ ->
                let
                    testChars =
                        [ 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' ]
                in
                Expect.equalLists (List.map isHexDigit testChars) (List.repeat 9 False)
        , test "Hex Digits" <|
            \_ ->
                let
                    testChars =
                        [ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'a', 'b', 'c', 'd', 'e', 'f' ]
                in
                Expect.equalLists (List.map isHexDigit testChars) (List.repeat 22 True)
        , test "Symbols" <|
            \_ ->
                let
                    testChars =
                        [ '-', '+', '*', ')', '&', '^', '(', '%' ]
                in
                Expect.equalLists (List.map isHexDigit testChars) (List.repeat 8 False)
        ]



{-
   Test: Char/toUpper
-}


charToUpperTest : Test
charToUpperTest =
    let
        func =
            toUpper

        uppers =
            [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' ]

        lowers =
            [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' ]
    in
    describe "Char toUpper Tests"
        [ test "Upper Case Letters" <|
            \_ ->
                Expect.equalLists (List.map func uppers) uppers
        , test "Lower Case Letters" <|
            \_ ->
                Expect.equalLists (List.map func lowers) uppers
        ]



{-
   Test: Char/toLower
-}


charToLowerTest : Test
charToLowerTest =
    let
        func =
            toLower

        uppers =
            [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' ]

        lowers =
            [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' ]
    in
    describe "Char toLower Tests"
        [ test "Upper Case Letters" <|
            \_ ->
                Expect.equalLists (List.map func uppers) lowers
        , test "Lower Case Letters" <|
            \_ ->
                Expect.equalLists (List.map func lowers) lowers
        ]


{-
   Test: Char/toCode
-}


charToCodeTest : Test
charToCodeTest =
    let
        func =
            toCode

        uppers =
            [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' ]

        lowers =
            [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' ]

        symbols =
            [ '!', '"', '#', '$', '%', '&', '\'', '(', ')', '*', '+', ',', '-', '.', '/' ]

        decimalDigits =
            [ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' ]

        nonEnglishChars =
            [ '¥', '木', 'Ě', 'Σ' ]
    in
    describe "Char toCode Tests"
        [ test "Upper Case Letters" <|
            \_ ->
                Expect.equalLists (List.map func uppers) (List.range 65 (65 + 25))
        , test "Lower Case Letters" <|
            \_ ->
                Expect.equalLists (List.map func lowers) (List.range 97 (97 + 25))
        , test "Symbols" <|
            \_ ->
                Expect.equalLists (List.map func symbols) (List.range 33 (33 + 14))
        , test "Decimal Digits" <|
            \_ ->
                Expect.equalLists (List.map func decimalDigits) (List.range 48 (48 + 9))
        , test "Non-English Characters" <|
            \_ ->
                Expect.equalLists (List.map func nonEnglishChars) [ 165, 26408, 282, 931 ]

        -- [0x00A5, 0x6728, 0x011A, 0x03A3]
        ]



{-
   Test: Char/fromCode
-}


charFromCodeTest : Test
charFromCodeTest =
    let
        func =
            fromCode

        uppers =
            [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' ]

        lowers =
            [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' ]

        symbols =
            [ '!', '"', '#', '$', '%', '&', '\'', '(', ')', '*', '+', ',', '-', '.', '/' ]

        decimalDigits =
            [ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' ]

        nonEnglishChars =
            [ '¥', '木', 'Ě' ]
    in
    describe "Char fromCode Tests"
        [ test "Upper Case Letters" <|
            \_ ->
                Expect.equalLists (List.map func (List.range 65 (65 + 25))) uppers
        , test "Lower Case Letters" <|
            \_ ->
                Expect.equalLists (List.map func (List.range 97 (97 + 25))) lowers
        , test "Symbols" <|
            \_ ->
                Expect.equalLists (List.map func (List.range 33 (33 + 14))) symbols
        , test "Decimal Digits" <|
            \_ ->
                Expect.equalLists (List.map func (List.range 48 (48 + 9))) decimalDigits
        , test "Non-English Characters" <|
            \_ ->
                Expect.equalLists (List.map func [ 165, 26408, 282 ]) nonEnglishChars
        ]


codeToCharToCode : Test
codeToCharToCode =
    describe "Unicode character code points roundtrip"
        [ test "Unicode Roundtrip starting at 32 (space)" <|
            \_ ->
                let
                    codePointsAsDecimal =
                        List.range 32 1032

                    roundTripped =
                        codePointsAsDecimal
                            |> List.map fromCode
                            |> List.map toCode
                in
                Expect.equalLists codePointsAsDecimal roundTripped
        ]
