---- Quest:Snarla's Friendship
function event_say(e)
    fac = e.other:GetFaction(e.self);
        if(e.message:findi("hail")) then
            e.self:Say("Whatchoo want?");
        elseif(e.message:findi("dryad pate")) then
			if (fac <=5) then
				e.self:Say("You want my secret recipe for Nymph Pate? You don't look like you could even cook a [" .. eq.say_link("Patty Melt") .. "] without making a disgusting mess, let alone something as delicate and refined as Nymph Pate!");
			else
				dialogue_reject(e.self);		--NPC will not advance quest without proper faction
			end
        elseif(e.message:findi("patty melt")) then
			if (fac <=5) then	
				e.self:Say("Yeah, you know a patty melt! It's like a [" .. eq.say_link("Grilled Cheese Sandwich") .. "] with some meat stuck in between the whole mess. Sheesh, are you a vegetarian or something?");
			else
				dialogue_reject(e.self);		--NPC will not advance quest without proper faction
			end
        elseif(e.message:findi("grilled cheese sandwich")) then
            if (fac <=5) then
				e.self:Say("Great Brell's gravy, you are inept aren't you! I'll say this slowly. You take some bread, then you take some cheese then you put them together and cook it with a frying pan! I'll tell you what, if you can manage to figure out how to make a Patty Melt, bring it back to me and if it's halfway edible I'll give you my recipe for Nymph Pate.");
			else
				dialogue_reject(e.self);		--NPC will not advance quest without proper faction
			end
	  	end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8194})) then -- Patty Melt
        e.self:Emote("wolfs down the Patty Melt in one bite.");
        e.self:Say("Yeah, this isn't too bad I guess. Not nearly as good as I could have done though.");
        e.self:Emote("scribbles on a piece of paper and hands it to " .. e.other:GetName() .. ".");
        e.self:Say("Here is the recipe you wanted.");
        e.other:Faction(96,-5); -- Faction
        e.other:QuestReward(e.self,0,0,0,0,18430,1000); -- Elegant Pates
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

function dialogue_reject(npc)
	local phrase = math.random(1,4);
	if (phrase == 1) then
		npc:Say("I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.");
	elseif (phrase == 2) then
		npc:Say("Oh look, a talking lump of refuse. How novel!");
	elseif (phrase == 3) then
		npc:Say("Is that your BREATH , or did something die in here? Now go away!");
	elseif (phrase == 4) then
		npc:Say("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.");
	end
end