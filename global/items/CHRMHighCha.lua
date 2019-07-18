-- CHRMHighCha

local stat_matrix = {   [1] = {200,400,1},
                        [2] = {175,199,0.85},
                        [3] = {150,174,0.6},
                        [4] = {125,149,0.475},
                        [5] = {100,124,0.3},
                        [6] = {75,99,0.175},
                        [7] = {0,74,0}
}

function event_scale_calc(e)
    local cha = e.owner:GetCHA();

    if(cha < 0) then
        cha = 0;
    end

    lookup(e,cha);
end


function lookup(e,query)
    for id, v in pairs(stat_matrix) do
        if (query >= v[1] and query <= v[2]) then
            e.self:SetScale(v[3]);
        end
    end
end