module BeginningElm exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


view model =
    div [ class "screen-container" ]
        [ div [ class "half-screen-btn half-screen-btn--options" ]
            [ button [] [ text "My contraceptive options" ] ]
        , div
            [ class "half-screen-btn half-screen-btn--monitor" ]
            [ button [] [ text "My contraceptives monitor" ] ]
        ]


main =
    view "dummy model"



-- why main = view?
