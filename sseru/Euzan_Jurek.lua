-- Euzan Jerek for Earring of Veracity quest #2

function event_say(e)
	if e.message:findi(hail) then
		e.self:Say(string.format("Greetings, %s!", e.other:GetName()));
	elseif e.message:findi(Torsten) then
		e.self:Say("So Torsten has sent you? He must see the potential within you to help us. I cannot give you any information right now as to who we are. That is a trust you must [earn].");
	elseif e.message:findi(earn) then
		e.self:Emote("leans in and whispers to you. 'Let it be known that assisting us will show your distrust in everything this city stands for. If you do not want to get involved I urge you to walk away now. However if you wish to [bring about change], stay and I will tell you how to earn our trust.'");
	elseif e.message:findi(bring about change) then
		e.self:Say("Good, you must do something for us. One of our members, who needs not be named, is due to be called for the Question. We need you to go into the Heart [Consillium] and replace their records with this one. This false record shows that they have completed their Question and still have time until their next one. Changing the records will make the question pass over us so that we avoid being discovered. Go in stealth, when you have completed this task bring me back the original records and your Insignia Earring.");
		e.other:SummonItem(29855); -- 29855  Replacement Records
	elseif e.message:findi(Consillium) then
		e.self:Say("The Praesertum Consillium are the four structures found in the center of Sanctus Seru. They are surrounding the Arx Seru, which is where Seru himself resides. These buildings are heavily guarded with the leader of each.");
	end
end


function event_trade(e)
	local item_lib=require("items");

	 -- 29856 :  Original Records
	 -- 29857 :  Insignia Earring of Veracity
	if (item_lib.check_turn_in(e.self, e.trade, { item1 = 29856, item2 = 29857 })) then
		e.self:Say("By now you must realize that we need to avoid the question because of whom we are. Seru is not the Noble Paladin this city would have you believe. You see they teach that Katta feared Seru and that he had faked his own poisoning so they could pin the blame on Seru. The next thing that I ask of you, I ask because you can travel without question from one city to another. Go to Katta and give this report to Tilbok Furrunner. Tell him we are successfully rooted within Sanctus Seru and await any commands.");
		e.other:SummonItem(29858); -- 29858  Etched Earring of Veracity
		e.other:SummonItem(29891); -- 29891  Report to Tilbok
		e.other:AddExp(30000);
		e.other:Faction(96,-1); -- Eye of Seru
		e.other:Faction(139,-7); -- Hand of Seru
		e.other:Faction(284,-1); -- Seru
		e.other:Faction(55,-1); -- Coterie of the Eternal Night
		e.other:Faction(138,-1); -- Hand Legionnaries
		e.other:Faction(228,-1); -- Nathyn Illuminious
		e.other:Faction(168,1); -- Katta Castellum Citizens
		e.other:Faction(350,15); -- Validus Custodus
		e.other:Faction(206,1); -- Magus Conlegium
	end


	item_lib.return_items(e.self, e.other, e.trade); -- return unused items
end

 -- End of File, Zone:sseru  NPC:159422 -- Euzan_Jurek
 