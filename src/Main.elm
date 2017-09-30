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


item2 =
    TodoItem 2 "Clean litter box" False


initModel =
    [ { id = 1, description = "Take out trash", completed = False }
    , item2
    , TodoItem 3 "Finish meetup talk" True
    ]


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
        [ class "row container" ]
        [ sidebar
        , content
        ]


sidebar =
    div [ class "col-md-3" ] [ text "sidebar" ]


content =
    div [ class "col-md-9" ] [ singleItem item2 ]


singleItem item =
    let
        singleCheckBox item =
            input
                [ style [ ( "margin-right", "8px" ) ]
                , type_ "checkbox"
                , checked item.completed
                ]
                []
    in
        div [ class "alert alert-success" ]
            [ singleCheckBox item
            , text item.description
            ]
