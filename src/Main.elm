module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


main =
    div []
        [ header
        , mainBody
        ]


header =
    div [ class "jumbotron" ]
        [ div [ class "container text-center" ]
            [ h1 [] [ text "Elm Todo List" ] ]
        ]


mainBody =
    div
        [ class "row" ]
        [ sidebar
        , content
        ]


sidebar =
    div [ class "col-md-3" ] [ text "sidebar" ]


content =
    div [ class "col-md-9" ] [ text "main content" ]
