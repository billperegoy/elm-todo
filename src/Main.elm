module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias TodoItem =
    { id : Int
    , description : String
    , completed : Bool
    }


type alias Model =
    { nextId : Int
    , inputText : String
    , items : List TodoItem
    }


type Msg
    = UpdateTodoInput String
    | CreateTodo
    | ProcessCheckBox Int Bool


main =
    Html.beginnerProgram
        { model = initModel
        , update = update
        , view = view
        }


initModel =
    { nextId = 4
    , inputText = ""
    , items =
        [ TodoItem 1 "Take out trash" False
        , TodoItem 2 "Clean litter box" False
        , TodoItem 3 "Finish meetup talk" True
        ]
    }


update msg model =
    case msg of
        UpdateTodoInput value ->
            { model | inputText = value }

        CreateTodo ->
            let
                newTodo =
                    TodoItem model.nextId model.inputText False
            in
                { model
                    | inputText = ""
                    , nextId = model.nextId + 1
                    , items = newTodo :: model.items
                }

        ProcessCheckBox id value ->
            let
                newItems =
                    List.map (\item -> setCheckBoxValue item id value) model.items
            in
                { model | items = newItems }


setCheckBoxValue item id value =
    if item.id == id then
        { item | completed = value }
    else
        item


view model =
    div []
        [ header
        , mainBody model
        ]


header =
    div [ class "jumbotron" ]
        [ div [ class "container text-center" ]
            [ h1 [] [ text "Elm Todo List" ] ]
        ]


mainBody model =
    div
        [ class "row container" ]
        [ sidebar model
        , content model
        ]


sidebar model =
    div [ class "col-md-3" ]
        [ div []
            [ text "New Todo"
            , input
                [ value model.inputText
                , onInput UpdateTodoInput
                , style [ ( "margin-bottom", "10px" ) ]
                ]
                []
            , button
                [ onClick CreateTodo
                , class "btn btn-success"
                ]
                [ text "Submit" ]
            ]
        ]


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
                , onCheck (ProcessCheckBox item.id)
                , type_ "checkbox"
                , checked item.completed
                ]
                []
    in
        div [ class "alert alert-success", (itemStyle item) ]
            [ singleCheckBox item
            , text item.description
            ]


itemStyle item =
    if (Debug.log "completed:" item.completed) then
        style [ ( "margin-right", "8px" ), ( "text-decoration", "line-through" ) ]
    else
        style [ ( "margin-right", "8px" ) ]
