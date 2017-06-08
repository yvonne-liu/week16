module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main =
    Html.beginnerProgram { model = model, view = view, update = update }



-- view : Model -> Html Msg


type alias Model =
    String


type Msg
    = ChangeView String


model =
    ""


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeView newView ->
            newView


view model =
    div []
        [ div [] [ choosePage model ]
        ]


choosePage model =
    case model of
        "" ->
            home model

        "options" ->
            options model

        _ ->
            div [] [ Html.text "Wrong place" ]



-- home : Model -> Html Msg


home model =
    div [ class "screen-container" ]
        [ div [ class "half-screen half-screen--options" ]
            [ button
                [ class "half-screen--button", onClick (ChangeView "options") ]
                [ text "my options" ]
            ]
        , div [ class "half-screen half-screen--monitor" ]
            [ button
                [ class "half-screen--button" ]
                [ text "my space" ]
            ]
        ]



-- options : Model -> Html Msg


options model =
    h1 [] [ text "Hi guys" ]
