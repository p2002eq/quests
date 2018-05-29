--Fellon_Garnuckle
--ID:208070
--Zone:povalor 

function event_say(e)
	if e.message:findi("hail") then
		e.self:Emote("looks around skittishly. 'What are you doing here? [" .. eq.say_link("SPY") .. "]! SPY!");
		eq.signal(208014,1);	--Sergeant_Gerrin_Bakeside
	elseif e.message:findi("SPY") then
		e.self:Say("They are here.  I can see them, no one else can, don't tell the sergeant, I know he won't believe me.  None of them believe me, but they are everywhere.  I can hear them whispering.  Shhh can you [" .. eq.say_link("I can hear them",false,"hear them") .. "]?")
	elseif e.message:findi("can hear them") then
		e.self:Say("Oh, can you? That is very good, you are wise.  Very wise indeed.  Keep your eyes out and your ears open.  The shadow is close. For the honor of Ducee Lealson.");
	elseif e.message:findi("can't hear them") then
		e.self:Say("Ahh you haven't been given the sight.  I have, I can see the truth.  They are coming.")
	end
end