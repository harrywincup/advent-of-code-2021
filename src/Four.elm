module Four exposing (main)

import Array exposing (Array)
import Binary
import Debug
import Html exposing (text)


input =
    "67,31,58,8,79,18,19,45,38,13,40,62,85,10,21,96,56,55,4,36,76,42,32,34,39,89,6,12,24,57,93,47,41,52,83,61,5,37,28,15,86,23,69,92,70,27,25,53,44,80,65,22,99,43,66,26,11,72,2,98,14,82,87,20,73,46,35,7,1,84,95,74,81,63,78,94,16,60,29,97,91,30,17,54,68,90,71,88,77,9,64,50,0,49,48,75,3,59,51,33\n\n12 75 58 21 87\n55 80 14 63 17\n37 35 76 92 56\n72 68 51 19 38\n91 60 34 30 88\n\n 0 66  5 51  8\n45 57 31  3 62\n 7 60 40 29 90\n80 19 47 86 81\n95 69 68 53 93\n\n30 99 16 34 42\n94 39 83 78 49\n57 81 97 77 52\n 9 61 98 11 89\n85  1 60 90 55\n\n87 49 12 85 88\n67 89  7 35 70\n37 45 93 84  9\n80 58 54 13 22\n 8 71 48 15 39\n\n40 79 34 18 42\n35  8 64  5 63\n93 57 16 10 96\n22 20 23  0 86\n61 78 68 83 12\n\n43 78 64 70 49\n60 54 31 82  9\n10 69  2  1 50\n37 12 16 77 25\n18 14 57 13 91\n\n42 85 53 57 52\n19 41 84 68 28\n39 22 55 51 87\n49 23  5 66 71\n72 83 86 35 50\n\n91 75  9 62 82\n47 37 94  6 55\n96 38  8 19 22\n46 66 54 43 59\n 1  0 26 36 74\n\n19 78 25 10 80\n23 88 95 42 11\n54 85 52 92 31\n73 87  9 17 93\n 2 46 12 24 83\n\n84 73 85 51 89\n41 26 98 11 29\n81  6 35 39 76\n27 10 49  4 92\n55 43 28 45 88\n\n23  0 19 26 73\n72 42 40 58 38\n36 46 18 89 52\n85 35 50 13  1\n66 57 45 81 25\n\n11 71 35  0 95\n45 16 78 33 31\n30 34 25 91 36\n83 58  8  3 62\n67 14 72 93 28\n\n63 41 19 80 27\n69 15 99 75 95\n47 86 52 22 12\n66 43 37  6 97\n13  1  5 71 83\n\n19 42 85 53 31\n36 14 75 39 74\n70 86 97 72 69\n15 20 41  6 21\n26 33 48 98 34\n\n 1 79 21 38 44\n63 71 14 17 87\n41 76 56 49 59\n 3 18  6  4 77\n34 19 88 24 10\n\n78 20 30 54 92\n25 63 81  0 69\n46 87 26 56 40\n90 82 50 84 66\n96 41 18 29 23\n\n34  1 59 55 30\n97 19 82 23 77\n21 52 56 48 24\n29 43 28 99 69\n 4 37 84 76 58\n\n96 10 11 79 40\n90 29 59 73 84\n16 62 74 42 92\n43 32 58 46 34\n75 12 57 22 15\n\n29 82 47 16 12\n78 84 83  0 77\n51 64  5 37  7\n49 70 19 69  8\n67 63  6 43 79\n\n87 67 52 64  8\n55 43 82 50 13\n 3 19 94 54 83\n80 59 15 32 37\n 0 58 12 89 96\n\n95 31 14 77 83\n26 68 33 39 85\n71 56 45 46 30\n44 93 16 17 52\n86  8 27  3 25\n\n27 67 81 30 95\n48 89  7  4  3\n82 90 78 85 44\n22 16 97 92 11\n15 87 47 79 62\n\n49 51 35 87 75\n 3 70  8 43  5\n77 88 73 81 29\n42 62 50 37 85\n26 86 14 38 65\n\n81  9 84  3 37\n33 32  1 54 45\n39 83 82 36  2\n56 28 76 85 40\n96 69 43 24 71\n\n83 72 50 46 34\n15 51 87 44 71\n 8 78 10 94 11\n67 40 85 93 35\n17 23 24  0 61\n\n62 55 47 77 95\n81 20 35  8 78\n 7  9 89 27 51\n80 39 33 63 50\n67 34  4 87 57\n\n72 88 74 46 91\n67 66 32  0  9\n 3 69 94  6 81\n40 95 29 83 20\n80 68 55 54  2\n\n72 68 65 91 81\n52 34 88 46 48\n66  4 54 27 62\n83 60 69 26 56\n19 11 35 22 84\n\n72 69 92 87 83\n55 95 85 66  1\n16  3 86  5 99\n24 22 29 53 90\n76 73 48 80 42\n\n38 22 94 50 20\n40 52 61 39 62\n 7 35 95 54 66\n37 59 84 76  2\n81 85  0 48  6\n\n90 95 34 93  8\n46 13  6 58 85\n91 89 83 80 18\n56 57 44 99 17\n21 42 12 74 38\n\n28 61 78 99 23\n75 64 37 66 50\n53 70 89 17 63\n43 38 71 26 85\n 4 13  2 27 18\n\n35 12 60  7 29\n87 65 17 81 10\n42 62 99 38 51\n 2 57 92 27 89\n82 58 97 36 72\n\n43 45  5 99 51\n88  4 13 39 95\n44 56 31 33 94\n37 57 12  3 91\n50 74  6 76 30\n\n67 85 56 69 84\n74 65 61 66  8\n43 50 55 25 97\n78 15 49 73 27\n71 44 93 23 64\n\n83 38 97 85 76\n55 90 46 34 12\n 1 52 18 59 48\n62 63 30 82 92\n68 95  0 72 84\n\n40 10 62 77 75\n93 94 32 27 60\n26 12 14 35 57\n88 53 97 95 24\n66 46 33  3 63\n\n25 44 90 34 17\n91 93 42 37 86\n95 41 82 92 31\n65 35 52 40 84\n85 57 71 19 29\n\n77 38 15 12  9\n65 78 39 81 33\n35 64 96 76 71\n68 93 79 22 40\n88 87 27  7 29\n\n10 81  7 92 64\n60 25 11  6 87\n34 49 20 13  0\n48 38 14 61 75\n71 86 39 37 22\n\n63 67 82 98 18\n11 95  4 55 44\n42 10 84 73 19\n17 57 53 61 49\n 7 32 24 75 58\n\n50 90  1 98 41\n77  4 87 69 19\n48 44 68 10 17\n96 66 71 61 45\n18 86 26 73 16\n\n 5 58 68 34 85\n44 89 72 21 27\n 0 50 39 94 82\n23 13 41 81  6\n83 60 61 22 40\n\n59 41 63 92 69\n10 58 29 60  4\n76 15 46 34 85\n13 17 88 86 24\n62 73 19 67 98\n\n96 69 70 87 80\n28 27 40 77  9\n23 52 99  3 60\n81 53 26 45 35\n82 33 71 43 67\n\n30  8 41 71 26\n97 96  0 45 11\n61 12 91  7 50\n22 40 74 55 29\n53 78 43 15  5\n\n93 25 12 62 84\n95 31 87 83 23\n29 41  6 55 17\n33 85 42 20 56\n57  1 65 45 16\n\n76 86 27 75 96\n56 63 45 25 77\n54 44 64 41 13\n60 46 66 12 67\n84 59 39 24  5\n\n79 39 22 84 66\n76 38 99 21 47\n52 73  7 45 94\n70 78 24 16 40\n48 57  9 13 64\n\n17 80 28 51 94\n52 56 24 65 82\n38 96 21 70 23\n60 50 40 32 91\n45 77 37 44 89\n\n18  3 42 68 66\n22 35 95 29 65\n 8 99 72 19  5\n44 80 11 60 76\n59 90 64 57 94\n\n66 97 62 49 89\n 4 41  5  2 23\n54 48 43 45 76\n68 35 14  1 86\n34 47 26 92 95\n\n57 36 52 42 11\n49 83 94 72 26\n91 48 50 88 80\n70 23 81 33 15\n64 90  2 47 18\n\n68 11 16 77 28\n29 56 81 21 63\n 2 88 54 82 40\n69 93 92 55 70\n57 51 25 80  3\n\n10 73  8 27 61\n74 66 47 54  1\n52 17 76  5 20\n70 44 92 59 34\n26 16 11 81 46\n\n10 31 95 17 44\n76 67 19 69 33\n36 70 25 71 99\n56 42 53 46 40\n90 85 81  6 26\n\n17 32 74 57 64\n37 82 92 54 59\n56 87 41 68 73\n44 98 58 95 53\n47 29 71 52 31\n\n19 58 84 14 91\n75 89 18 67  3\n11  5  2 24 37\n62 35 48 56 81\n54 77 16 70 45\n\n 7 20 41 87 74\n17 47 45 96 49\n 4 33 89 31 77\n79 42 52 29 85\n88 27 63 11 75\n\n61 87 90 15 17\n22 82 28 21 93\n65 98 12 23 24\n73 70 42  1 94\n83 79  5 18 55\n\n78 67 22 88 18\n 2 43 14 56 92\n61 32 87 20  8\n28 11  7 12 70\n21 72 36 74 77\n\n27  6 97 66  7\n30 67 12 70 40\n18 61 78 36 23\n44 24 85 74 82\n55 42 51 90 34\n\n98  9 39 42 44\n50 54 43 66 57\n85 58 91 13 11\n67  5 23 59 70\n45 41 87 29 20\n\n97 57 48 42 73\n37 29 50 49 83\n55 38 69 13 44\n52 14 54 94 56\n24 77 16 39 66\n\n31 61 44 38 80\n11  3  0 56  8\n94 81  1 25 19\n71 23 36 66 41\n70 35 77 79 46\n\n17 96 13 25 48\n65 28 41 24 81\n39 87 74 42  5\n36 35 21 60 40\n 3 83 11  1 34\n\n50 52 84 38 57\n15 20 26  3 72\n48 85  4 88 63\n39 34 32 42  7\n86 77 71 94 23\n\n28 60 13 25  0\n22 74 20 75 30\n97  5 21  2 73\n 7 44 14 77 16\n43 68 76 24  1\n\n99 85  4 62 67\n46 86 43 45 77\n42 21 81 47 57\n71 35 23 10 29\n58 60 79 61 48\n\n33 10  7 61 17\n97 91 70 75 48\n81 80 78 34 36\n26 55 73 77 14\n85 84 62  9 16\n\n17 41  3 82 86\n58  0 51 79 29\n60 70 61 95 46\n98 85  1 72 93\n 4 42 89 88 84\n\n95 16 26 32 29\n27 37 51 23 55\n36 10 50 70 57\n60 79 96 40  9\n 3 43 74 94 31\n\n15 56 51 72 62\n 8 63 23 90 67\n93 85 28 70 82\n33 65 89  4 64\n19 58 37 88 75\n\n34 71 60 84 85\n64 87 92 67  8\n42 58  4  9 75\n49 95 26 91 12\n27 56 74 90 20\n\n13 46 27 12 97\n90 25 87 73 41\n50 66 34 15 94\n45 99 88 86 21\n56 37 62 44 29\n\n77 31 59 94 74\n19 15 11 23 68\n 0 36  2 98 30\n44 49 90 83  9\n13 88 69 66 81\n\n31 71 58 11 47\n42 41 10 83 21\n38  9 51 17 64\n37 13 93 81 39\n33 22 98 26 43\n\n60 89 20 94  2\n45 34 93 15 30\n 4 16 49 92 28\n67 75 27 61 70\n25 84 55 91 88\n\n85 22 41 43  0\n21 77 12 64 34\n30 39 97 36 72\n56  8 65 82 84\n76  3  4 17 49\n\n16 61 63 41 47\n48 46 37 70 87\n57 31 36 83  1\n71  3 93 24 80\n51 78 91 17 86\n\n87 72 70 97 58\n54 16  1 43 46\n49 28 59 38 51\n24 15 10 84 94\n76 86 55 83 26\n\n93 10  5  1 92\n99  6 45 79 76\n74 87 47 25 24\n50 43  4 21 67\n81 39 49 12 86\n\n49 35 22 27 37\n90 80 68 52 59\n78 53 23 65 46\n30 61 75 97 31\n 1 76 66 26 48\n\n37 11 88 20 99\n45 96 95 81 39\n60 55 80 58 53\n 6 23  8  1 46\n98 89 16 73 78\n\n 0 58 88 69 66\n82  9 31 97 55\n22 37 90 79 14\n44 45 49 43 60\n93 62 36 57 30\n\n 1 34 89 90 46\n81 26  5  6 14\n75 74 62 55 37\n96 58 78 93 73\n35 40 13 95 45\n\n22 57 46 99 42\n65 39 38  7 81\n 4  1 76 59  8\n84 60 37 55 40\n49 31  5 80 30\n\n29  4 96 50 24\n61 77 70 88 93\n12 64 52 25 90\n67 34 59 95 16\n79 21 82  6 63\n\n26 41 52 91 57\n92 95 33  1 62\n45 31 87 29 59\n44 86 99 81  5\n36 20 58 73 30\n\n55 96 28 26 17\n62 51 64 43 49\n37 41 36 75 42\n11 94 87 27 63\n35 23 21 29  4\n\n99 54 74 83 92\n27 53 15  8 85\n94 36 63 29 91\n58 10 45 38 79\n 9 95 23 98 33\n\n52 14 99 30 50\n29 81 41 28 15\n43 51 61 56 62\n68 67 93 45 13\n23  6 70  8  7\n\n73 78 47  2  7\n45 16 46 65 21\n60 54 43 12  1\n20 23 42 56 81\n89 80 52 26 32\n\n79  5 10 11  7\n87 36  2 70 16\n99 44 49 43 19\n46 25  1 18 78\n55 76  3 73 15\n\n18 49 71 59 90\n97 37 23 68 62\n48  8 14 81 26\n88  4 22 76 12\n60 99 64 17 46\n\n99 25 79 42 33\n 5 28 38 15 11\n 8 78 51 40 65\n47  0 12 48 67\n14 98 53 43 86\n\n74 46 42 86 44\n83 96 61 38 70\n97  7 49  9 22\n65 34 66 90 51\n 0 36 13 85 53\n\n43 21 64 86 20\n 8 55 85 48 15\n58 49 87 29 35\n74  4 37 12 99\n98 69 75 39 71\n\n58 65 63 41 87\n19 49 91 34 37\n95 10 55 94 82\n78 71 66 60 96\n27 11 29 48 72\n\n 9 78 51 18 93\n71 55  0  5 37\n24 98  2 70 92\n85 15 46 91 99\n60 68 41 86 96"



