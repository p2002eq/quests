-- Scout_Rahjiq (57112) in LFay for BST epic

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is a pleasure to meet you, but I do not have time to speak.  I am waiting on official word from Shar Vahl.  If you have been sent to assist me, please show me the Official Seal of the Khati Sha at this time.  If you are not such a person, please carry on with your business and leave me to tend to mine.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9031})) then -- Official Seal of the Khati Sha
		e.self:Say("Keep your head down, mate! The spirit that you have come for is very close. I have spotted it several times today. It keeps appearing near that odd structure just over the hill. Be careful not to attract the attention of those invisible creatures that roam near the structure. Just release the spirit and return the totem to me. I'll prepare the totem for placement in the container that you were given.");
		local spawnx = -1675;
		local spawny = -337;
		local spawnz = 0;
		
		eq.local_emote({ e.self:GetX(), e.self:GetY(), e.self:GetZ() }, 1, 200, "The air before the large monolith grows solid, as misty tendrils wrap together in the shape of a large wolf.")
		eq.spawn2(57119,0.0,0,spawnx,spawny,spawnz,0); -- #The_Spirit_of_Malevolence
		
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 9034})) then -- Totem of the Wolf
		e.self:Emote("wraps the totem and returns it with the seal you gave him and says, 'That spirit was very powerful. I'm glad that you were able to release it. Please keep this totem safe until you can return to Shar Vahl. Once you collect all of the totems, seal the box and return it to your master. May the spirits watch over you!'");
		e.other:SummonItem(9031); -- Returns Official Seal of the Khati Sha
		e.other:QuestReward(e.self,0,0,0,0,9035); -- Wrapped Wolf Totem
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
