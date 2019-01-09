---- Quest:Vampyre Troubles
function event_spawn(e)
    eq.set_timer("Kerzar2", 600000);
    eq.set_timer("sit", 1 * 1000);
end

function event_say(e)
    local qglobals = eq.get_qglobals(e.self,e.other);
    if(e.message:findi("valdanov") and tonumber(qglobals.vampyre_vahshir_combat) == 1) then
        e.self:Say("I have not seen Valdanov Zevfeer in many years. He came to me once when I was still newly reborn wanting to extract a vial of my blood.  When I refused he attacked me and extracted it against my will. I was still new and unfamiliar with my vampyric powers, Valdanov's [" .. eq.say_link("abilities") .. "] were far more developed than my own.");
    elseif(e.message:findi("abilities") and tonumber(qglobals.vampyre_vahshir_combat) == 1) then
        e.self:Say("His vampyric abilities of course. Valdanov had either been reborn in undeath far before myself or had a powerful mentor and the time and facilities in which to train. I did my best to resist his attack but I was still subdued by his superior skills and strength. He dropped this key in the struggle. I have no use for it, consider it yours. I must be going before I'm seen by the others. Oh no! It's too late! We've been spotted! May you continue your investigations in the afterlife!");
        e.other:QuestReward(e.self,0,0,0,0,31758,2500); -- Old Bone Key
        e.self:Emote("rapidly transforms into swirling mist indistinguishable from the wind swept mountain fog as other forms begin to solidify from the fog nearby.");
        eq.spawn2(172001,0,0,e.self:GetX() -10,e.self:GetY() +10,e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
        eq.spawn2(172001,0,0,e.self:GetX() -10,e.self:GetY() -10,e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
        eq.spawn2(172001,0,0,e.self:GetX() +10,e.self:GetY() +10,e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
        eq.spawn2(172001,0,0,e.self:GetX() +10,e.self:GetY() -10,e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
        eq.delete_global("vampyre_vahshir_combat");
        eq.depop();
    end
end

function event_timer(e)
    if (e.timer == "Kerzar2") then
        eq.depop();
    elseif(e.timer == "sit") then
		eq.stop_timer(e.timer);
		e.self:Emote("crouches to the ground cowering. 'Enough, you have proven your might. I will talk! Just cease your assault!  'What knowledge do I have that the Validus Custodus is so eager to obtain? If you spare me I assure you I will answer truthfully.'");
		e.self:SetAppearance(1);
	end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end