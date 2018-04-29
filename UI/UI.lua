

-- Called through UI to get the culture of a city
function SetMyPrestige(playerID)
    

end

function ParseCitiesForPrestige()

    -- Set the loyalty of the culture
    local playerID = Game.GetLocalPlayer();
    local player = Players[playerID];

    -- Get all cities of the player
    local cities = player.GetCities();

    for loop, city in ipairs(cities) do
        
        if city ~= nil then
            local currentLoyalty = city:GetCulturalIdentity():GetLoyalty();
            local currentCultureYield = city:GetCulture:GetCultureYield();

            -- The value that will be the next loyalty pressure
            local prestige = currentLoyalty + currentCultureYield;

            -- Add the current culture to the loyalty pressure
            city:ChangeLoyalty()
        end      
    end


end

GameEvents.PlayerTurnStarted.Add(ParseCitiesForPrestige);