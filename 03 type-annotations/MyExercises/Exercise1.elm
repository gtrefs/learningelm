module Main exposing (..)

import Html
import List


type alias Item =
    { name : String, qty : Int, freeQty : Int }


cart : List Item
cart =
    [ { name = "Lemon", qty = 1, freeQty = 0 }
    , { name = "Apple", qty = 5, freeQty = 0 }
    , { name = "Pear", qty = 10, freeQty = 0 }
    ]


freeItems : Int -> Int -> Item -> Item
freeItems qty freeQty item =
    if item.qty >= qty then
        { item | freeQty = freeQty }
    else
        item


main : Html.Html msg
main =
    List.map (freeItems 5 1 >> freeItems 10 3) cart |> toString |> Html.text
