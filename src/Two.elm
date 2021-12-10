module Two exposing (main)

import Debug
import Html exposing (text)


type Command
    = Forward Int
    | Up Int
    | Down Int


type alias Depth =
    Int


type alias Position =
    Int


type alias Aim =
    Int


type alias Configuration =
    ( Depth, Position, Aim )


commandInput =
    "\nforward 4\ndown 9\nforward 6\ndown 5\nup 2\nforward 5\nforward 7\nup 5\ndown 9\nup 6\ndown 6\ndown 1\ndown 1\nup 2\ndown 3\nup 3\nforward 8\nforward 7\ndown 6\ndown 7\nforward 6\nforward 9\nforward 7\nup 9\ndown 4\ndown 6\ndown 5\ndown 9\nforward 8\ndown 9\nforward 9\nforward 4\nforward 4\nup 3\nup 8\ndown 9\ndown 8\ndown 4\nforward 5\nforward 4\nup 6\nforward 6\nup 3\nup 8\nup 3\nup 4\ndown 3\ndown 5\ndown 5\nup 1\nforward 9\ndown 4\nforward 6\ndown 6\nup 2\nup 9\nforward 1\nforward 2\nforward 7\ndown 6\nup 6\nforward 1\nforward 7\ndown 7\nforward 9\nforward 4\nforward 6\ndown 5\nup 9\ndown 1\nup 5\nup 5\nup 9\ndown 5\nforward 7\ndown 1\nup 9\ndown 7\nforward 2\ndown 4\ndown 4\nforward 8\nforward 8\ndown 6\ndown 3\nup 7\ndown 3\nforward 9\ndown 7\nforward 2\ndown 1\nforward 5\nup 9\ndown 2\nup 2\ndown 3\nup 7\nforward 9\nforward 7\ndown 4\ndown 5\nup 3\ndown 3\ndown 5\nforward 9\ndown 3\nforward 9\ndown 3\nup 9\ndown 5\nforward 4\ndown 4\nup 8\nforward 7\nup 1\ndown 2\nforward 4\ndown 7\ndown 9\ndown 4\ndown 4\nforward 6\ndown 7\ndown 2\ndown 1\nforward 1\ndown 2\nforward 1\ndown 7\nforward 5\nup 3\nforward 6\nup 9\ndown 3\ndown 3\ndown 9\nforward 4\ndown 4\nforward 9\nforward 6\ndown 7\nup 9\nup 6\nforward 4\ndown 5\nforward 2\ndown 7\ndown 7\nforward 4\nforward 5\ndown 8\ndown 5\nup 4\nforward 7\nup 8\ndown 8\nforward 4\nforward 5\ndown 6\ndown 1\ndown 1\ndown 9\nforward 4\nup 1\ndown 8\nup 7\ndown 1\nup 2\nforward 4\ndown 7\ndown 7\ndown 2\nforward 7\ndown 2\nup 1\nup 4\ndown 6\nforward 5\nforward 2\nup 1\nforward 2\nforward 9\nup 9\nup 7\nforward 9\ndown 8\nup 5\ndown 6\ndown 6\nup 8\ndown 1\nforward 6\ndown 5\nforward 2\ndown 9\ndown 9\nup 4\nforward 4\nforward 2\nforward 7\nforward 3\ndown 1\nforward 8\nup 9\ndown 7\nforward 9\nforward 1\nforward 5\nup 6\ndown 6\nforward 6\nup 3\nforward 9\ndown 3\nforward 2\ndown 7\ndown 3\nup 9\ndown 2\ndown 3\nforward 5\ndown 9\nforward 8\ndown 2\nforward 1\ndown 9\ndown 7\nforward 2\nforward 6\nforward 4\nforward 5\ndown 5\ndown 1\nforward 5\nup 4\ndown 4\nup 8\ndown 4\nup 4\ndown 1\ndown 2\ndown 9\ndown 2\nup 4\ndown 1\nforward 2\nforward 1\nforward 9\ndown 5\nup 4\nup 1\nforward 8\nforward 6\nforward 9\nup 9\nforward 4\nforward 4\ndown 1\nforward 6\nforward 7\nforward 3\nup 5\nup 7\ndown 1\nforward 4\ndown 3\ndown 5\nup 7\ndown 4\nup 9\ndown 3\ndown 5\nforward 7\nforward 8\nup 5\nup 1\nforward 3\nup 8\nforward 3\ndown 2\nforward 1\nforward 9\nforward 1\ndown 2\nforward 7\ndown 5\nforward 6\ndown 9\nup 9\nforward 5\nforward 7\nforward 6\ndown 2\nup 2\nforward 3\nforward 4\nforward 3\ndown 5\nforward 1\nforward 2\nforward 6\ndown 4\nforward 2\nforward 6\nup 8\nforward 2\nup 4\nforward 7\ndown 2\nforward 1\nforward 7\ndown 6\nforward 4\ndown 3\ndown 2\ndown 2\nforward 4\ndown 8\nforward 6\nforward 6\ndown 2\nup 3\nup 1\nforward 1\ndown 5\ndown 2\nforward 4\nforward 7\nforward 3\ndown 3\nforward 9\ndown 1\ndown 7\nforward 6\nforward 1\nup 6\nforward 7\nforward 1\ndown 5\ndown 4\nforward 6\nup 1\ndown 1\nup 9\ndown 2\ndown 2\nforward 3\nup 4\ndown 5\ndown 5\ndown 3\ndown 6\nup 8\nforward 2\nforward 2\ndown 6\ndown 1\nup 4\nup 1\ndown 5\nup 4\nup 2\nforward 4\nforward 6\nforward 3\ndown 7\nforward 8\nup 5\nforward 5\ndown 1\nforward 2\nforward 6\ndown 8\nup 6\ndown 1\ndown 7\nforward 4\nforward 2\nup 1\ndown 6\nforward 3\nforward 1\nforward 5\nforward 9\nforward 9\ndown 4\nforward 2\ndown 1\nforward 1\nforward 7\nforward 5\ndown 9\ndown 8\ndown 1\ndown 6\ndown 1\nup 7\ndown 3\nforward 3\nup 6\nup 4\ndown 7\ndown 7\nforward 6\nup 7\ndown 7\nforward 9\ndown 9\ndown 3\nforward 6\nforward 9\nforward 1\ndown 4\nforward 5\ndown 4\ndown 2\ndown 3\nup 3\nforward 9\nforward 7\nforward 5\ndown 5\nforward 7\nup 4\ndown 1\nforward 3\ndown 3\nforward 4\ndown 9\nforward 2\ndown 5\ndown 1\nforward 8\ndown 3\nforward 7\nup 1\ndown 3\nforward 2\nup 8\ndown 2\nforward 4\nforward 4\nforward 4\ndown 5\nup 6\ndown 3\nforward 5\ndown 4\nup 5\nforward 1\nforward 6\nup 1\ndown 3\nforward 2\nforward 9\ndown 7\ndown 4\nforward 5\nup 3\nup 6\nup 1\nforward 4\nforward 1\nforward 1\ndown 7\nup 4\ndown 3\ndown 8\ndown 3\nforward 8\nforward 3\ndown 6\ndown 9\nforward 3\nforward 9\nforward 7\ndown 8\ndown 6\ndown 4\nforward 2\nup 4\nforward 8\ndown 1\nforward 9\nforward 1\ndown 9\nforward 2\ndown 7\ndown 2\nup 7\ndown 1\nup 8\nforward 8\ndown 7\nforward 1\ndown 1\nforward 3\nforward 1\nup 2\ndown 7\ndown 5\nforward 5\ndown 8\nforward 4\ndown 1\nup 2\nup 8\ndown 8\ndown 1\ndown 5\nup 3\nforward 3\nforward 5\ndown 2\nup 4\ndown 2\nforward 7\nforward 9\nup 9\nup 7\nforward 1\nup 4\nforward 3\nup 5\nforward 9\nforward 9\nforward 6\nforward 2\ndown 7\nforward 8\nforward 4\nforward 7\ndown 8\ndown 5\ndown 6\nforward 6\ndown 4\ndown 1\ndown 9\ndown 1\nforward 3\nforward 5\ndown 6\ndown 7\ndown 9\ndown 8\ndown 4\nup 5\nforward 7\ndown 9\nforward 6\ndown 7\nforward 5\ndown 5\nforward 1\ndown 5\ndown 3\nup 9\nup 3\nforward 2\nup 9\nforward 6\ndown 1\ndown 5\ndown 9\ndown 4\nup 6\nforward 9\ndown 4\ndown 9\ndown 5\ndown 8\ndown 5\ndown 4\nup 5\ndown 8\nup 8\nforward 5\ndown 9\nforward 2\nup 2\ndown 6\nforward 2\nforward 4\nforward 6\ndown 6\ndown 1\nforward 8\ndown 5\ndown 5\nforward 2\ndown 7\ndown 5\ndown 6\ndown 9\nforward 4\nup 9\ndown 3\ndown 7\nforward 3\ndown 5\nup 1\nforward 5\nup 2\ndown 2\nforward 2\nup 3\nup 6\nforward 2\nforward 7\ndown 8\nforward 8\nforward 7\nforward 6\ndown 5\ndown 6\ndown 6\ndown 9\nup 5\ndown 3\nup 1\nup 9\nup 5\ndown 4\ndown 4\ndown 8\nforward 8\nup 5\ndown 9\nforward 1\nup 1\nforward 2\ndown 9\nforward 5\nup 9\nforward 7\ndown 7\ndown 5\nup 1\nup 2\ndown 8\ndown 7\nup 4\nforward 9\ndown 4\nup 8\ndown 5\ndown 1\nforward 9\ndown 6\nup 8\ndown 6\nforward 7\nup 6\nup 5\nforward 2\nup 7\nforward 7\nforward 5\ndown 1\nforward 9\ndown 8\nforward 9\ndown 3\ndown 3\nforward 9\nup 1\ndown 2\nforward 9\ndown 7\nforward 4\nforward 3\nforward 4\ndown 5\nforward 9\nforward 9\ndown 5\nforward 4\ndown 5\ndown 2\ndown 6\nforward 5\nforward 8\nforward 6\nup 9\ndown 9\nforward 7\ndown 6\ndown 7\ndown 4\nforward 1\nforward 3\nforward 6\nforward 4\nforward 3\nforward 4\ndown 1\nforward 2\nforward 3\nforward 9\nup 8\nforward 6\ndown 1\nup 5\ndown 1\ndown 4\ndown 7\ndown 5\ndown 9\ndown 2\ndown 9\nforward 2\ndown 2\nup 5\nforward 2\nforward 3\nforward 5\nup 8\nup 1\ndown 9\nforward 2\ndown 4\ndown 9\ndown 6\ndown 5\ndown 8\nforward 3\nforward 8\nforward 7\nup 3\nup 5\ndown 9\ndown 5\nup 6\nforward 4\nforward 4\nforward 4\ndown 9\ndown 2\ndown 7\ndown 1\ndown 2\ndown 4\nforward 7\ndown 9\nforward 4\nforward 5\nup 5\nforward 4\nforward 9\nforward 1\nforward 5\ndown 3\nforward 1\nforward 5\nup 9\ndown 7\nforward 7\nforward 6\ndown 2\ndown 3\nforward 9\ndown 1\nforward 4\nforward 9\nup 7\nforward 7\ndown 5\nforward 9\nforward 2\nup 3\ndown 3\ndown 7\ndown 5\nup 7\nup 9\nup 7\nforward 3\nforward 3\nforward 8\nup 9\nforward 8\nforward 9\nforward 4\ndown 2\nforward 7\ndown 6\nup 3\nup 9\nforward 8\nforward 2\ndown 9\ndown 7\nforward 1\nup 4\nup 7\nforward 2\nup 4\nforward 4\nup 1\nforward 3\ndown 7\nforward 5\ndown 4\nforward 2\nforward 7\nup 4\ndown 1\ndown 6\nforward 1\nforward 9\nup 6\nforward 7\nforward 7\ndown 8\nforward 7\ndown 8\ndown 9\nup 3\nforward 3\nforward 3\ndown 8\nup 2\ndown 2\ndown 4\nup 3\ndown 3\nforward 7\ndown 4\nup 8\ndown 9\ndown 9\nup 7\ndown 1\nforward 2\nup 1\ndown 3\nup 9\ndown 6\nup 2\nforward 6\nup 8\nup 1\ndown 6\ndown 1\nup 6\nup 4\nup 2\nforward 6\ndown 6\ndown 1\nforward 7\nup 9\nup 1\nforward 4\nforward 5\nup 6\nforward 9\ndown 1\ndown 9\ndown 3\ndown 7\nforward 7\ndown 1\ndown 4\nforward 6\ndown 5\nup 4\nforward 9\nup 5\ndown 1\ndown 2\ndown 2\nup 4\nforward 1\nforward 3\ndown 7\nforward 4\ndown 4\ndown 8\ndown 5\nforward 3\nup 4\nforward 5\ndown 2\ndown 4\ndown 4\ndown 1\nforward 2\nforward 1\nforward 8\nforward 4\nup 4\ndown 9\nup 6\nforward 9\nup 5\ndown 5\nforward 3\nup 1\nforward 7\ndown 4\nforward 7\ndown 9\nup 8\ndown 5\nforward 1\ndown 5\ndown 8\nforward 3\nup 6\nforward 3\nup 7\nforward 6\nforward 9\nup 1\ndown 3\ndown 9\nup 4\nup 6\nforward 5\ndown 6\ndown 3\ndown 4\nup 1\nforward 5\ndown 5\ndown 2\nforward 6\ndown 8\ndown 3\nup 8\nforward 5\nforward 6\ndown 6\ndown 6\ndown 6\nforward 7\nup 4\nforward 7\nup 4\ndown 2\nforward 4\nforward 2\ndown 6\nup 1\ndown 1\ndown 4\nup 8\ndown 6\nforward 3\nforward 6\ndown 6\nforward 5\ndown 4\nup 2\nup 3\ndown 3\nup 1\nforward 2\nup 1\nforward 4\nup 5\nup 2\ndown 7\nforward 3\nup 2\nforward 5\ndown 1\ndown 3\ndown 2\nforward 5\ndown 1\nup 5\nforward 4\ndown 7\nup 8\nup 3\ndown 7\ndown 7\nforward 9\nforward 1\nup 6\ndown 4\ndown 7\nforward 1\ndown 4\nforward 9\nup 1\nforward 3\ndown 1\nup 3\ndown 6\ndown 8\ndown 6\nforward 6\nforward 6\nup 2\ndown 8\nforward 5\n"


