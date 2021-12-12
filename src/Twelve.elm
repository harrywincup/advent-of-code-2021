module Twelve exposing (main)

import Debug
import Dict exposing (Dict)
import Html exposing (text)



--input =
--    "start-A start-b A-c A-b b-d A-end b-end"


input =
    "CV-mk gm-IK sk-gm ca-sk sx-mk gm-start sx-ca kt-sk ca-VS kt-ml kt-ca mk-IK end-sx end-sk gy-sx end-ca ca-ml gm-CV sx-kt start-CV IK-start CV-kt ml-mk ml-CV ml-gm ml-IK"


isLowerCase : String -> Bool
isLowerCase string =
    string == String.toLower string && string /= String.toUpper string


search : Dict String (List String) -> String -> List String -> Bool -> Int
search locations current visited allowTwoVisits =
    let
        pathCount =
            locations
                |> Dict.get current
                |> Maybe.withDefault []
                |> List.foldl
                    (\l count ->
                        if l == "end" then
                            count + 1

                        else if not (isLowerCase l) then
                            count + search locations l visited allowTwoVisits

                        else if l /= "start" then
                            if not (List.member l visited) then
                                count + search locations l (visited ++ [ l ]) allowTwoVisits

                            else if allowTwoVisits == False then
                                count + search locations l (visited ++ [ l ]) True

                            else
                                count

                        else
                            count
                    )
                    0
    in
    pathCount


main =
    let
        locations =
            input
                |> String.words
                |> List.foldl
                    (\con locs ->
                        case String.split "-" con of
                            [ src, dest ] ->
                                let
                                    destinations =
                                        locs
                                            |> Dict.get src
                                            |> Maybe.withDefault []
                                            |> (::) dest

                                    sources =
                                        locs
                                            |> Dict.get dest
                                            |> Maybe.withDefault []
                                            |> (::) src
                                in
                                locs
                                    |> Dict.insert src destinations
                                    |> Dict.insert dest sources

                            _ ->
                                locs
                    )
                    Dict.empty
                |> Debug.log "locations"

        partOne =
            search locations "start" [] True
                |> Debug.log "partOne"

        partTwo =
            search locations "start" [] False
                |> Debug.log "partTwo"
    in
    text "See console for results"
