--Added tome handins - Kilelen
function event_say(e)
	e.self:Emote("raises a brow sharply, his Teir'Dal heritage perfectly displayed in his sharp features twisted in a glare of flawless contempt. 'The district of Kartis -- the land of the shadow -- is not a place for you, light crawler. Your presence here has no justification and you only insult your people by being here. Yes, you have betrayed your philosophy, for you are fueling the shadow with your presence within it. You may see yourself as a creature of justice and think yourself doing good by being here -- perhaps to show us the light, or to learn our secrets. Aaah. . .  learn our secrets. Yes, why don't you do that? I would be more than willing to teach you, light crawler, for whatever it is you learn under the shadow's guidance, despite how you use that knowledge, you fuel it, for you are now a product of corruption.'");
end

function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.trade, {item1 = 4861})) or (item_lib.check_turn_in(e.trade, {item1 = 4862})) or (item_lib.check_turn_in(e.trade, {item1 = 4863})) or (item_lib.check_turn_in(e.trade, {item1 = 4864})) or (item_lib.check_turn_in(e.trade, {item1 = 4865})) or (item_lib.check_turn_in(e.trade, {item1 = 4866})) or (item_lib.check_turn_in(e.trade, {item1 = 4867}))) then --Imbrued Platemail Armor
		e.self:Say("Thank you, " .. e.other:GetName() .. "."); --Text made up
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),698775); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
