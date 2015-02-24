--Bard Cloak 2
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 2877})) then
		e.self:Say("Good day " .. e.other:GetName() .. ". I've been expecting you. It is both my duty and my pleasure to oversee this early stage of your training. To begin. you must display basic combat capability. To this end. return to me with three shells of scorpions and I will instruct you further.");
		e.other:QuestReward(e.self,0,0,0,0,2877);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3648, item2 = 3648, item3 = 3648})) then
		e.self:Emote("examines the shells");
		e.self:Say("These will do fine. I will fashion a buckler from these shells that will help to preserve your life in combat. As I busy myself with its construction I send you on your next task. As a disciple of the Jharin you will become skilled in the art of pottery.");
		e.self:Say("Grind the femur bone of four grimlings in this container. Take the resulting powder and. in the same container. combine water and xakra worm bile. The resulting clay will yield a special bowl when spun with this sketch and a flask of water on a pottery wheel. Bring the unfired bowl to me.");
		e.other:SummonItem(17235);
		e.other:QuestReward(e.self,0,0,0,0,3651);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3653})) then
		e.self:Emote("carefully inspects the bowl");
		e.self:Say("Not bad for a beginner. Fire it in a kiln with a flask of water and a quality firing sheet. Broker Fahaar is in need of your help. It so happens that he can help you as well. He can supply you with the materials to transform your bowl into a drum that will enhance your percussion songs. Show him your acrylia slate and return to me with the bowl of the Jharin, your initiate's cloak, a stretched hopperhide and a leather cord.");
		e.other:QuestReward(e.self,0,0,0,0,3653);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3654, item2 = 2878, item3 = 3655, item4 = 3656})) then
		e.self:Emote("binds the stretched hide to the bowl with the leather cord");
		e.self:Say("Wonderful! You have done well and are ready for the next portion of your training. I have finished your buckler and enhanced your cloak. They will both prove to be very valuable to you in your service to the Vah Shir. Show your buckler to Hymnist Gawfed for further instruction.");
		e.self:Shout("People of Shar Vahl, it is with great pleasure that I announce the Jharin has accepted as an official recruit. This honorable citizen will henceforth be charged with the duty of supporting and magnifying the spirit of our people through song while always being eager to help any Vah Shir in need. Please help me in celebrating coming of age!");
		e.other:SummonItem(3657);
		e.other:SummonItem(3658);
		e.other:QuestReward(e.self,0,0,0,0,3659,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
