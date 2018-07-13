local unitIDPrefix;

local function getRaidTargets()
    local targets;
    -- Do for each Member in Raid/Part
    for i = 1, getMaxUnitsInGroup() do
       local unitID = unitIDPrefix .. i
        if UnitExists(unitID) and not UnitIsUnit(unitID, "player") and not UnitIsDeadOrGhost(unitID) then
            -- It is a viable Player, get the current Target
            targets[i] = unitID .. "target"
        end
    end
end



--> Return: int: Max-Number in Party/Raid
local function getMaxUnitsInGroup()
    if UnitInParty("player") then
        unitIDPrefix = "party"
        return 5
    else
        unitIDPrefix = "raid"
        return 40
    end

end