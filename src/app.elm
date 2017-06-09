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
    { view : String, hormonalOptions : String }


type Msg
    = ChangeView String
    | ChangeOptions String
    | ChangeOptionsAndView String String


model =
    { view = "", hormonalOptions = "" }


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeView newView ->
            { model | view = newView }

        ChangeOptions options ->
            { model | hormonalOptions = options }

        ChangeOptionsAndView view options ->
            { model | view = view, hormonalOptions = options }


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

        "contraceptiveMethods" ->
            contraceptiveMethods model

        "hardcodeIUD" ->
            hardcodeIUD model

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
                [ Html.Attributes.class "half-screen--button", onClick (ChangeOptionsAndView "contraceptiveMethods" "nonhormonal") ]
                [ Html.text "Non-hormonal" ]
            , p [ Html.Attributes.class "contraceptive-tag" ] [ Html.text "Contraceptive methods that don't utilise hormones to prevent pregnancy" ]
            ]
        , div [ Html.Attributes.class "half-screen half-screen--hormonal" ]
            [ button
                [ Html.Attributes.class "half-screen--button", onClick (ChangeOptionsAndView "contraceptiveMethods" "hormonal") ]
                [ Html.text "Hormonal" ]
            , p [ Html.Attributes.class "contraceptive-tag" ] [ Html.text "Contraceptive methods that utilise hormones to prevent pregnancy" ]
            ]
        ]


contraceptiveMethods model =
    div [ Html.Attributes.class "screen-container" ]
        [ appHeader
        , header [ Html.Attributes.class "contra-methods-header" ]
            [ h1 [] [ Html.text "CONTRACEPTIVE METHODS" ] ]
        , div [ Html.Attributes.class "contra-methods-tab-container" ]
            [ div [ Html.Attributes.class "contra-methods-tab" ]
                [ h2 [ onClick <| ChangeOptions "nonhormonal" ] [ Html.text "Non-hormonal" ] ]
            , div [ Html.Attributes.class "contra-methods-tab" ]
                [ h2 [ onClick <| ChangeOptions "hormonal" ] [ Html.text "Hormonal" ] ]
            ]
        , hormonalOptions model
        ]


hormonalOptions model =
    case model.hormonalOptions of
        "hormonal" ->
            div [ Html.Attributes.class "contra-methods-container" ] (List.map hormonalMethodsDisplay hormonalMethodsList)

        "nonhormonal" ->
            div [ Html.Attributes.class "contra-methods-container" ]
                (List.map nonhormonalMethodsDisplay nonhormonalMethodsList)

        _ ->
            div [] []


nonhormonalMethodsList =
    [ "Diaphragm", "Male Condom", "Female Condom", "IUD", "Natural Family Planning" ]


hormonalMethodsList =
    [ "Contraceptive injection", "Implant", "Intrauterine system (IUS)", "Contraceptive patch", "Contraceptive vaginal ring", "Combined pill (COC)", "Progestogen-only pill(POP)" ]


nonhormonalMethodsDisplay name =
    section [ Html.Attributes.class "contra-methods-item NH-Methods", onClick (ChangeView "hardcodeIUD") ] [ Html.text name ]


hormonalMethodsDisplay name =
    section [ Html.Attributes.class "contra-methods-item H-methods", onClick (ChangeView "hardcodeIUD") ]
        [ Html.text name ]


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


