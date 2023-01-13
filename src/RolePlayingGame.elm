module RolePlayingGame exposing (Player, castSpell, introduce, revive)


type alias Player =
    { name : Maybe String
    , level : Int
    , health : Int
    , mana : Maybe Int
    }


introduce : Player -> String
introduce { name } =
    case name of
        Just value ->
            value

        Nothing ->
            "Mighty Magician"


revive : Player -> Maybe Player
revive player =
    if player.health <= 3 then
        let
            revived =
                { player | health = 100 }
        in
        if player.level >= 10 then
            Just { revived | mana = Just 100 }

        else
            Just { revived | mana = Nothing }

    else
        Nothing


castSpell : Int -> Player -> ( Player, Int )
castSpell manaCost player =
    case player.mana of
        Nothing ->
            let
                updatedPlayer =
                    reduceHealth manaCost player
            in
            ( updatedPlayer, 0 )

        Just availableMana ->
            let
                remaining =
                    availableMana - manaCost

                damage =
                    manaCost * 2
            in
            if remaining >= 0 then
                ( { player | mana = Just remaining }, damage )

            else
                ( player, 0 )


reduceHealth : Int -> Player -> Player
reduceHealth amount player =
    let
        reduced =
            player.health - amount

        updated =
            if reduced >= 0 then
                reduced

            else
                0
    in
    { player | health = updated }
