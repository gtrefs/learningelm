module Main exposing (..)

import Html


longerThan : Int -> String -> Bool
longerThan i s =
    String.length s > i


longerThan10 : String -> Bool
longerThan10 =
    longerThan 10


toUpperIfLongerThan10 : String -> String
toUpperIfLongerThan10 s =
    if longerThan10 s then
        s |> String.toUpper
    else
        s


addNameAndLength : String -> String
addNameAndLength s =
    s ++ " - name length: " ++ toString (String.length s)


name : String
name =
    "foo bar"


main : Html.Html msg
main =
    toUpperIfLongerThan10 name |> addNameAndLength |> Html.text
