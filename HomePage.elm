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



--contraceptiveTypes : Model -> Html Msg


contraceptiveTypes model =
    div [ class "screen-container" ]
        [ elmHubHeader
        , div
            [ class "half-screen half-screen--non-hormonal" ]
            [ button
                [ class "half-screen--button" ]
                [ text "Non-hormonal" ]
            ]
        , div [ class "half-screen half-screen--hormonal" ]
            [ button
                [ class "half-screen--button" ]
                [ text "Hormonal" ]
            , p [] [ text "Contraceptive methods that utilise hormones to prevent pregnancy" ]
            ]
        ]


elmHubHeader =
    nav [ class "nav-container" ]
        [ div [ class "nav-container__image" ]
            [ img [ class "nav-image", src "http://via.placeholder.com/50x50" ] []
            ]
        , div [ class "nav-tracker-button" ]
            [ a [ class "nav-tracker-button__link", href "#" ]
                [ text "My tracker" ]
            ]
        ]


main =
    contraceptiveTypes "homepage"
