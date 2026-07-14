local minigames = {}

local RESOURCE = "tq_minigames_v2"

-- Every game shipped by tq_minigames_v2, keyed by its friendly id.
-- The value is the export exposed by the resource for that game.
local GAMES = {
    ["aim-it"]          = "AimIt",
    ["match-it"]        = "MatchIt",
    ["destroy-links"]   = "DestroyLinks",
    ["get-it"]          = "GetIt",
    ["in-time"]         = "InTime",
    ["2047+1"]          = "Game20471",
    ["typix"]           = "Typix",
    ["math"]            = "Math",
    ["echo"]            = "Echo",
    ["sequence"]        = "Sequence",
    ["dash"]            = "Dash",
    ["flappy"]          = "Flappy",
    ["to-the-sky"]      = "ToTheSky",
    ["pathing"]         = "Pathing",
    ["a-mess"]          = "AMess",
    ["mines"]           = "Mines",
    ["on-the-dot"]      = "OnTheDot",
    ["crack-it"]        = "CrackIt",
    ["tower-of-hanoi"]  = "TowerOfHanoi",
    ["sequence-memory"] = "SequenceMemory",
    ["ive-seen-it"]     = "IveSeenIt",
    ["numbers"]         = "Numbers",
    ["unlocked"]        = "Unlocked",
    ["stick-it"]        = "StickIt",
    ["breach-protocol"] = "BreachProtocol",
    ["data-stream"]     = "DataStream",
    ["electrical-box"]  = "ElectricalBox",
    ["pipepressure"]    = "PipePressure",
    ["keys"]            = "Keys",
    ["fingerprint"]     = "Fingerprint",
    ["breaker"]         = "Breaker",
    ["locked"]          = "Locked",
    ["pairs"]           = "Pairs",
    ["cut-it"]          = "CutIt",
    ["reach"]           = "Reach",
    ["rhythm-click"]    = "RhythmClick",
    ["progress-timing"] = "ProgressTiming",
    ["arrows"]          = "Arrows",
    ["slider"]          = "Slider",
    ["masher"]          = "Masher",
    ["lockpick"]        = "Lockpick",
    ["circle-click"]    = "CircleClick",
    ["skill-bar"]       = "SkillBar",
    ["qte-circle"]      = "CircleZones",
    ["balance"]         = "Balance",
    ["chroma-lock"]     = "ChromaLock",
    ["pitch-lock"]      = "PitchLock",
}

-- Build a case/format-insensitive lookup so callers may pass either the id
-- ("skill-bar", "circle click") or the export name ("SkillBar") interchangeably.
local lookup = {}
local function key(name)
    if type(name) ~= "string" then return nil end
    return name:lower():gsub("[^%w]", "")
end

for id, export in pairs(GAMES) do
    lookup[key(id)] = export
    lookup[key(export)] = export
end

local busy = false

--- Runs a single minigame and yields until the player wins, loses or cancels.
---@param game string Game id ("lockpick") or export name ("Lockpick").
---@param options table? Custom settings forwarded to the game.
---@return boolean success
function minigames.play(game, options)
    local export = lookup[key(game)]
    if not export then
        print(("^1[tq_bridge] Unknown minigame '%s'^7"):format(tostring(game)))
        return false
    end

    busy = true
    local success = exports[RESOURCE][export](exports[RESOURCE], options)
    busy = false
    return success == true
end

--- Runs an ordered list of minigames; every stage must be cleared to succeed.
---@param stages table[] List of `{ game = string, config = table? }` entries.
---@return boolean success
function minigames.playSequence(stages)
    busy = true
    local success = exports[RESOURCE]:StageSequence(stages)
    busy = false
    return success == true
end

--- Force-closes the active minigame.
function minigames.stop()
    return exports[RESOURCE]:CancelGame()
end

---@return boolean
function minigames.isPlaying()
    return busy
end

return minigames
