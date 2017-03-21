---- Rockhopper/Sambata Cycle
function event_spawn(e)
    eq.set_timer("RGT", 1800000);
    eq.set_timer("setqg", 20000);
end

function event_timer(e)
    if (e.timer == "RGT") then
        eq.delete_global("Rockhopper_Sambata");
        eq.depop_with_timer();
    elseif (e.timer == "setqg") then
        eq.set_global("Rockhopper_Sambata","1",3,"M40");
    end
    eq.stop_timer(e.timer)
end