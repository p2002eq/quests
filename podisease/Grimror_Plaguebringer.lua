--Grimror_Plaguebringer
--CoDecay Alternate Access Quest NPC
--podisease

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Grimror no have time ta talk. Gots [" .. eq.say_link("stuffs") .. "] ta do.");
	elseif e.message:findi("stuffs") then
		e.self:Say("I wuz sent here by Zulort to, err. . . To gadder some alchemy type stuffs. Him have [" .. eq.say_link("big plan") .. "], and need me to travel lots.");
	elseif e.message:findi("big plan") then
		e.self:Emote("laughs. 'Me not tell you dat! Grimror keep secrets secret. You gonna [" .. eq.say_link("help Grimror") .. "] or no?'");
	elseif e.message:findi("help Grimror") then
		e.self:Say("Dat good! Grimror been getting compon ents for dayz now and Grimror still not finushed.  You gonna get [" .. eq.say_link("dem tings") .. "] fur me?");
	elseif e.message:findi("dem tings") then
		e.self:Say("Grimror need bile, dat stuff es strong here! But Grimror keent seem to git eet all. Bile comz from da leetle bugs. Keel little bugs, and geeve Grimror dere leetel bodiez and Grimror give yuuz anyting dat yuuz want. Dere on four leetel buggiez dat Grimror still neez, two uf dem come from da fliez, one comez from da wurmiez, and one comez from the moss-skeeterz. Yuuz bring Grimror dere lavas and Grimror geeve yuuz, and yuuz freends, anyting yuuz want");
	end
end

function event_trade(e)
    local item_lib = require("items");	
	local qglobals = eq.get_qglobals(e.self, e.other);
	
    if item_lib.check_turn_in(e.self, e.trade, {item1 = 9290, item2 = 9291, item3 = 9292, item4 = 9293}) then  --Sengien Larvae Flesh, Generian Larvae Flesh, Scaevian Larvae Flesh, Harrion Larvae Flesh
		e.self:Say("Yuuz dun guud! But Grimror keent geeve you anyting, but Grimror have dis. Grimror also have seekret information. Krypt of Deekay in in here. Dunt tink yuuz wanna go in dere. Dere be mean old rotten keengs in dere, yuuz dunt want ta mess wif dem, dere also be udder sortz uf baddies in dere, be carefuul if yuuz goin dat way. I hurd stories dat Bertoshulus es in dere too, Grimror even saw him in here one time. In dis place yuuz only gots ta worry about Grummus, him fatter dan Grimror, got theek skin too. Him have key ta get inna de Krypt,but Grimror knew da seekret way een. Dat bracer keen make da portil into de Krypt tink dat yuuz belongz dere. Guud barshin!");
		e.other:SummonItem(9294);  --Bangle of Disease Warding 
		if qglobals.pop_alt_access_codecay == nil then
			eq.set_global("pop_alt_access_codecay", "1", 5, "F");
			e.other:Message(15, "You've received a character flag!");		
		end		
		
		--group flagging is out of era (April 7, 2003 patch) -- omitted below
		-- if e.other:IsGrouped() then
			-- group = e.other:GetGroup();
			-- members = group:GroupCount();
			
			-- for n = 1,members do 
				-- member = group:GetMember(n-1);		--still flags all 6 members (0-5)
				-- member_charid = member:CastToClient():CharacterID();
				-- local member_qglobal = eq.get_qglobals(member:CastToClient());
				-- if member_qglobal.pop_alt_access_codecay == nil and member:CastToClient():InZone() then  --checks for flag and that members are in zone
					-- eq.target_global("pop_alt_access_codecay", "1", "F", 0, member_charid, 0);
					-- member:CastToClient():SetZoneFlag(200);
					-- member:Message(15, "You receive a character flag!");
				-- end
			-- end
	end
	
    item_lib.return_items(e.self, e.other, e.trade)
end

