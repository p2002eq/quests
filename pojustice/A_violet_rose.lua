--A_violet_rose (201195)
--script to spawn #Wraith_of_Domagr (201521) on proximity
--pojustice

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	eq.set_proximity(xloc - 20, xloc + 20, yloc - 20, yloc + 20, zloc - 20, zloc + 20);
end

function event_enter(e)
	e.self:Emote("A violet rose lies in the middle of the floor.  It seems to call to you in a faint whisper.  As you get closer, it suddenly explodes in a cloud of thick black smoke.");
	eq.spawn2(201521,0,0,162,-308,0,430);	--#Wraith_of_Domagr (201521)
	eq.spawn2(201521,0,0,162,-270,0,335);	--#Wraith_of_Domagr (201521)
	eq.spawn2(201521,0,0,106,-270,0,172);	--#Wraith_of_Domagr (201521)
	eq.spawn2(201521,0,0,106,-308,0,77);	--#Wraith_of_Domagr (201521)
	eq.depop_with_timer();
end