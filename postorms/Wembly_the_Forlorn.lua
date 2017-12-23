--Wembly_the_Forlorn
--Alternate Access: Plane of Tactics

function event_say(e)
	if e.message:findi("hail") then
		e.self:Emote("grumbles under his breath, 'Yes, yes, I see you there. No need for you to shout I can see you just fine! Now, what was I saying? Yes that's right... let me know when you are [" .. eq.say_link("done") .. "].");
	elseif e.message:findi("done") then
		e.self:Say("Yes done! Weren't you paying attention? Once you've gathered all the pieces of the [" .. eq.say_link("key") .. "] bring it to me and I'll put them back together for you.");
	elseif e.message:findi("key") then
		e.self:Say("THE Key, you really are as thick skulled as you look. You [" .. eq.say_link("agree to help") .. "] me and you aren't even paying attention.");
	elseif e.message:findi("agree to help") then
		e.self:Say("You agree to help? Great! I haven't even told you what I needed yet, or why. It is very noble of you to offer me your assistance. I've been trapped here for a little too long, I washed up on the shore still [" .. eq.say_link("tied to the mast") .. "] of my ship. Wonder that I even survived the storm.");
	elseif e.message:findi("tied to the mast") then
		e.self:Say("The Diaku Raiders, filthy sort if you ask me. I was out on a shipping run, when Diaku attacked, they pillaged all of my goods, then tied me to the mast and left me floating a sea. Then the storm came and ate my ship, and I woke up here, I swear that I saw some [" .. eq.say_link("Diaku") .. "] washed up on the shore with me.");
	elseif e.message:findi("Diaku") then
		e.self:Say("The Diaku that attacked me! Pay attention for Karana's sake! You appear to be the fighting sort. You can help me kill the Diaku at their source in [" .. eq.say_link("Drunder") .. "].");
	elseif e.message:findi("Drunder") then
		e.self:Say("Drunder! The Fortress of Zek, the Zeks don't trust any one mortal to have free access to the fortress. The Diaku come and go in fours, and four parts are needed for entry. Of course they won't part with them easily. If you find four, and bring me four, I can make the four into one, and with one, you can get into Drunder without three more. Then, with your one, you can kill all of them. I would do it myself, but with my bad knee and all. . .");
	end
end

function event_trade(e)
    local item_lib = require("items");	
	local qglobals = eq.get_qglobals(e.self, e.other);
	
    if not e.other:IsRaidGrouped() and item_lib.check_turn_in(e.self, e.trade, {item1 = 29216, item2 = 29217, item3 = 29218, item4 = 29219}) then  --Quarter of Diaku Emblem x4
		e.self:Say("What's this? Four pieces of a Diaku Emblem? Why ever would you give these to me? Well I think I can get them to fit back together. You know, while you have this, I would be quite happy if you would avenge the loss of my dear ship and kill every Diaku you find? Yes that would be very good indeed. Here is your key, and a key for all your companions as well.");
		e.other:SummonItem(29215);  --Completed Diaku Emblem
		
		--zone flagging
		if e.other:IsGrouped() then
			group = e.other:GetGroup();
			members = group:GroupCount();
			
			for n = 1,members do 
				member = group:GetMember(n-1);		--still flags all 6 members (0-5)
				member_charid = member:CastToClient():CharacterID();
				local member_qglobal = eq.get_qglobals(member:CastToClient());
				if member_qglobal.pop_alt_access_potactics == nil and member:CastToClient():InZone() then  --checks for flag and that members are in zone
					eq.target_global("pop_alt_access_potactics", "1", "F", 0, member_charid, 0);
					member:CastToClient():SetZoneFlag(214);
					member:Message(15, "You receive a character flag!");
				end
			end
		elseif qglobals.pop_alt_access_potactics == nil then
			eq.set_global("pop_alt_access_potactics", "1", 5, "F");
			e.other:Message(15, "You receive a character flag!");		
		end		
	end
	
    item_lib.return_items(e.self, e.other, e.trade)
end
 
