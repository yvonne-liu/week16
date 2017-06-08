module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


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

        "contraceptiveTypes" ->
            contraceptiveTypes model

        _ ->
            div [] [ Html.text "Wrong place" ]



-- home : Model -> Html Msg


home model =
    div [ Html.Attributes.class "screen-container" ]
        [ div [ Html.Attributes.class "half-screen half-screen--options" ]
            [ button
                [ Html.Attributes.class "half-screen--button", onClick (ChangeView "options") ]
                [ Html.text "What you must know about contraceptive methods" ]
            ]
        , svg
            [ Svg.Attributes.class "svg-home", fill "none", attribute "stroke" "white", attribute "stroke-linejoin" "round", attribute "stroke-width" "2", viewBox "0 0 32 32" ]
            [ Svg.node "circle"
                [ attribute "cx" "5", attribute "cy" "6", attribute "r" "4" ]
                []
            , Html.text " "
            , Svg.node "circle"
                [ attribute "cx" "27", attribute "cy" "6", attribute "r" "4" ]
                []
            , Html.text " "
            , Svg.path [ d "M10 8 L22 8 L16 30 z" ]
                []
            , Html.text " "
            ]
        , div [ Html.Attributes.class "half-screen half-screen--monitor" ]
            [ button
                [ Html.Attributes.class "half-screen--button" ]
                [ Html.text "My Contraception Calendar" ]
            ]
        ]



-- options : Model -> Html Msg


options model =
    div [ Html.Attributes.class "screen-container" ]
        [ appHeader
        , div [ Html.Attributes.class "full-screen" ]
            [ p [ Html.Attributes.class "full-screen__text" ]
                [ Html.text "Are you comfortable with your current choice of contraceptive? Do you know all your options? Have you asked all the right questions?" ]
            , button
                [ Html.Attributes.class "full-screen__button", onClick (ChangeView "contraceptiveTypes") ]
                [ Html.text "Learn about your contraceptive choices" ]
            ]
        ]



-- contraceptiveTypes : Model -> Html Msg


contraceptiveTypes model =
    div [ Html.Attributes.class "screen-container" ]
        [ appHeader
        , div
            [ Html.Attributes.class "half-screen half-screen--non-hormonal" ]
            [ button
                [ Html.Attributes.class "half-screen--button", onClick (ChangeView "nonhormonal") ]
                [ Html.text "Non-hormonal" ]
            , p [] [ Html.text "Contraceptive methods that don't utilise hormones to prevent pregnancy" ]
            ]
        , div [ Html.Attributes.class "half-screen half-screen--hormonal" ]
            [ button
                [ Html.Attributes.class "half-screen--button", onClick (ChangeView "hormonal") ]
                [ Html.text "Hormonal" ]
            , p [] [ Html.text "Contraceptive methods that utilise hormones to prevent pregnancy" ]
            ]
        ]


nonhormonal model =
    div [ Html.Attributes.class "screen-container" ]
        [ appHeader
        , h1 [] [ Html.text "CONTRACEPTIVE METHODS" ]
        ]


appHeader =
    nav [ Html.Attributes.class "nav-container" ]
        [ div [ Html.Attributes.class "nav-container__image" ]
            [ img [ Html.Attributes.class "nav-image", src "http://via.placeholder.com/50x50" ] []
            ]
        , div [ Html.Attributes.class "nav-tracker-button" ]
            [ Html.a [ Html.Attributes.class "nav-tracker-button__link", href "#" ]
                [ Html.text "My tracker" ]
            ]
        ]
