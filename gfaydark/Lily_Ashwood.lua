function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, " .. e.other:GetName() .. ". You wouldn't by chance happen to be a ranger, would you?'");
	elseif(e.message:findi("ranger")) then
		e.self:Say("I sure love a strong ranger. Especially Ganelorn Oast. He's so dreamy and handsome. I think one day he's going to ask me to marry him.");
	end
end

-- END of FILE Zone:gfaydark  ID:54082 -- Lily_Ashwood 