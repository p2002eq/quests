function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met. " .. e.other:GetName() .. "! Come in out of the cold and warm yer bones with one of my several fine house brews!  A swig o' whiskey will be sure ta put some color back inta ya!");
	end
end
