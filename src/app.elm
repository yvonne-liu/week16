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



-- contraceptiveTypes : Model -> Html Msg


contraceptiveTypes model =
    div [ class "screen-container" ]
        [ appHeader
        , div
            [ class "half-screen half-screen--non-hormonal" ]
            [ button
                [ class "half-screen--button", onClick (ChangeView "nonhormonal") ]
                [ text "Non-hormonal" ]
            ]
        , div [ class "half-screen half-screen--hormonal" ]
            [ button
                [ class "half-screen--button", onClick (ChangeView "hormonal") ]
                [ text "Hormonal" ]
            , p [] [ text "Contraceptive methods that utilise hormones to prevent pregnancy" ]
            ]
        ]


nonhormonal model =
    div [ class "screen-container" ]
        [ appHeader ]


appHeader =
    nav [ class "nav-container" ]
        [ div [ class "nav-container__image" ]
            [ img [ class "nav-image", src "http://via.placeholder.com/50x50" ] []
            ]
        , div [ class "nav-tracker-button" ]
            [ a [ class "nav-tracker-button__link", href "#" ]
                [ text "My tracker" ]
            ]
        ]



-- options : Model -> Html Msg


options model =
    h1 [] [ text "Hi guys" ]
