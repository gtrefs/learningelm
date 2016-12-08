module Main exposing (..)

import Html


wordCount : String -> Int
wordCount =
    String.words >> List.length


main : Html.Html msg
main =
    "Hello Rello Schmello Fellow Geilo" |> wordCount |> toString |> Html.text
