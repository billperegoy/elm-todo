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


initModel =
    { nextId = 4
    , items =
        [ TodoItem 1 "Take out trash" False
        , TodoItem 2 "Clean litter box" False
        , TodoItem 3 "Finish meetup talk" True
        ]
    }


main =
    div []
        [ header
        , mainBody initModel
        ]


header =
    div [ class "jumbotron" ]
        [ div [ class "container text-center" ]
            [ h1 [] [ text "Elm Todo List" ] ]
        ]


mainBody model =
    div
        [ class "row container" ]
        [ sidebar
        , content model
        ]


sidebar =
    div [ class "col-md-3" ] [ text "sidebar" ]


content model =
    div [ class "col-md-9" ]
        (List.map
            (\item -> singleItem item)
            model.items
        )


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