--input =
--    "7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1\n\n22 13 17 11  0\n 8  2 23  4 24\n21  9 14 16  7\n 6 10  3 18  5\n 1 12 20 15 19\n\n 3 15  0  2 22\n 9 18 13 17  5\n19  8  7 25 23\n20 11 10 24  4\n14 21 16 12  6\n\n14 21 17 24  4\n10 16 15  9 19\n18  8 23 26 20\n22 11 13  6  5\n 2  0 12  3  7"


boardSize =
    5


type BingoNumber
    = Unmarked Int
    | Marked Int


type alias Board =
    { completedAt : Int
    , numbers : List BingoNumber
    }


markNumber : Int -> List Board -> List Board
markNumber n boards =
    boards
        |> List.map (markNumberOnBoard n)


markNumberOnBoard : Int -> Board -> Board
markNumberOnBoard n board =
    { board
        | numbers =
            board.numbers
                |> List.map
                    (\num ->
                        case num of
                            Unmarked x ->
                                if x == n then
                                    Marked x

                                else
                                    num

                            _ ->
                                num
                    )
    }


callBingoNumbers : List Int -> List Board -> Int -> List Board
callBingoNumbers sequence boards turnNumber =
    case sequence of
        [] ->
            checkForWinners boards

        x :: xs ->
            let
                sdf =
                    Debug.log "Mark number: " <| x

                updatedBoards =
                    markNumber x boards
                        |> List.map
                            (\board ->
                                { board
                                    | completedAt =
                                        if board.completedAt == 0 && boardHasWinningRowsOrColumns board then
                                            turnNumber

                                        else
                                            board.completedAt
                                }
                            )

                winningBoards =
                    updatedBoards
                        |> List.filter (\b -> b.completedAt /= 0)
            in
            if List.length winningBoards == List.length boards then
                winningBoards

            else
                callBingoNumbers xs updatedBoards (turnNumber + 1)


