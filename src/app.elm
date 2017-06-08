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
    { view : String }


type Msg
    = ChangeView String


model =
    { view = "" }


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeView newView ->
            { model | view = newView }


view model =
    div [ Html.Attributes.class "app-model" ]
        [ choosePage model ]


choosePage model =
    case model.view of
        "" ->
            home model

        "options" ->
            options model

        "contraceptiveTypes" ->
            contraceptiveTypes model

        "nonhormonal" ->
            nonhormonal model

        _ ->
            div [] [ Html.text "Wrong place" ]



-- home : Model -> Html Msg


home model =
    div [ Html.Attributes.class "screen-container" ]
        [ div [ Html.Attributes.class "half-screen half-screen--options" ]
            [ button
                [ Html.Attributes.class "half-screen--button", onClick (ChangeView "options") ]
                [ Html.text "What you must know about contraceptive methods" ]
            , div [] [ Html.text model.view ]
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
                [ Html.text "Are you "
                , span [ Html.Attributes.class "italics" ]
                    [ Html.text "comfortable " ]
                , code []
                    [ Html.text "with " ]
                , Html.text "your current choice of contraceptive? Do you "
                , span [ Html.Attributes.class "italics" ]
                    [ Html.text "know " ]
                , Html.text "all your options? Have you "
                , span [ Html.Attributes.class "italics" ]
                    [ Html.text "asked " ]
                , Html.text "all the right questions?"
                ]
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
            , p [ Html.Attributes.class "contraceptive-tag" ] [ Html.text "Contraceptive methods that don't utilise hormones to prevent pregnancy" ]
            ]
        , div [ Html.Attributes.class "half-screen half-screen--hormonal" ]
            [ button
                [ Html.Attributes.class "half-screen--button", onClick (ChangeView "hormonal") ]
                [ Html.text "Hormonal" ]
            , p [ Html.Attributes.class "contraceptive-tag" ] [ Html.text "Contraceptive methods that utilise hormones to prevent pregnancy" ]
            ]
        ]


nonhormonal model =
    div [ Html.Attributes.class "screen-container" ]
        [ appHeader
        , header [ Html.Attributes.class "contra-methods-header" ]
            [ h1 [] [ Html.text "CONTRACEPTIVE METHODS" ] ]
        , div [ Html.Attributes.class "contra-methods-tab-container" ]
            [ div [ Html.Attributes.class "contra-methods-tab" ]
                [ h2 [] [ Html.text "Non-hormonal" ] ]
            , div [ Html.Attributes.class "contra-methods-tab" ]
                [ h2 [] [ Html.text "Hormonal" ] ]
            ]
        , div [ Html.Attributes.class "contra-methods-container" ] (List.map sectionDiv nhMethods)
        ]


nhMethods =
    [ "Diaphragm", "Male Condom", "Female Condom", "IUD", "Natural Family Planning" ]


sectionDiv name =
    section [ Html.Attributes.class "contra-methods-item NH-Methods" ] [ Html.text name ]


