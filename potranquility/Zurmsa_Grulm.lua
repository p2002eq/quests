--Zurmsa_Grulm (203389)
--potranquility

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("was humming as you approached.  As you hail her. the humming turns into a surprisingly loud outburst of song!  Her arms flail and fish guts fly. as she dances around with troll-like gracefulness!"); 
		e.self:DoAnim(58);	--dance
	end
end