parseCommandInput : String -> List Command
parseCommandInput input =
    input
        |> String.split "\n"
        |> List.map parseCommand


parseCommand : String -> Command
parseCommand c =
    let
        command =
            case String.split " " c of
                [] ->
                    Forward 0

                [ _ ] ->
                    Forward 0

                [ k, a ] ->
                    let
                        amount =
                            case String.toInt a of
                                Just n ->
                                    n

                                Nothing ->
                                    0
                    in
                    case k of
                        "forward" ->
                            Forward amount

                        "up" ->
                            Up amount

                        "down" ->
                            Down amount

                        _ ->
                            Forward 0

                _ ->
                    Forward 0
    in
    command


moveSub : Configuration -> List Command -> Configuration
moveSub startingConfiguration commandList =
    commandList
        |> List.foldl applyCommand startingConfiguration


applyCommand : Command -> Configuration -> Configuration
applyCommand command ( depth, position, aim ) =
    let
        newConfiguration =
            case command of
                Forward x ->
                    ( depth + (aim * x), position + x, aim )

                Up x ->
                    --Tuple.mapFirst ((+) (0 - x)) location
                    ( depth, position, aim - x )

                Down x ->
                    --Tuple.mapFirst ((+) x) location
                    ( depth, position, aim + x )

        _ =
            Debug.log "command" ( command, ( depth, position, aim ), newConfiguration )
    in
    newConfiguration


main =
    let
        commandList =
            Debug.log "commandList" <|
                parseCommandInput commandInput

        ( depth, position, aim ) =
            Debug.log "final location" <|
                moveSub ( 0, 0, 0 ) commandList
    in
    text <| String.fromInt <| (depth * position)
