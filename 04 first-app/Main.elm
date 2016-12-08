module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String exposing (toInt)


-- model


type alias Model =
    { inputValue : Int, calories : Int }


initModel : Model
initModel =
    { inputValue = 0, calories = 0 }



-- update


type Msg
    = AddCalorie Int
    | SetInputValue Int
    | Clear


update : Msg -> Model -> Model
update msg model =
    case msg of
        SetInputValue i ->
            { model | inputValue = i }

        AddCalorie i ->
            { model | calories = model.calories + model.inputValue }

        Clear ->
            initModel



-- view


zeroCaloriesIfNotNumber : String -> Int
zeroCaloriesIfNotNumber v =
    case toInt v of
        Err msg ->
            0

        Ok val ->
            val


view : Model -> Html Msg
view model =
    div []
        [ h3 []
            [ text ("Total Calories: " ++ (toString model.calories)) ]
        , input [ placeholder "Number of calories", onInput (\v -> SetInputValue (zeroCaloriesIfNotNumber v)) ] []
        , p [] []
        , button
            [ type_ "button"
            , onClick (AddCalorie model.inputValue)
            ]
            [ text "Add"
            ]
        , button
            [ type_ "button"
            , onClick Clear
            ]
            [ text "Clear" ]
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initModel
        , update = update
        , view = view
        }
