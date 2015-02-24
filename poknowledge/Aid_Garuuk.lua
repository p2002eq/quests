--Hoop of the Traveller
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hullo traveler, an' welcum ta New Tanaan. Have ya been sittin' in da library very long? Da pages contained whif'in dese walls hold many inturestin' bits uv knowledge. As aides ta da council, our job is ta help assist our represenuhtives wif da task uv cullectin' more an' more knowledge fer da library. Right now I'm busy researchin' artifacts uv power fer Srethix but I'm missin' sum books I need. An' worse den dat, all dis werk has made me late in deliverin' sum supplies ta Grobb. Do ya think you could [give me a hand] whif dat?");
	elseif(e.message:findi("i will give you a hand")) then
		if(e.other:Race() == "Ogre") then
			e.self:Say("Dat wud be great! My cuzin has been lookin' fer sum new ingredients ta experuhment whif his alchemy. I wuz suppos'd ta bring him sum but I didn't have da time. If you could get a Swirling Banshee Essense, Arachnae Fangs, a Wrulon Claw, an' a Blood Raven Tailfeather, take dem ta my cuzin Bregna in Grobb. He'll be most happy ta see dem delivured.");
		else
			e.self:Say("Umm, on secund thought, maybe you shudn't help me after all. Da trolls where I come frum aren't as kind an' undurstandin' as I am.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 28740})) then --Troll Receipt
		if(e.other:Race() == "Ogre") then
			e.self:Say("Dank yoo " .. e.other:GetName() .. ". Take diz.");--Text made up, I have no reference.
			e.other:QuestReward(e.self,0,0,0,0,2418); --Hoop of the Traveler
		else
			e.self:Say("What's dis? A receipt frum a " .. e.other:Race() .. "? You cud not have gottun dis from Bregna, dis must be a forgury. I'll keep dis so you can't fool anywun else whif dis again.");
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
