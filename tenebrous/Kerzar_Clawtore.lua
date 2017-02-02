---- Quest:Vampyre Troubles
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Emote("glares with eyes that seem to pierce through you like fiery daggers.  'Run while you can weakling!  My appetite grows stronger with the presence of your mortal scent!'");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31754})) then -- Katta Castellum Badge of Service (*Second Badge of Service)
        e.self:Say("You've been sent by the Validus Custodus to question me!! You mortals are more foolish than I had presumed! The only information I have for you is the fact that you are about to face your death!!");
        eq.set_global("vampyre_vahshir_combat","1",1,"M7");
        e.other:QuestReward(e.self,0,0,0,0,31757,1000); -- Katta Castellum Badge of Service (*Third Badge of Service)
        e.self:Emote("roars flashing glistening fangs that are sharper and longer than the average Vah Shirs!");
        e.self:AddToHateList(e.other,1);
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)
    if(e.joined == true) then
        eq.stop_all_timers(e.self);
        eq.set_next_hp_event(15);
    end
end

function event_hp(e)
    if (e.hp_event == 15) then
        e.self:SetAppearance(3);
        e.self:SetInvul(true)
        e.self:WipeHateList();
        eq.set_timer("kerzar_fight_over", 300000);
        eq.spawn2(172188,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
    end
end

function event_death_complete(e)
    if eq.get_qglobals()["vampyre_vahshir_combat"] == 1 then
        eq.unique_spawn(172188,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
    end
end

function event_timer(e)
    if (e.timer == "kerzar_fight_over") then
        eq:depop();
    end
    eq.stop_timer(e.timer)
end