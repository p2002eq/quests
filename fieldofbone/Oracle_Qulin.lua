--Shaman Skull Quest 7
function event_trade(e)
	local item_lib = require("items");
	--Turn in the a dusty iksar skull
	if(item_lib.check_turn_in(e.trade, {item1 = 30984}) and e.other:GetFaction(e.self) < 6 and tonumber(qglobals.shmskullquest) > 9) then
		e.self:Say("Granix did well to send you to me, I may yet be able to recover the spirit of this ancient and set it free. Come! I shall need your help with this ritual.");
		eq.spawn2(78000,0,0,e.self:GetX() + 5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());--spawn An Arisen Iksar
		e.other:QuestReward(e.self,0,0,0,0,30984); --give the skull back incase you fail
	--Turn in the Wet Skull Fragments
	elseif(item_lib.check_turn_in(e.trade, {item1 = 30985}) and e.other:GetFaction(e.self) < 6 and tonumber(qglobals.shmskullquest) > 9) then
		e.self:Say("It seems this particular ancient does not wish to be put to rest. Return this note to Hierophant Granix and tell him what happened. He will surely wish this skull to be disposed of properly, but I do not have the power to do it myself.");
		eq.set_global("shmskullquest","11",5,"F"); --set a global flag so that user can do shm skull quest part 7.4
		e.other:QuestReward(e.self,0,0,0,0,30986); --note to Hierophant Granix
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
