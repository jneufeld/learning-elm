module Go exposing (..)

import GoSupport exposing (..)
import Result exposing (andThen)


applyRules : Game -> Rule -> NonValidatingRule -> Rule -> Rule -> Game
applyRules game oneStonePerPointRule captureRule libertyRule koRule =
    let
        -- NB if type hints and the wonderful "Error Lens" extension aren't
        -- available then this type of coding is mighty difficult (for a
        -- beginner).
        fallibleOperationsOn =
            oneStonePerPointRule >> andThen koRule >> andThen libertyRule

        result =
            fallibleOperationsOn game
    in
    case result of
        Ok updatedGame ->
            -- If all fallible rules pass, return a game with their
            -- modifications and change the player
            captureRule updatedGame |> changePlayer

        Err errorMessage ->
            -- If any rule fails, return the original game with the error field
            -- set
            { game | error = errorMessage }
