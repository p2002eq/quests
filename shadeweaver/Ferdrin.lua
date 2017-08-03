---- Quest:Saurek Claws
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome " .. e.other:GetName() .. "! Have you been sent to speak with me by [" .. eq.say_link("Captain Alim") .. "]?");
	elseif(e.message:findi("captain alim")) then
		e.self:Say("Excellent, I presume you wish to speak with me about the [" .. eq.say_link("Firefall Club") .. "]?");
	elseif(e.message:findi("firefall club")) then
		e.self:Say("If you provide me with three firefall claws, and a wooden practice flail, I am able to fashion them together into a Firefall Claw Club, for you to use.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7807, item2 = 7807, item3 = 7807, item4 = 30579})) then -- 3x Firefall Saurek Claw & Wooden Practice Flail
		e.self:Emote("takes the flail and starts placing the claws into it forming a formidable looking weapon. 'This seems a good weapon indeed. Here, you can take it for helping to test my theory of weapon crafting. Safe travels to you friend.'");
		e.other:QuestReward(e.self,0,0,0,0,7813); -- Firefall Claw Club
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
