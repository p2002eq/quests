---- Quest:Search for Tergus Raslin
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Not to be rude. but I am on a very important mission right now and I cannot be bothered.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29868})) then -- Letter of Relief
		e.self:Say("So you have been sent to relieve me? Not that I need I need it but if you were ordered by Yuka then I will tell you what I know. Tergus Raslin was given the escape route that leads through Twilight Sea. He was to suppose to come through Scarlet Desert, so he should be coming this way. It has been a few days though and I do not know what has become of him. I will head back to Sanctus Seru to let Yuka know you are on the case.");
		e.other:Faction(96,10); -- eye of seru
		e.other:Faction(139,-1); -- hand of seru
		e.other:Faction(142,-1); -- heart of seru
		e.other:Faction(284,1); -- seru
		e.other:Faction(141,-1); -- haven smugglers
		e.other:Faction(350,-1); -- validus custodus
		e.other:Faction(206,-2); -- magus conlegium
		e.other:QuestReward(e.self,0,0,0,0,0,1000); -- Faction and EXP
		-- TODO: Make him spawn Tergus Raslin north of Elisah and Run south to 150,1900. He will invis himself.
		-- TODO: http://everquest.allakhazam.com/db/quest.html?quest=1487
	end
	item_lib.return_items(e.self, e.other, e.trade)
end