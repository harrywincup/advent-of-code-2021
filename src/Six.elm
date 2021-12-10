module Six exposing (main)

import Array exposing (Array)
import Binary
import Debug
import Dict exposing (Dict)
import Html exposing (text)



--input =
--    "3,4,3,1,2"


input =
    "1,1,1,2,1,5,1,1,2,1,4,1,4,1,1,1,1,1,1,4,1,1,1,1,4,1,1,5,1,3,1,2,1,1,1,2,1,1,1,4,1,1,3,1,5,1,1,1,1,3,5,5,2,1,1,1,2,1,1,1,1,1,1,1,1,5,4,1,1,1,1,1,3,1,1,2,4,4,1,1,1,1,1,1,3,1,1,1,1,5,1,3,1,5,1,2,1,1,5,1,1,1,5,3,3,1,4,1,3,1,3,1,1,1,1,3,1,4,1,1,1,1,1,2,1,1,1,4,2,1,1,5,1,1,1,2,1,1,1,1,1,1,1,1,2,1,1,1,1,1,5,1,1,1,1,3,1,1,1,1,1,3,4,1,2,1,3,2,1,1,2,1,1,1,1,4,1,1,1,1,4,1,1,1,1,1,2,1,1,4,1,1,1,5,3,2,2,1,1,3,1,5,1,5,1,1,1,1,1,5,1,4,1,2,1,1,1,1,2,1,3,1,1,1,1,1,1,2,1,1,1,3,1,4,3,1,4,1,3,2,1,1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,2,1,5,1,1,1,1,2,1,1,1,3,5,1,1,1,1,5,1,1,2,1,2,4,2,2,1,1,1,5,2,1,1,5,1,1,1,1,5,1,1,1,2,1"


type alias Age =
    Int


simulateDays : Int -> Int -> Array Int -> Array Int
simulateDays totalDays currentDay fish =
    case currentDay == totalDays + 1 of
        True ->
            fish

        False ->
            let
                nextGeneration =
                    fish
                        |> (\a -> ( Array.get 0 a |> Maybe.withDefault 0, Array.slice 1 (Array.length a) a ))
                        |> (\( reset, rest ) -> ( reset, Array.push reset rest ))
                        |> (\( reset, rest ) -> Array.set 6 (Array.get 6 rest |> Maybe.withDefault 0 |> (+) reset) rest)
                        |> Debug.log "next generation"
            in
            simulateDays totalDays (currentDay + 1) nextGeneration


main =
    let
        fish =
            input
                |> String.split ","
                |> List.map (String.toInt >> Maybe.withDefault 0)
                |> Debug.log "fish"

        population =
            Array.initialize 9 (always 0)
                |> Array.indexedMap
                    (\i _ ->
                        fish
                            |> List.filter (\a -> a == i)
                            |> List.length
                    )
                |> Debug.log "Initial population"
                |> simulateDays 256 1
                |> Array.foldl (+) 0
                |> Debug.log "Final population"
    in
    text "See console for results"
