function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetName() .. ". What brings you to this neck of the woods? You must have heard of my expert tanning skills. I craft some of the finest skin garments this side of Highpass Hold.");
	elseif(e.message:findi("garment")) then
		e.self:Say("Gloves are my specialty. I make four varieties; ratskin, wolfskin, bearskin, and my most sought after type, lionskin.");
	elseif(e.message:findi("wolfskin glove")) then
		e.self:Say("Wolfskin gloves?  Those will cost you 13 gold pieces and you need to bring me a high quality wolf skin as well.");
	elseif(e.message:findi("bearskin glove")) then
		e.self:Say("Ah...  My bearskin gloves are the finest you will find anywhere.  They will cost you 25 gold pieces and you also need to give me a high quality bear skin before I can get to work.");
	elseif(e.message:findi("lionskin glove")) then
		e.self:Say("Interested in the best, are you?  Well, it will cost you.  In addition to a high quality lionskin, I require payment of 96 gold pieces for me to craft you my exquisite lionskin gloves.  Search the northern plains of Karana for highland lions as their skins are the most supple.");
	elseif(e.message:findi("ratskin glove")) then
		e.self:Say("Interested in some ratskin gloves, are you?  Well, before I can start, I need you to provide me a giant rat pelt and 6 gold pieces.  I need to make a living at this, after all...");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 13054,gold = 6})) then
		e.self:Say("Ok! Let me see here.. Hmmm.. Oh, excellent.. Here you go. Some of my finest work, if I must say so myself.");
		e.other:Faction(182,5); -- kithicor residence
		e.other:Faction(265,1); -- protectors of the pine
		e.other:Faction(159,1); -- jaggedpine treefolk
		e.other:Faction(347,-1); -- unkempt druids
		e.other:QuestReward(e.self,0,0,0,0,2312,500);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13755,gold = 13})) then
		e.self:Say("Ok! Let me see here.. Hmmm.. Oh, excellent.. Here you go. Some of my finest work, if I must say so myself.");
		e.other:Faction(182,5); -- kithicor residence
		e.other:Faction(265,1); -- protectors of the pine
		e.other:Faction(159,1); -- jaggedpine treefolk
		e.other:Faction(347,-1); -- unkempt druids
		e.other:QuestReward(e.self,0,0,0,0,2313,1000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13752,gold = 25})) then
		e.self:Say("Ok! Let me see here.. Hmmm.. Oh, excellent.. Here you go. Some of my finest work, if I must say so myself.");
		e.other:Faction(182,5); -- kithicor residence
		e.other:Faction(265,1); -- protectors of the pine
		e.other:Faction(159,1); -- jaggedpine treefolk
		e.other:Faction(347,-1); -- unkempt druids
		e.other:QuestReward(e.self,0,0,0,0,2314,1500);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13766,gold = 96})) then
		e.self:Say("Ok! Let me see here.. Hmmm.. Oh, excellent.. Here you go. Some of my finest work, if I must say so myself.");
		e.other:Faction(182,5); -- kithicor residence
		e.other:Faction(265,1); -- protectors of the pine
		e.other:Faction(159,1); -- jaggedpine treefolk
		e.other:Faction(347,-1); -- unkempt druids
		e.other:QuestReward(e.self,0,0,0,0,2315,2000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end