hardcodeIUD model =
    div [ Html.Attributes.class "screen-container" ]
        [ appHeader
        , div [ Html.Attributes.class "full-screen" ]
            [ div [ Html.Attributes.class "method-title" ]
                [ p [ Html.Attributes.class "full-screen__method" ]
                    [ Html.text "IUD (INTRAUTERINE DEVICE)"
                    ]
                , svg [ Svg.Attributes.class "iud-svg", attribute "enable-background" "new 0 0 100 100", attribute "version" "1.1", viewBox "0 0 100 125", attribute "x" "0px", attribute "xml:space" "preserve", attribute "stroke" "white", attribute "y" "0px" ]
                    [ g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "22" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "24" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "26" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "28" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "30" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "32" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "34" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "36" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "38" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "40" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "42" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "44" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "46" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "48" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "50" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "52" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "54" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "56" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "58" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "60" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "62" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "64" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "66" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "68" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "70" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "72" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "74" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "76" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "78" ]
                            []
                        ]
                    , g []
                        [ Svg.node "rect"
                            [ attribute "height" "1", attribute "width" "8", attribute "x" "47", attribute "y" "80" ]
                            []
                        ]
                    , g []
                        [ Svg.path [ d "M34,17.5", fill "#FFFFFF", attribute "stroke" "#FFFFFF", attribute "stroke-miterlimit" "10" ]
                            []
                        ]
                    , g []
                        [ Svg.path [ d "M51.059,92.896c-1.312,0-2.381-1.068-2.381-2.381s1.068-2.381,2.381-2.381c0.202,0,0.402,0.025,0.595,0.075l-0.15,0.58   c-0.144-0.037-0.293-0.056-0.444-0.056c-0.982,0-1.781,0.799-1.781,1.781s0.799,1.781,1.781,1.781s1.781-0.799,1.781-1.781   c0-0.322-0.087-0.639-0.252-0.915l0.516-0.307c0.22,0.368,0.336,0.791,0.336,1.222C53.439,91.828,52.371,92.896,51.059,92.896z" ]
                            []
                        ]
                    , g []
                        [ Svg.path [ d "M65.233,95.904c-0.539,0-1.086-0.011-1.637-0.034c-2.795-0.115-5.446-0.512-7.668-1.148l0.221-0.77   c2.161,0.619,4.748,1.007,7.48,1.119c3.39,0.138,6.599-0.164,9.021-0.854c2.218-0.632,3.563-1.559,3.602-2.479   s-1.228-1.955-3.385-2.767c-2.357-0.887-5.526-1.452-8.922-1.593c-7.344-0.305-12.548,1.515-12.623,3.335   c-0.01,0.264,0.079,0.528,0.272,0.807l-0.656,0.457c-0.293-0.421-0.433-0.856-0.415-1.296c0.121-2.91,6.933-4.378,13.455-4.102   c3.479,0.144,6.735,0.727,9.17,1.643c2.571,0.968,3.958,2.229,3.902,3.549c-0.054,1.32-1.538,2.463-4.181,3.216   C70.765,95.587,68.099,95.904,65.233,95.904z" ]
                            []
                        ]
                    , g []
                        [ Svg.path [ d "M51.051,96.45c-3.25,0-5.895-2.645-5.895-5.896c0-1.598,0.669-3.135,1.844-4.252V82h1v4.748l-0.169,0.149   c-1.064,0.938-1.675,2.271-1.675,3.657c0,2.699,2.195,4.896,4.895,4.896s4.896-2.196,4.896-4.896c0-0.615-0.111-1.142-0.372-1.761   l0.922-0.389c0.312,0.74,0.45,1.403,0.45,2.149C56.946,93.806,54.302,96.45,51.051,96.45z" ]
                            []
                        ]
                    , g []
                        [ Svg.path [ d "M30.274,53.164c-0.47,0-0.986-0.05-1.556-0.164c-1.992-0.398-2.478-1.315-2.535-2.014   c-0.103-1.266,1.202-2.645,2.345-3.266c-0.412-1.217-0.768-2.438-1.06-3.64c-0.195-0.027-0.315-0.063-0.599-0.152l-0.401-0.124   c-1.877-0.567-2.303-1.484-2.329-2.153c-0.05-1.267,1.309-2.464,2.418-3.015c-0.087-1.032-0.121-2.081-0.102-3.128   c-0.037-0.001-0.082,0.001-0.153,0.006c-0.215,0.016-0.54,0.037-1.022-0.12c-1.952-0.634-2.068-1.835-1.965-2.495   c0.276-1.744,2.628-3.58,4.021-3.862c0.32-1.21,0.726-2.39,1.207-3.517c-0.478-0.217-0.957-0.503-1.429-0.857   c-1.301-0.972-1.267-1.91-1.008-2.526c0.771-1.84,4.849-3.07,6.398-3.028c0.521-0.623,1.071-1.224,1.642-1.795   c-0.376-0.25-0.722-0.537-1.048-0.87c-0.914-0.93-1.194-1.792-0.833-2.562c1.06-2.254,7.632-2.244,9.203-2.14   c0.928-0.381,3.414-1.4,3.572-1.454l2.484-0.683c0.43-0.964,1.6-2.44,3.624-2.44s3.194,1.476,3.624,2.44l2.456,0.674   c0.186,0.062,2.673,1.082,3.601,1.462c1.571-0.105,8.145-0.115,9.203,2.14c0.361,0.77,0.081,1.632-0.833,2.562   c-0.326,0.332-0.672,0.62-1.048,0.869c0.57,0.571,1.12,1.172,1.642,1.795c1.562-0.046,5.627,1.188,6.398,3.028   c0.259,0.616,0.293,1.554-1.008,2.526c-0.472,0.354-0.951,0.64-1.429,0.857c0.482,1.129,0.889,2.312,1.21,3.526   c1.442,0.313,3.745,2.128,4.019,3.853c0.104,0.66-0.013,1.861-1.965,2.495c-0.482,0.157-0.808,0.135-1.022,0.12   c-0.071-0.004-0.116-0.007-0.153-0.006c0.02,1.047-0.015,2.097-0.102,3.128c1.109,0.551,2.468,1.748,2.418,3.015   c-0.026,0.669-0.452,1.585-2.329,2.153l-0.401,0.124c-0.283,0.089-0.403,0.125-0.599,0.152c-0.292,1.202-0.647,2.423-1.06,3.64   c1.143,0.621,2.447,2,2.345,3.266c-0.058,0.699-0.543,1.616-2.535,2.014c-2.875,0.576-4.434-0.479-5.233-1.467   c-0.979-0.918-1.361-2.337-0.98-3.747c3.16-7.764,3.437-14.557,0.839-20.249c-3.636-7.966-11.837-11.186-12.779-11.533   C55.187,16.041,55,16.249,55,16.5V21h-1v-4.5c0-0.827,0.673-1.5,1.5-1.5l0.16,0.026c0.383,0.129,9.425,3.275,13.452,12.086   c2.721,5.954,2.452,13.017-0.799,20.993c-0.116,0.445-0.315,1.726,0.768,2.75c0.953,1.173,2.39,1.549,4.304,1.164   c0.763-0.152,1.683-0.47,1.735-1.115c0.07-0.867-1.267-2.124-2.143-2.454l-0.457-0.172l0.161-0.461   c0.504-1.441,0.928-2.892,1.259-4.312l0.083-0.353l0.36-0.032c0.386-0.034,0.386-0.034,0.748-0.147l0.411-0.127   c0.725-0.219,1.594-0.611,1.618-1.235c0.03-0.758-1.12-1.805-2.13-2.2l-0.353-0.138l0.036-0.376   c0.117-1.209,0.158-2.447,0.123-3.681l-0.008-0.279l0.307-0.196c0.384-0.265,0.684-0.245,0.93-0.227   c0.178,0.012,0.346,0.024,0.646-0.074c1.432-0.465,1.321-1.159,1.285-1.387C77.777,31.665,75.44,30,74.625,30h-0.39l-0.153-0.378   c-0.352-1.402-0.821-2.765-1.395-4.049l-0.221-0.496l0.456-0.297c0.548-0.192,1.107-0.5,1.664-0.917   c0.949-0.708,0.75-1.183,0.685-1.339c-0.573-1.368-4.394-2.511-5.5-2.413l-0.28,0.14l-0.29-0.29   c-0.689-0.84-1.432-1.642-2.208-2.383l-0.503-0.48l0.616-0.324c0.516-0.271,0.967-0.607,1.382-1.029   c0.406-0.414,0.847-0.998,0.641-1.437c-0.635-1.351-5.762-1.776-8.337-1.559l-0.12,0.01l-0.111-0.046   c-1.373-0.563-3.471-1.421-3.625-1.477l-2.918-0.799l-0.087-0.249c-0.029-0.083-0.738-2.021-2.78-2.021s-2.751,1.938-2.78,2.021   l-0.087,0.247l-2.949,0.811c-0.123,0.046-2.221,0.904-3.594,1.467l-0.111,0.046l-0.12-0.01c-2.574-0.215-7.702,0.208-8.337,1.559   c-0.206,0.439,0.234,1.023,0.641,1.437c0.415,0.422,0.866,0.759,1.382,1.029l0.616,0.324l-0.503,0.48   c-0.776,0.742-1.519,1.543-2.208,2.383l-0.253,0.309l-0.317-0.158c-1.092-0.095-4.927,1.045-5.5,2.413   c-0.065,0.156-0.265,0.63,0.684,1.339c0.558,0.416,1.117,0.724,1.665,0.917l0.511,0.179l-0.275,0.614   c-0.573,1.285-1.043,2.647-1.395,4.049L28.123,30h-0.39c-0.873,0-3.21,1.665-3.43,3.056c-0.036,0.228-0.146,0.922,1.285,1.387   c0.3,0.098,0.468,0.085,0.646,0.074c0.24-0.017,0.541-0.038,0.926,0.224l0.311,0.199l-0.008,0.279   c-0.035,1.233,0.006,2.472,0.123,3.681l0.036,0.376l-0.353,0.138c-1.01,0.395-2.16,1.441-2.13,2.2   c0.024,0.624,0.894,1.016,1.618,1.235l0.411,0.127c0.362,0.114,0.362,0.114,0.748,0.147l0.36,0.032l0.083,0.353   c0.331,1.419,0.755,2.87,1.259,4.312l0.161,0.461l-0.457,0.172c-0.876,0.331-2.213,1.587-2.143,2.454   c0.053,0.645,0.973,0.962,1.735,1.115c1.916,0.387,3.35,0.01,4.259-1.115c1.128-1.073,0.929-2.354,0.793-2.857   c-3.242-7.943-3.518-15.025-0.798-20.991c3.996-8.768,12.94-11.9,13.319-12.029L46.65,15c0.795,0,1.35,0.617,1.35,1.5V21h-1v-4.5   c0-0.138-0.029-0.446-0.279-0.494c-0.953,0.354-9.044,3.561-12.646,11.475c-2.596,5.703-2.313,12.515,0.838,20.247   c0.4,1.468,0.018,2.887-1.006,3.854C33.303,52.335,32.181,53.164,30.274,53.164z" ]
                            []
                        ]
                    , g []
                        [ Svg.path [ d "M54.485,87.232c-0.072-0.074-0.144-0.175-0.213-0.278c-0.03-0.047-0.076-0.116-0.097-0.137l-0.151-0.146L54,86.438V82h1   v4.247c0.039,0.053,0.074,0.105,0.107,0.155c0.029,0.046,0.057,0.093,0.089,0.126L54.485,87.232z" ]
                            []
                        ]
                    ]
                ]
            , p [ Html.Attributes.class "method-description" ] [ Html.text "IUD is non-hormonal, and is suitable for women who want long-acting reversible contraception for up to 5 or 10 years and wish to avoid daily, weekly or monthly regimen. Users are at a small risk of infection at insertion and of expulsion, and it does not protect against HIV infection (AIDS) and other sexually transmitted infections (STIs)." ]
            ]
        , button
            [ Html.Attributes.class "full-screen__button", onClick (ChangeView "contraceptiveMethods") ]
            [ Html.text "Back to options" ]
        ]
