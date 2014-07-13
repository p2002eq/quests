--Meldrath's_Paige script for GM event, actually written by nork! OMG!

function event_say(e)
	if(e.other:Admin() >= 80 and e.message:findi("Hail")) then
		quest::say ("All subvertents will be converted! Meldrath is your new lord and master! All who resist shall be punished!");
	end
	if(e.other:Admin() >= 80 and e.message:findi("who the hell is meldrath")) then
		quest::say ("Blasphemer! Meldrath is the king of all gnomes! The god of tinkering.... The guy I'm here representing? Wow, you guys really dont get out much do you? Surrender or die shorties!");
	end
	if(e.other:Admin() >= 80 and e.message:findi("We shall never surrender")) then
		quest::say ("That does it! Your in trouble now! Im telling Meldrath!");
		quest::emote ("scurries off to tell his master, blabbering about how great he is and how mean you are.");
		eq.zone_emote(14, "You hear the sound of grinding metal, the earth begins to shake as the mechanised army of Meldrath aproaches.");
		
		quest::spawn2 (56173,0,0,700,-1224.3,-107.9,125.4);
		quest::spawn2 (56173,0,0,650,-1224.3,-108.9,125.4);
		quest::spawn2 (56173,0,0,600,-1224.3,-108.9,125.4);
		quest::spawn2 (56173,0,0,550,-1224.3,-107.9,125.4);
		quest::spawn2 (56173,0,0,500,-1224.3,-107.9,125.4);
		quest::spawn2 (56173,0,0,450,-1224.3,-107.9,125.4);
	end
	
	if(e.other:Admin() >= 80 and e.message:findi("your forces are deafeated")) then
		quest::say ("Oh really? Look out unto the battlefield!");
		quest:emote ("begins to cackle wildly");
		if(entitylist : GetMobByNpcTypeId(56173) == nil) then
			eq.zone_emote(14, "The scattered and scarred remains of Meldraths minions begin to crawl together twisting and contorting into a new and deadly shape");
			quest::spawn2 (56174,0,0,700,-1224.3,-107.9,125.4);
			quest::spawn2 (56174,0,0,600,-1224.3,-108.9,125.4);
			quest::spawn2 (56174,0,0,450,-1224.3,-107.9,125.4);
		end
	end
	
	if(e.other:Admin() >= 80 and e.message:findi("you shall not break our defense")) then
		quest::say ("Now you have done it! Surely the pinicale of tinkering robotics! An Austrian action filmstar shall make you grovel!");
		quest:emote ("starts to cower under the shadow of the mechanical monster");
		if(entitylist : GetMobByNpcTypeId(16174) == nil) then
			quest::spawn2 (56175,0,0,600,-1224.3,-108.9,125.4);
			eq.zone_emote(14, "The scrap metal, allthough broken and shattered, begins to form into a terrifying construct of metal and oil");
		end
	end
end




-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
