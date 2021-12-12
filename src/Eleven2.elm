module Eleven2 exposing (main)

import Array exposing (Array)
import Debug
import Html exposing (text)



-- Test input


input =
    "5483143223 2745854711 5264556173 6141336146 6357385478 4167524645 2176841721 6882881134 4846848554 5283751526"



--input =
--    "11111 19991 19191 19991 11111"


rowWidth =
    input
        |> String.words
        |> List.head
        |> Maybe.map String.length
        |> Maybe.withDefault 0
        |> Debug.log "rowWidth"


type alias State =
    ( Int, Array Octopus )


type alias Octopus =
    { index : Int
    , x : Int
    , y : Int
    , energy : Int
    , hasFlashed : Bool
    }


getOctoIndex : Octopus -> Int
getOctoIndex o =
    getIndexForCoords o.x o.y rowWidth


getIndexForCoords : Int -> Int -> Int -> Int
getIndexForCoords x y w =
    (y * w) + x



--getCoordsForIndex : Int -> Int -> ( Int, Int )
--getCoordsForIndex width index =
--    ( modBy width index, floor (toFloat index / toFloat width) )


getAdjacentCoords : Int -> Int -> List ( Int, Int )
getAdjacentCoords x y =
    [ ( x - 1, y - 1 ) -- Top left
    , ( x, y - 1 ) -- Top middle
    , ( x + 1, y - 1 ) -- Top right
    , ( x - 1, y ) -- Left middle
    , ( x + 1, y ) -- Right middle
    , ( x - 1, y + 1 ) -- Bottom left
    , ( x, y + 1 ) -- Bottom middle
    , ( x + 1, y + 1 ) -- Bottom right
    ]


getAdjacentOctos : Array Octopus -> Octopus -> Array Octopus
getAdjacentOctos octos octo =
    let
        coords =
            getAdjacentCoords octo.x octo.y
    in
    octos
        |> Array.filter (\o -> List.member ( o.x, o.y ) coords)


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



--
--
--isReadyToFlash : Octopus -> Bool
--isReadyToFlash o =
--    o.energy > 9 && o.hasFlashed == False
--
--


invalidOctopus =
    { index = -1
    , energy = -1
    , x = -1
    , y = -1
    , hasFlashed = False
    }


resetEnergy : Octopus -> Octopus
resetEnergy o =
    case o.hasFlashed of
        True ->
            { o
                | energy = 0
                , hasFlashed = False
            }

        False ->
            o


simulateStep : State -> State
simulateStep state =
    state
        |> increaseEnergy
        --|> Debug.log "increased energies"
        |> countFlashes
        --|> Debug.log "counted flashes"
        |> resetEnergies



--|> Debug.log "reset energies"


increaseEnergy : State -> State
increaseEnergy ( flashes, octos ) =
    ( flashes, octos |> Array.map (bumpEnergy 1) )


flash : Octopus -> State -> State
flash octo ( flashes, octos ) =
    if octo.energy > 9 && octo.hasFlashed == False then
        let
            -- Update the current octo to flashed
            flashedOcto =
                setFlashed True octo

            --|> Debug.log "Octo flashed"
            flashedOctos =
                Array.set octo.index flashedOcto octos

            -- Find the adjacent octos
            adjacentOctos =
                getAdjacentOctos flashedOctos flashedOcto
        in
        -- See if the adjacent octos should flash
        adjacentOctos
            |> Array.foldl
                (\ao state ->
                    let
                        -- Bump the energy of this adjacent octo in our array
                        energizedOcto =
                            bumpEnergy 1 ao

                        energizedState =
                            state
                                |> Tuple.mapSecond
                                    (\fos ->
                                        fos
                                            |> Array.set energizedOcto.index energizedOcto
                                    )
                    in
                    -- See if this newly energized adjacent octo should flash
                    flash energizedOcto energizedState
                )
                ( flashes + 1, flashedOctos )

    else
        ( flashes, octos )


countFlashes : State -> State
countFlashes ( flashes, octos ) =
    octos
        |> Array.foldl flash ( flashes, octos )


resetEnergies : State -> State
resetEnergies ( flashes, octos ) =
    ( flashes, octos |> Array.map resetEnergy )


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
            List.range 1 10
                |> List.foldl (\i state -> simulateStep state) ( 0, octos )
                |> Tuple.first
                |> Debug.log "Flashes"
    in
    text "See console for results"
