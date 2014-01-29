-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail e.other:GetCleanName(). I am Kaxon Frennor, master assassin of the Dark Reflection. I train talented gnomes that feel the calling of the Plaguelord, Bertoxxulous, and wish to [serve as a rogue] of the Dark Reflection. Disease and decay are powerful forces in Norrath that crumble kingdoms and silently kill even the mightiest of heros. It is the calling of the Dark Reflection to sow the seeds of destruction as a catalyst to change. What progress would there be if rulers did not die and clockworks did not malfunction, giving way to greater rulers and better clockworks.");
	elseif (e.message:findi("serve as a rogue")) then
		e.self:Say("We are the spreaders of disease, the masters of poison, the death that comes silently from the shadows. You must outfit yourself with the tools of a rogue, crafted from the disassembled remains of clockworks that are finished serving the purpose for which they were built. Take this parchment to Rebbie Romblerum, he will assist you in the construction of a suit of armor. When you have been properly outfitted return to me for your [next task].");
		e.other:SummonItem(10988);
	elseif (e.message:findi("next task")) then
		e.self:Say("There are many of our kind that do not understand the necessity of the Dark Reflection. The Eldrich Collective and The Deep Muses seek to root us out and have us put to death or exiled from Ak'Anon. In the Steamfont Mountains a Rogue of the Deep Muses, Jibble Blexnik, has been hunting and killing young members of the Dark Reflection that venture from Ak'Anon. Find this self-righteous rogue and eliminate him. When you have accomplished this task bring me Jibble's Stiletto.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 10992})) then
		e.self:Say("You have done well e.other:GetCleanName(), here is your reward."); -- unable to locate real reward text.
		e.other:SummonItem(11079);
		e.other:Ding();
		e.other:AddEXP(100);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 18705})) then -- Old Folded Letter
		e.other:SummonItem(13518); 	-- Tin Patched Tunic*
		e.other:Ding();
		e.other:Faction(71,10,0); 	-- Dark Reflection
		e.other:Faction(91,-15,0); 	-- Eldritch Collective
		e.other:Faction(115,-15,0); -- Gem Choppers
		e.other:Faction(76,-15,0); 	-- Deepmuses
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
