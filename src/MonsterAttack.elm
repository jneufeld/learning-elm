module MonsterAttack exposing (..)


type alias MonsterDamage =
    String


attackWithSword1 : MonsterDamage -> Int -> MonsterDamage
attackWithSword1 monsterDamage strength =
    monsterDamage ++ "Attacked with sword of strength " ++ String.fromInt strength ++ "."


attackWithClaw1 : MonsterDamage -> Int -> MonsterDamage
attackWithClaw1 monsterDamage strength =
    monsterDamage ++ "Attacked with claw of strength " ++ String.fromInt strength ++ "."


attack1 : MonsterDamage -> MonsterDamage
attack1 monsterDamage =
    -- As the problem description promised, this approach is unwieldy. But it
    -- isn't until implementing the alternatives with `|>` (pipe) and `>>`
    -- (composition) this comes into focus.
    --
    -- I miss Haskell's `where`  but `let` feels effectively the same. This
    -- code's real issue is verbosity; idiomatic functional code addresses
    -- _that_ issue.
    let
        annalynsStrength =
            5

        kazaksStrength =
            1

        firstAttack =
            attackWithSword1 monsterDamage annalynsStrength

        secondAttack =
            attackWithClaw1 monsterDamage kazaksStrength

        thirdAttack =
            attackWithClaw1 monsterDamage kazaksStrength

        fourthAttack =
            attackWithSword1 monsterDamage annalynsStrength
    in
    firstAttack ++ secondAttack ++ thirdAttack ++ fourthAttack


attackWithSword2 : Int -> MonsterDamage -> MonsterDamage
attackWithSword2 strength monsterDamage =
    -- Placing the primary data structure in the last position is a neat way of
    -- describing this pattern. I'm at a loss of a precise description, but
    -- there's clearly an idea here than spans languages (Rust, Haskell, and
    -- even the hellhole of Java has something similar.)
    monsterDamage ++ "Attacked with sword of strength " ++ String.fromInt strength ++ "."


attackWithClaw2 : Int -> MonsterDamage -> MonsterDamage
attackWithClaw2 strength monsterDamage =
    monsterDamage ++ "Attacked with claw of strength " ++ String.fromInt strength ++ "."


attack2 : MonsterDamage -> MonsterDamage
attack2 monsterDamage =
    -- Piping is less verbose. Without type hints in my editor, naming becomes
    -- more important.
    let
        annalynsStrength =
            5

        annalynsAttack =
            attackWithSword2 annalynsStrength

        kazaksStrength =
            1

        kazaksAttack =
            attackWithClaw2 kazaksStrength
    in
    monsterDamage
        |> annalynsAttack
        |> kazaksAttack
        |> kazaksAttack
        |> annalynsAttack


attack3 : MonsterDamage -> MonsterDamage
attack3 =
    -- Slick, and appreciated, but in this case I'm not sure it's better than
    -- `attack2`. Maybe writing more code in both styles will illuminate the
    -- relative advantages of both.
    let
        annalynsStrength =
            5

        annalynsAttack =
            attackWithSword2 annalynsStrength

        kazaksStrength =
            1

        kazaksAttack =
            attackWithClaw2 kazaksStrength
    in
    annalynsAttack >> kazaksAttack >> kazaksAttack >> annalynsAttack
