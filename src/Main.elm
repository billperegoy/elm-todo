module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


main =
    div []
        [ div [ class "jumbotron" ]
            [ div [ class "container text-center" ]
                [ h1 [] [ text "Elm Todo List" ] ]
            ]
        , div
            [ class "row" ]
            [ div [ class "col-md-3" ] [ text "sidebar" ]
            , div [ class "col-md-9" ] [ text "main content" ]
            ]
        ]
