--#Tergus_Raslin (170343)
--Quest:Search for Tergus Raslin
--twilight

function event_say(e)
	if (not e.self:IsEngaged()) then
		if(e.message:findi("Hail")) then
			e.self:Emote("turns to speak to you, you notice his face is very pale. 'You must leave me alone. I must get back to Sanctus Seru immediately. I have much [" .. eq.say_link("work") .. "] to do.' ");
		elseif(e.message:findi("work")) then
			e.self:Emote("moves in quick bursts of speed and starts to attack, his screams of torment reveal sharp fangs. 'Argh! I said leave me be!'")
			e.self:AddToHateList(e.other,1);
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end