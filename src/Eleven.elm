module Eleven exposing (main)

import Array exposing (Array)
import Debug
import Html exposing (text)



-- Test input


input =
    "5483143223 2745854711 5264556173 6141336146 6357385478 4167524645 2176841721 6882881134 4846848554 5283751526"



--input =
--    "5483143223 2745854711 5264556173 6141336146 6357385478 4167524645 2176841721 6882881134 4846848554 5283751526"
-- Real input
--input = "2478668324 4283474125 1663463374 1738271323 4285744861 3551311515 8574335438 7843525826 1366237577 3554687226"


type alias Octopuses =
    Array Octopus


type alias Octopus =
    { index : Int
    , x : Int
    , y : Int
    , energy : Int
    , hasFlashed : Bool
    }


rowWidth =
    10


getOctoIndex : Octopus -> Int
getOctoIndex o =
    getIndexForCoords o.x o.y rowWidth


getIndexForCoords : Int -> Int -> Int -> Int
getIndexForCoords x y w =
    (y * w) + x


getAdjacentCoords : Int -> Int -> List ( Int, Int )
getAdjacentCoords x y =
    [ ( x - 1, y - 1 ) -- Top left
    , ( x - 0, y - 1 ) -- Top middle
    , ( x + 1, y - 1 ) -- Top right
    , ( x - 1, y - 0 ) -- Left middle
    , ( x + 1, y - 0 ) -- Right middle
    , ( x - 1, y + 1 ) -- Bottom left
    , ( x - 0, y + 1 ) -- Bottom middle
    , ( x + 1, y + 1 ) -- Bottom right
    ]


getAdjacentOctoIndices : Octopuses -> Octopus -> List Int
getAdjacentOctoIndices allOctos octo =
    allOctos
        |> Array.filter
            (\o ->
                List.member ( o.x, o.y ) (getAdjacentCoords octo.x octo.y)
            )
        |> Array.map .index
        |> Array.toList


setFlashed : Bool -> Octopus -> Octopus
setFlashed f o =
    { o
        | hasFlashed = f
    }


bumpEnergy : Int -> Octopus -> Octopus
bumpEnergy amount o =
    { o
        | energy = o.energy + amount
    }


isReadyToFlash : Octopus -> Bool
isReadyToFlash o =
    o.energy > 9 && o.hasFlashed == False


invalidOctopus =
    { index = -1
    , energy = -1
    , x = -1
    , y = -1
    , hasFlashed = False
    }


gainEnergy : List Int -> Octopuses -> Int -> ( Int, Octopuses )
gainEnergy octoIDsToGain allOctos flashCount =
    let
        energizedOctos =
            allOctos
                |> Array.map
                    (\o ->
                        if List.member o.index octoIDsToGain then
                            bumpEnergy 1 o

                        else
                            o
                    )
    in
    energizedOctos
        |> Array.foldl
            (\octo acc ->
                --if isReadyToFlash octo then
                let
                    o =
                        acc
                            |> Tuple.second
                            |> Array.get octo.index
                            |> Maybe.withDefault { index = -1, energy = -1, x = -1, y = -1, hasFlashed = False }
                in
                --if (Array.get octo.index (Tuple.second acc) |> Maybe.map .hasFlashed |> Maybe.withDefault False) then
                if isReadyToFlash o then
                    let
                        flashedOctos =
                            Array.set octo.index (setFlashed True octo) (Tuple.second acc)

                        --|> Debug.log "should keep going here"
                        adjacentIndices =
                            getAdjacentOctoIndices (Tuple.second acc) octo
                    in
                    gainEnergy adjacentIndices flashedOctos (Tuple.first acc + 1)
                    --|> Debug.log "what"

                else
                    acc
            )
            ( flashCount, energizedOctos )


resetEnergy : Octopus -> Octopus
resetEnergy o =
    case o.hasFlashed of
        True ->
            { o
                | energy = 0
                , hasFlashed = False
            }
                |> Debug.log ("resetEnergy" ++ Debug.toString o.index)

        False ->
            o


countFlashesForSteps : Int -> Int -> Int -> Octopuses -> Int
countFlashesForSteps step steps flashCount octos =
    case step > steps of
        True ->
            flashCount
                |> Debug.log "Final Flash Count"

        False ->
            let
                octoStates =
                    gainEnergy (Array.toList <| Array.map .index octos) octos flashCount
                        |> Tuple.mapSecond (Array.map resetEnergy)
            in
            countFlashesForSteps (step + 1) steps (flashCount + Tuple.first octoStates) (Tuple.second octoStates)


main =
    let
        octos =
            input
                |> String.words
                |> List.indexedMap
                    (\y line ->
                        line
                            |> String.toList
                            |> List.indexedMap (\x n -> Octopus (getIndexForCoords x y rowWidth) x y (n |> String.fromChar |> String.toInt |> Maybe.withDefault -1) False)
                    )
                |> List.concat
                |> Array.fromList
                |> Debug.log "octos"

        partOne =
            countFlashesForSteps 1 10 0 octos
                |> Debug.log "partOne"
    in
    text "See console for results"
