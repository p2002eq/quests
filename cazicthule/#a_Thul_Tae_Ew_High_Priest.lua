local entid1;
local mob1;
local mob1attack;

function event_combat(e)
	if(e.joined == true) then
		e.self:Shout("Fools! It isss dangerouss to interrupt the sssacrifice! Guards, assssissst me!");
		eq.unique_spawn(48378,0,0,642,1101,-92,135):Emote("attacks with eerie speed!");
		eq.unique_spawn(48379,0,0,585,1146,-92,126):Emote("attacks with eerie speed!");
		eq.unique_spawn(48380,0,0,537,1103,-92,125):Emote("attacks with eerie speed!");
	end
end

function event_death(e)
	e.self:Say("Oh facelesss one, I have fallen! Pleasse avenge the death of your faithful ssservant!");
	eq.load_encounter("ring_of_fear");	
end


