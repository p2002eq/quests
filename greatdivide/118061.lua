local dialogueStarted = false;
local davin;
local gerton;
local lapker;
local laima;
local fomgrut;

function event_spawn(e)
	eq.set_proximity(e.self:GetX()-100,e.self:GetX()+100,e.self:GetY()-100,e.self:GetY()+100);
end

function event_enter(e)
	if (dialogueStarted == false) then
		dialogueStarted = true;
		davin = eq.get_entity_list():GetMobByNpcTypeID(118077);
		gerton = eq.get_entity_list():GetMobByNpcTypeID(118076);
		lapker = eq.get_entity_list():GetMobByNpcTypeID(118075);
		laima = eq.get_entity_list():GetMobByNpcTypeID(118073);
		fomgrut = eq.get_entity_list():GetMobByNpcTypeID(118072);
		herga = eq.get_entity_list():GetMobByNpcTypeID(118072);
		e.self:Say("Good day my friends, it is good to see you all are alive and well.");
		eq.set_timer("one",8000);
	end
end

function event_combat(e)
	if(e.joined == true) then
		e.self:Say("Help comrades!");
		eq.stop_all_timers(e.self);
		gerton:CastToNPC():AddToHateList(e.other,1);
		davin:CastToNPC():AddToHateList(e.other,1);
		lapker:CastToNPC():AddToHateList(e.other,1);
		laima:CastToNPC():AddToHateList(e.other,1);
		fomgrut:CastToNPC():AddToHateList(e.other,1);
		herga:CastToNPC():AddToHateList(e.other,1);

	end
end

function event_timer(e)
	if (e.timer == "one") then
		davin:CastToNPC():Say("Well, we are alive, but I'd hardly say we're well... We have heard of the death of Rodrick, and the Dain is calling on all citizens of Thurgadin to flush out any opposition to the throne. If we're tied to your dealings with the Kromrif we'll be sent to the bottom of the well for sure.");	
		eq.set_timer("two",18000);
	elseif(e.timer == "two") then
		e.self:Say("The Dain knows nothing, and I have a plan to keep it that way. I have given the matter much thought, and I have gathered you all here to ask for your help.");
		eq.set_timer("three",16000);
	elseif(e.timer == "three") then
		gerton:CastToNPC():Say("We all saw what happened when Rodrick agreed to help you. I, for one, am none too eager to take on these new friends of the Dain.");
		eq.set_timer("four",15000);
	elseif(e.timer == "four") then
		e.self:Say("'Rodrick knew what he was getting into, and so did you. It's a bit too late for second thoughts. I don't recall seeing any hesitation when the loot was being passed around.");
		eq.set_timer("five",16000);
	elseif(e.timer == "five") then
		lapker:CastToNPC():Say("Go ahead Murdrick, what's this plan of yours?");
		eq.set_timer("six",12000);
	elseif(e.timer == "six") then
		e.self:Say("As I said I've thought long and hard of our situation and I feel we are indeed in danger. My cousin Berradin is a captain in the Dain's army. I've always been uneasy about him, but now more than ever. He could easily betray many of us and take credit for destroying the rebellion.");
		eq.set_timer("seven",19000);
	elseif(e.timer == "seven") then
		e.self:Say("My plan is to poison him and plant a suicide note on the body, a note in which he would take full responsibility for the actions of the rebels. This would both ensure that he could never betray us and would give the Dain closure. We will be free to continue working with our Kromrif friends without fear of discovery.");
		eq.set_timer("eight",22000);
	elseif(e.timer == "eight") then
		davin:CastToNPC():Say("Sounds good boss, but how do you plan on poisoning him?");
		eq.set_timer("nine",12000);
	elseif(e.timer == "nine") then
		e.self:Say("Berradin has a weakness for drink, one drink in particular... Avalanche Ale. I have had the recipe altered slightly to include a deadly poison. I have much to do, I need one of you to brew the drink and bring it to me. I'll handle the rest.");
		eq.set_timer("ten",22000);
	elseif(e.timer == "ten") then
		gerton:CastToNPC():Emote("chuckles, 'Once again, Murdrick, you've put us at ease in the middle of a treacherous predicament. I will volunteer to brew the drink.'");
		eq.set_timer("eleven",15000);
	elseif(e.timer == "eleven") then
		e.self:Emote("smiles, 'Very well, take this recipe and follow it exactly. It won't be easy, but you'll be richly rewarded for your efforts I assure you. Send word to meet me back here when you are finished.");
		eq.set_timer("twelve",17000);
	elseif(e.timer == "twelve") then
		e.self:Say("Consider it done. Be sure to watch yourself Murd, the Dain's gotta be suspicious of ya, being Rodrick's brother and all. And those outlander friends of his are dangerous, chopped down the Ry`Gorr chief like he was nothin!");
		dialogueStarted = false;
	end
	eq.stop_timer(e.timer);
end