function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18703) == true) then -- Old Folded Letter
		e.other:Message(15,"An evil cackle echoes throughout the mines as you get your bearings. Rilgor Plegnog turns his gaze upon you. 'Why do you stand about young apprentice?! There is much to learn. Read the note in your inventory and then hand it to me so that we can begin your training! The Dark Reflection will have its revenge!'");
	end
end

function event_say(e)
	if (e.message:findi("mechanical pen")) then
		e.self:Say("Why do you want one of those contraptions. You will spend more time repairing it then you will writing with it. But if you insist on getting one, you are going to have to do a small favor.");
		e.self:emote("tugs at your robe and grins evilly. 'Mighty nice outfit you have there. Sure beats these drab robes us three are wearing. Hmm...my favorite color is purple, in fact a shiny metallic purple would do nicely. How bad did you want that pen?'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18703})) then  -- Old Folded Letter
		e.self:Say("It's always good to see new blood eager to learn teh dark art of mind control. Please take this robe as a symbolization of loyalty to this house.");
		e.other:Faction(71,100,0); 	-- Dark reflection
		e.other:Faction(91,-10,0); 	-- eldritch collective
		e.other:Faction(115,-10,0); -- gem choppers
		e.other:Faction(76,-10,0); 	-- Deepmuses
		e.other:QuestReward(e.self,0,0,0,0,13524,100); -- Dark Gold Felt Robe*
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 1360})) then -- Shining Metallic Robes
		e.self:Say("Very nice!! It is perfect! Here take this pen. Have fun with it.");
		e.other:QuestReward(e.self,0,0,0,0,10600,50000); -- Mechanical Pen
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
