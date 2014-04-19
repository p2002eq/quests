function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("glances at you and hurriedly makes a gesture of religious meaning before you and says, 'Yes, yes, I hereby bless you in the name of Prexus. May your catch be plentiful and your nets never snag. Are there any other fishermen seeking a blessing? I'm very busy.'");
	elseif(e.message:findi("your brother")) then
		e.self:Say("What? How do you know fo my brother? Ahh I assume Breya told you. He's been gone for quite some time with no word sent on his progress or his wellbeing. I need to find someone to [check on him].");
	elseif(e.message:findi("check on him")) then
		e.self:Say("Thank you, " .. e.other:GetName() .. ". He's one of our people's most knowledgeable geologists and has left to survey an island out in Erud's Crossing. He was sending monthly reports until two weeks ago when his report never showed up. I'm worried something may have happened to him. Take this note to Yelesom and bring back something to assure me of his safety. A reward fitting a Deepwater Knight shall be yours upon your success.");
		e.other:SummonItem(18173);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18724})) then -- Tattered Note
		e.self:Say("Yes. welcome friend! Here is your guild tunic. You'll make a fine addition to the Deepwater Knights. Go see Dleria, she will get you started in your studies.");
		e.other:SummonItem(13544); -- Old Blue Tunic*
		e.other:Ding();
		e.other:Faction(79,100,0); -- Deepwater Knights
		e.other:Faction(145,15,0); -- High Council of Erudin
		e.other:Faction(143,-15,0); -- Heretics
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 1771})) then
		e.self:Say("Excellent! Thank you for checking on my brother, I am glad to hear that he is well.  Here is something that shall help you on your way.");
		e.other:SummonItem(1763);
		e.other:Ding();
		e.other:AddEXP(300);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98061 -- Gans_Paust