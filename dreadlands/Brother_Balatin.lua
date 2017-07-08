-- monk epic and Whistling Fists
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("turns toward you. A transparent human face materializes upon the skull. As he speaks the smells of rotted rat corpses rushes into your face. You must fight the urge to vomit. 'What discipline do you [follow]?'");
		e.self:Say("What discipline do you follow?");
	elseif(e.message:findi("lost circle")) then
		e.self:Say("Then we are one. The rebirth of our circle shall start with you. I have waited decades for your arrival. You should seek the living brothers within Tunaria. When you have earned your garb then you will be ready for the [true drape].");
	elseif(e.message:findi("true drape")) then
		e.self:Say("Seek the broken flute of our master. Taken from us by the Iksar twins of Vistrei. To me they will come and to me your robe and you will come the dawning of the new brotherhood.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12979, item2 = 12980, item3 = 12256})) then -- A Metal Pipe, A Metal Pipe and Robe of the Lost Circle
		e.self:Emote("holds his arms out and a fine robe materializes before your eyes. You grab it just in time to see the skeleton fade from existence.");
		e.other:QuestReward(e.self,0,0,0,0,12970);	-- Robe of the Whistling Fist
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12429})) then -- Ancient Thin Flute
		e.self:Emote("quickly stashes the flute inside of his ribcage, where it joins another. 'If you want the true Flute of Zan-Fi, you'll have to take it from me!'"); --Made this up, no text available
		eq.spawn2(86155,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #Brother Balatin
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end