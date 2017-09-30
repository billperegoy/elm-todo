module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias TodoItem =
    { id : Int
    , description : String
    , completed : Bool
    }


type alias Model =
    { nextId : Int
    , items : List TodoItem
    }


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
