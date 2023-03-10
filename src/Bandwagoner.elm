module Bandwagoner exposing (..)


type alias Coach =
    { name : String
    , formerPlayer : Bool
    }


type alias Stats =
    { wins : Int
    , losses : Int
    }


type alias Team =
    { name : String
    , coach : Coach
    , stats : Stats
    }


createTeam : String -> Stats -> Coach -> Team
createTeam name stats coach =
    { name = name
    , stats = stats
    , coach = coach
    }


replaceCoach : Coach -> Team -> Team
replaceCoach newCoach team =
    { team | coach = newCoach }


rootForTeam : { team | stats : Stats } -> Bool
rootForTeam team =
    team.stats.wins > team.stats.losses
