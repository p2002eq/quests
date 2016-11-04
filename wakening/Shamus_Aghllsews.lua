function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to my fiefdom, wayward " .. e.other:Race() .. ". I am Duke Shamus Aghllsews of the Tunarean Court. Only those who pledge friendship or membership to the Court are allowed sanctuary in the Wakening Lands.");
    elseif(e.message:findi("pledge friendship")) then
		e.self:Say("You must first prove your intentions to the Tunarean Court. I will permit you to participate in an oath of friendship only after you bring me four picks used by the Kromrif Laborers that are attempting to build into our lands.");
    end
end

function event_trade(e)
	local item_lib = require("items");
	

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30220,item2 = 30220,item3 = 30220,item4 = 30220})) then -- 
		e.self:Emote("grips your hand in his own and recites an oath in an ancient tongue. 'Should you ever seek membership in this court you are required to receive the support of its counts, countesses, barons, and baronesses. Should they deem you worthy you may present their crests to me and with my approval become a citizen of our kingdom. The Kromrif and Kromzek are persistent in their efforts to expand Kael into the forest of Tunare, they are a threat to all houses of the Tunarean Court. A Kromzek architect occasionally visits the building sites. I desire to acquire his blueprints for the expansion of Kael.'");
		e.other:Faction(344, 10); -- Tunarean Court faction
        e.other:QuestReward(e.self,0,0,0,0,17865,35000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30222})) then -- 
		e.self:Say("You have my gratitude, " .. e.other:GetName() .. ". With these blueprints we can better prepare the forests defenses against the giant invaders. I have yet another favor to ask of you as well. Fill this empty bag with crystallized sulfur. When mixed with the crushed herbs in the other bag it will create an explosion strong enough to destroy stone. Take the two full bags into Kael Drakkel and plant it into a crate of the kromzeks building supplies.");
        e.other:Faction(344, 10); -- Tunarean Court faction
		e.other:SummonItem(24860);
        e.other:QuestReward(e.self,0,0,0,0,17862,35000);	
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 22855})) then -- 
		e.self:Say("You have proven yourself to the Fauns of the Tunarean Court. The destruction of the Kromzeks building supplies will slow their progress for some time.");
		e.other:Faction(344, 10); -- Tunarean Court faction
        e.other:QuestReward(e.self,0,0,0,0,24865,35000);
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1095})) then -- 
		e.self:Say("Thank you " .. e.other:GetName() .. ", here is your reward.  Welcome to full membership in the Tunarean Court.");
		e.other:Faction(344, 10); -- Tunarean Court faction
        e.other:QuestReward(e.self,0,0,0,0,8950,35000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end