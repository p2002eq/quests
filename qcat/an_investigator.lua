--an investigator
--Qeynos Badge of Honor (Qeynos badge #4)

function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	
	if(e.message:findi("hail")) then
		e.self:Emote("coughs and struggles to move. 'There were. . . too many . . . too strong.'");
	elseif(e.message:findi("it was too late") and tonumber(qglobals.qeynos_badge4) == 2) then
		e.self:Emote("gasps clutching a wound and says, 'Their magic was too powerful. Necromancers. Undead. Cursed knights of an unholy god. They left when they thought I was dead. But even now their curses sap the last of my life. I made it as far as I could. If Helminth lives, tell him [" .. eq.say_link("I am dead") .. "]. Please complete the mission. Bring this Azibelle to justice. Avenge me.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self,e.other);
	
	if(tonumber(qglobals.qeynos_badge4) == 1 and item_lib.check_turn_in(e.self, e.trade, {item1 = 2694})) then -- Vegalys Seal
		e.self:Say("Vegalys sent you. I'm done for. Guard Helminth found a false wall. We stepped through it. We were ambushed. I didn't see where Helminth went. He disappeared. I knew we were overwhelmed. I ran and feigned death but I knew [" .. eq.say_link("it was too late") .. "]");
		e.other:SummonItem(2694); 	--return Vegalys Seal to Player
		eq.spawn2(45206, 0, 0, -49, 379, -38,256.0);  -- Spawns Guard Helminth
		eq.set_global("qeynos_badge4","2",5,"F"); -- Badge Globals
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
