-- Captain Nalot's Triple Strength Rum
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 25104})) then -- toolset Delivery (kael)
		e.self:Say("Uhhh, thank you... Now I can uhh... work on fixing some things around...");
		e.self:Emote("seems to nod off for a moment as he drops a small note on the ground.");
		e.other:QuestReward(e.self,0,0,0,0,20474);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30037})) then -- Wolf Fur Earcovers
		e.self:Emote("stares at you and then laughs before putting on the earmuffs. As he moves around, blissfully protected from the noise, a fine chain slips from his coat. 'Hey! Look at that! What a fine chain! It looks familiar but I can't tell how. Oh, well, yu can have it. It looks like it could be used to fill gaps or if needed to repair another similar metal object. I can do that if you ever find need.'");
		e.other:QuestReward(e.self,0,0,0,0,30038,5000); -- Fine Gold Chain
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30038, item2 = 30057})) then -- Fine Gold Chain and Golden Broken Key
		e.self:Emote("puts a tiny eyeglass up to his eye and studies the key and chain. Aye, this looks like the perfect metal to fix this key. Gimmie just a moment. He uses fine and minute tools to pick and push the chain and key over a fire. Ha! Don't say I ain't never done anythin for ya. There ya go, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,30040,5000); -- Rum Box Key
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
    e.self:Emote("sighs and stares at the ground solemnly");
end