split : Int -> List a -> List (List a)
split i list =
    case List.take i list of
        [] ->
            []

        listHead ->
            listHead :: split i (List.drop i list)


boardHasWinningRowsOrColumns : Board -> Bool
boardHasWinningRowsOrColumns board =
    boardHasWinningRows board || boardHasWinningColumns board


boardHasWinningRows : Board -> Bool
boardHasWinningRows board =
    let
        rows =
            split boardSize board.numbers

        hasCompletedRows =
            rows
                |> List.filter setIsCompleted
                |> (not << List.isEmpty)
    in
    hasCompletedRows


boardHasWinningColumns : Board -> Bool
boardHasWinningColumns board =
    let
        columns =
            Debug.log "columns" <|
                (List.range 0 (boardSize - 1)
                    |> List.map
                        (\i ->
                            board.numbers
                                |> List.indexedMap
                                    (\i2 num ->
                                        if remainderBy boardSize (i2 - i) == 0 then
                                            num

                                        else
                                            Unmarked -1
                                    )
                                |> List.filter
                                    (\num ->
                                        case num of
                                            Unmarked x ->
                                                if x == -1 then
                                                    False

                                                else
                                                    True

                                            _ ->
                                                True
                                    )
                        )
                )

        hasCompletedColumns =
            columns
                |> List.filter setIsCompleted
                |> (not << List.isEmpty)
    in
    hasCompletedColumns


