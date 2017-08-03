function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("By Cazic-Thule. I am going to kill him!  If he keeps up that endless chatter.. Oh. hello there. " .. e.other:GetName() .. ".  Please feel free to peruse my wares.");
	end
end