appHeader =
    nav [ Html.Attributes.class "nav-container" ]
        [ div [ Html.Attributes.class "nav-container__svg nav-container__image" ]
            [ svg
                [ Svg.Attributes.class "svg-header", fill "none", attribute "stroke" "palevioletred", attribute "stroke-linejoin" "round", attribute "stroke-width" "2", viewBox "0 0 32 32" ]
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
            ]
        , div [ Html.Attributes.class "nav-container__svg nav-tracker-button" ]
            [ svg [ Svg.Attributes.class "calendar-header", fill "palevioletred", attribute "stroke" "palevioletred", attribute "stroke-width" "18", viewBox "0 0 1000 1000", attribute "x" "0px", attribute "xml:space" "preserve", attribute "y" "0px" ]
                [ g []
                    [ Svg.path [ d "M178.4,836.9h91.9c8.5,0,15.3-6.8,15.3-15.3V745c0-8.5-6.8-15.3-15.3-15.3h-91.9c-8.5,0-15.3,6.8-15.3,15.3v76.6C163.1,830,170,836.9,178.4,836.9z M193.8,760.3H255v45.9h-61.3V760.3z" ]
                        []
                    , Svg.path [ d "M362.2,836.9h91.9c8.5,0,15.3-6.8,15.3-15.3V745c0-8.5-6.8-15.3-15.3-15.3h-91.9c-8.5,0-15.3,6.8-15.3,15.3v76.6C346.9,830,353.7,836.9,362.2,836.9z M377.5,760.3h61.3v45.9h-61.3V760.3z" ]
                        []
                    , Svg.path [ d "M545.9,836.9h91.9c8.5,0,15.3-6.8,15.3-15.3V745c0-8.5-6.8-15.3-15.3-15.3h-91.9c-8.5,0-15.3,6.8-15.3,15.3v76.6C530.6,830,537.5,836.9,545.9,836.9z M561.3,760.3h61.3v45.9h-61.3V760.3z" ]
                        []
                    , Svg.path [ d "M178.4,668.4h91.9c8.5,0,15.3-6.8,15.3-15.3v-76.6c0-8.5-6.8-15.3-15.3-15.3h-91.9c-8.5,0-15.3,6.8-15.3,15.3v76.6C163.1,661.6,170,668.4,178.4,668.4z M193.8,591.9H255v45.9h-61.3V591.9z" ]
                        []
                    , Svg.path [ d "M362.2,668.4h91.9c8.5,0,15.3-6.8,15.3-15.3v-76.6c0-8.5-6.8-15.3-15.3-15.3h-91.9c-8.5,0-15.3,6.8-15.3,15.3v76.6C346.9,661.6,353.7,668.4,362.2,668.4z M377.5,591.9h61.3v45.9h-61.3V591.9z" ]
                        []
                    , Svg.path [ d "M545.9,668.4h91.9c8.5,0,15.3-6.8,15.3-15.3v-76.6c0-8.5-6.8-15.3-15.3-15.3h-91.9c-8.5,0-15.3,6.8-15.3,15.3v76.6C530.6,661.6,537.5,668.4,545.9,668.4z M561.3,591.9h61.3v45.9h-61.3V591.9z" ]
                        []
                    , Svg.path [ d "M729.7,668.4h91.9c8.5,0,15.3-6.8,15.3-15.3v-76.6c0-8.5-6.8-15.3-15.3-15.3h-91.9c-8.5,0-15.3,6.8-15.3,15.3v76.6C714.4,661.6,721.2,668.4,729.7,668.4z M745,591.9h61.3v45.9H745V591.9z" ]
                        []
                    , Svg.path [ d "M178.4,500h91.9c8.5,0,15.3-6.8,15.3-15.3v-76.6c0-8.5-6.8-15.3-15.3-15.3h-91.9c-8.5,0-15.3,6.8-15.3,15.3v76.6C163.1,493.2,170,500,178.4,500z M193.8,423.4H255v45.9h-61.3V423.4z" ]
                        []
                    , Svg.path [ d "M362.2,500h91.9c8.5,0,15.3-6.8,15.3-15.3v-76.6c0-8.5-6.8-15.3-15.3-15.3h-91.9c-8.5,0-15.3,6.8-15.3,15.3v76.6C346.9,493.2,353.7,500,362.2,500z M377.5,423.4h61.3v45.9h-61.3V423.4z" ]
                        []
                    , Svg.path [ d "M545.9,500h91.9c8.5,0,15.3-6.8,15.3-15.3v-76.6c0-8.5-6.8-15.3-15.3-15.3h-91.9c-8.5,0-15.3,6.8-15.3,15.3v76.6C530.6,493.2,537.5,500,545.9,500z M561.3,423.4h61.3v45.9h-61.3V423.4z" ]
                        []
                    , Svg.path [ d "M729.7,500h91.9c8.5,0,15.3-6.8,15.3-15.3v-76.6c0-8.5-6.8-15.3-15.3-15.3h-91.9c-8.5,0-15.3,6.8-15.3,15.3v76.6C714.4,493.2,721.2,500,729.7,500z M745,423.4h61.3v45.9H745V423.4z" ]
                        []
                    , Svg.path [ d "M928.8,71.3H821.6V55.9c0-25.4-20.6-45.9-45.9-45.9s-45.9,20.6-45.9,45.9v15.3H270.3V55.9c0-25.4-20.6-45.9-45.9-45.9s-45.9,20.6-45.9,45.9v15.3H71.3C37.4,71.3,10,98.6,10,132.5v796.3c0,33.9,27.4,61.3,61.3,61.3h857.5c33.9,0,61.3-27.4,61.3-61.3V132.5C990,98.6,962.6,71.3,928.8,71.3z M760.3,55.9c0-8.5,6.8-15.3,15.3-15.3s15.3,6.8,15.3,15.3v45.9v61.3c0,8.5-6.8,15.3-15.3,15.3s-15.3-6.8-15.3-15.3v-61.3V55.9z M209.1,55.9c0-8.5,6.8-15.3,15.3-15.3s15.3,6.8,15.3,15.3v45.9v61.3c0,8.5-6.8,15.3-15.3,15.3s-15.3-6.8-15.3-15.3v-61.3V55.9z M959.4,928.8c0,16.9-13.7,30.6-30.6,30.6H71.3c-16.9,0-30.6-13.7-30.6-30.6V270.3h918.8V928.8z M959.4,239.7H40.6V132.5c0-16.9,13.7-30.6,30.6-30.6h107.2v61.3c0,25.4,20.6,45.9,45.9,45.9s45.9-20.6,45.9-45.9v-61.3h459.4v61.3c0,25.4,20.6,45.9,45.9,45.9s45.9-20.6,45.9-45.9v-61.3h107.2c16.9,0,30.6,13.7,30.6,30.6V239.7z" ]
                        []
                    ]
                ]
            ]
        ]