setIsCompleted : List BingoNumber -> Bool
setIsCompleted numbers =
    numbers
        |> List.filter
            (\n ->
                case n of
                    Unmarked _ ->
                        False

                    Marked _ ->
                        True
            )
        |> (List.length >> (==) boardSize)


checkForWinners : List Board -> List Board
checkForWinners boards =
    boards
        |> List.filter boardHasWinningRowsOrColumns


parseDrawSequence : String -> List Int
parseDrawSequence rawInput =
    rawInput
        |> String.split "\n\n"
        |> List.head
        |> Maybe.withDefault ""
        |> String.split ","
        |> List.map (String.toInt >> Maybe.withDefault 0)


main =
    let
        drawSequence : List Int
        drawSequence =
            Debug.log "drawSequence" <|
                parseDrawSequence input

        boards : List Board
        boards =
            input
                |> String.split "\n\n"
                |> List.tail
                |> Maybe.withDefault []
                |> List.map (String.split "\n")
                |> List.map
                    (\rows ->
                        { completedAt = 0
                        , numbers =
                            rows
                                |> List.concatMap String.words
                                |> List.map (String.toInt >> Maybe.withDefault 0 >> Unmarked)
                        }
                    )

        winningBoards =
            Debug.log "winning boards" <|
                callBingoNumbers drawSequence boards 1

        lastBoardToWin =
            Debug.log "last board" <|
                (winningBoards
                    |> List.sortBy .completedAt
                    |> List.reverse
                    |> List.head
                    |> Maybe.withDefault { completedAt = 0, numbers = [] }
                )

        score =
            Debug.log "Last board score" <|
                (lastBoardToWin.numbers
                    |> List.foldl
                        (\num acc ->
                            case num of
                                Unmarked x ->
                                    acc + x

                                _ ->
                                    acc
                        )
                        0
                )

        totalWinningBoards =
            Debug.log "Total winners" <| List.length winningBoards
    in
    text "See console for results"
