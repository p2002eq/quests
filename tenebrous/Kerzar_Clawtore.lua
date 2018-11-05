---- Quest:Vampyre Troubles
function event_spawn(e)
	eq.set_timer("depop", 1800000);
end

function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Emote("glares with eyes that seem to pierce through you like fiery daggers.  'Run while you can weakling!  My appetite grows stronger with the presence of your mortal scent!'");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31754})) then -- Katta Castellum Badge of Service (*Second Badge of Service)
        e.self:Say("You've been sent by the Validus Custodus to question me!! You mortals are more foolish than I had presumed! The only information I have for you is the fact that you are about to face your death!!");
        eq.set_global("vampyre_vahshir_combat","1",1,"M30");
        e.other:QuestReward(e.self,0,0,0,0,31757,1000); -- Katta Castellum Badge of Service (*Third Badge of Service)
        e.self:Emote("roars flashing glistening fangs that are sharper and longer than the average Vah Shirs!");
        e.self:AddToHateList(e.other,1);
		handin = true;
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)
    if(e.joined) then
        eq.stop_timer("depop");
	else
		eq.set_timer("depop", 1800000);
    end
end


function event_death(e)
	if handin then
		eq.spawn2(172188,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop();
	end
end

function event_timer(e)
    if (e.timer == "depop") then
        eq.depop();
    end
end