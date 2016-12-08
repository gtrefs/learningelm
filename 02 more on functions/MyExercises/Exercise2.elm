module Main exposing (..)

import Html


(~=) : String -> String -> Bool
(~=) a b =
    let
        firstOfa =
            String.left 1 a

        firstOfb =
            String.left 1 b
    in
        firstOfa == firstOfb


main : Html.Html msg
main =
    ((~=) "Rello" "Hallo") |> toString |> Html.text
