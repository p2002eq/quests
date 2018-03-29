-- Players can turn in tokens received from events, then use them to purchase items

local items = {};
items[1] = { "Guide Pack", 3, 17800};
items[2] = { "Journeyman's Boots", 3, 2300};
items[3] = { "Da Oogly Stick", 5, 31861};
items[4] = { "Stone of Gnoming", 5, 31863};
items[5] = { "Ring of Halves", 5,31854};
items[6] = { "Da Brick o Ogreing", 5, 31851};
items[7] = { "Scroll of Knowledge", 5, 31855};
items[8] = { "Iksar Egg", 5, 31862};
items[9] = { "Fuzzy Foothairs", 5, 31859};
items[10] = { "Treehuggers Shrub", 5, 31860};
items[11] = { "Wreath of Takish Hiz", 5, 31853};
items[12] = { "Guise of the Deceiver", 5, 2469}; 
items[13] = { "Breezeboots Frigid Gnasher", 10, 27310};
items[14] = { "Holgresh Elder Beads", 10, 24890};
items[15] = { "Circlet of Shadow", 15, 14730};
items[16] = { "P2002's Trinket of the Banker", 15, 137322};


function event_say(e)
	local qglobals = eq.get_qglobals();
	local forumName = e.other:GetForumName(e.other:AccountID());
	local globalName = forumName .. "-GMPoints";
	local num = qglobals[globalName];
	if (e.message:findi("hail")) then
		e.other:Message(0,"Have you come to [" .. eq.say_link("purchase") .. "] an [" .. eq.say_link("item") .. "], or turn in some [" .. eq.say_link("tokens") .. "]?");
	elseif(e.message:findi("purchase")) then
		e.other:Message(0,"If you wish to purchase an [" .. eq.say_link("item") .. "], say the exact name of the item to me that you wish to purchase.  Be warned though, no paybacks!");		
	elseif(e.message:findi("item")) then
		e.other:Message(0,"The [" .. eq.say_link("list") .. "] shows the costs associated with the items available for purchase.");
	elseif(e.message:findi("list")) then
		e.other:Message(0,"Here is a list of the current items you are eligible to purchase and their associated costs.");
		for k, v in ipairs(items) do
			e.other:Message(15,tostring(v[2]) .. " points - " .. eq.item_link(v[3]));
		end
	elseif(e.message:findi("tokens")) then
		e.other:Message(0,"Adventurers can attain gm tokens by participating in events.  These tokens can be turned in for [" .. eq.say_link("points") .. "] that can be used to [" .. eq.say_link("purchase") .. "] items");
	elseif(e.message:findi("points")) then
		if (num ~= nil ) then
			e.other:Message(15,"You currently have " .. num .. " point" .. (num ~= 1 and "s." or "."));
		else
			e.other:Message(15,"You currently have zero points.");
		end
	else
		for k, v in ipairs(items) do
			if (string.find(e.message:upper(), v[1]:upper())) then
				if (e.other:HasItem(v[3])) then
					e.other:Message(13,"You already own that item!");
				else
					local qglobals = eq.get_qglobals();
					local tokens = qglobals[e.other:GetForumName(e.other:AccountID()) .. "-GMPoints"];
					if (tokens ~= nil) then
--						eq.zone_emote(15,"Have: " .. tokens .. "    Cost: " .. tostring(v[2]));
						if (tonumber(tokens) >= v[2]) then
							e.other:SummonItem(v[3]);
							local newPoints = tostring(tonumber(tokens) - v[2]);
							eq.set_global(globalName,newPoints,7,"F");
							e.other:Message(15,"Congratulations, here is your " .. eq.item_link(v[3]) .. ".  You now have " .. newPoints .. " points left.");
						else
							e.other:Message(0,"You don't have enough [" .. eq.say_link("points") .. "], perhaps you should look at earning some more [" .. eq.say_link("tokens") .. "].");
						end
					else
						e.other:Message(13,"You don't have any points!");
					end
				end		
			end
		end
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals();
	local forumName = e.other:GetForumName(e.other:AccountID());
	local globalName = forumName .. "-GMPoints";
	local num = qglobals[globalName];

	if (num == nil) then
		eq.set_global(globalName,"0",7,"F");
		num = "0";
	end
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 100010})) then -- Copper Token
		eq.set_global(globalName,tostring(tonumber(num) + 1),7,"F");
		e.other:Message(15,"Here is one point for your copper token.  You now have " .. tostring(tonumber(num) + 1) .. " point" .. (num ~= 1 and "s." or "."));
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 100009})) then -- Silver Token
		eq.set_global(globalName,tostring(tonumber(num) + 3),7,"F");
		e.other:Message(15,"Here is three points for your silver token.  You now have " .. tostring(tonumber(num) + 3) .. " points.");
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 100008})) then -- Gold Token
		eq.set_global(globalName,tostring(tonumber(num) + 5),7,"F");
		e.other:Message(15,"Here is five points for your gold token.  You now have " .. tostring(tonumber(num) + 5) .. " points.");
	end
	item_lib.return_items(e.self, e.other, e.trade);
end