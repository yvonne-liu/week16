module BeginningElm exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


view model =
    div [ class "screen-container" ]
        [ div [ class "half-screen half-screen--options" ]
            [ button
                [ class "half-screen--button" ]
                [ text "my options" ]
            ]
        , div [ class "half-screen half-screen--monitor" ]
            [ button
                [ class "half-screen--button" ]
                [ text "my space" ]
            ]
        ]


main =
    view "homepage"
