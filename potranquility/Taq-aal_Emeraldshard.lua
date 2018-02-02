--Taq`aal_Emeraldshard (203377)
--potranquility

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Welcome, welcome " .. e.other:GetName() .. ".  I have been designated to be keeper of the portal to the Plane of Earth.  The foci and myself maintain the portal and make sure that only those who are [ " .. eq.say_link("worthy") .. "] are allowed to pass through.");
	elseif e.message:findi("worthy") then
		e.self:Say("While it appears to me that you are quite worthy of entrance into the Rathe's domain, it is not my decision to make.  When you have earned passage into the Plane of Earth you will need not question your worth.");
	end
end

function event_trade(e)		--standard item return script
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end





