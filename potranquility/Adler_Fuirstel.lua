--Adler_Fuirstel (203394)
--Grummus/Crypt of Decay Planar Progression
--potranquility

--	Pre-req flags required:
--	None

--	Flagging Steps:
-- 	qglobals.pop_pod_alder_fuirstel (1) -- PoDisease Pre-Flag (said "what ward" to Adler Fuirstel)
-- 	qglobals.pop_pod_grimmus_planar_projection (1) -- Killed Grummus and hailed Planar Projection (PoD Flags Finished)
-- 	qglobals.pop_pod_elder_fuirstel (1) -- Elder Pre-Flag (Start CoDecay Questline with Elder Fuirstel)  **REQUIRES BOTH PRE-FLAGS

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);

	--Initial Text with Grummus not killed
	if(e.message:findi("Hail") and qglobals.pop_pod_grimmus_planar_projection == nil) then	 
		e.self:Say("Can you smell it? It is the musk of death and pestilence. It is a smell that I have welcomed for so long, but now it turns my stomach. My brother Milyk and I have come here from Qeynos. We were members of the Bloodsabers but sought higher enlightenment. Upon arriving here Milyk began to channel all of his energy into opening the [" .. eq.say_link("portal to the Plane of Disease") .. "].");
	elseif(e.message:findi("portal to the plane of disease") and qglobals.pop_pod_grimmus_planar_projection == nil ) then
		e.self:Say("We sought only the wisdom of Bertoxxulous. When Milyk finished his chant and the portal opened, it began to spew out this vile pestilence you see before you. Milyk caught the brunt of the plague, and his condition worsens. I have been infected as well, and am weak but I will go into the plane to save my brother if I must. The weavers have seen in their tapestries that one holds a [" .. eq.say_link("ward") .. "] that will halt the effects of the toxins that the touch of Bertoxxulous brings.");
	elseif(e.message:findi("ward") and qglobals.pop_pod_grimmus_planar_projection == nil) then
		e.self:Say("The ward is carried by the one that Bertoxxulous has created to protect the entrance into his den. If you dare travel into this pungent plane and find the ward bring it back. If we can halt the advanced toxins in Milyk's system maybe we can save him.");
		if(qglobals.pop_pod_alder_fuirstel == nil) then
			e.other:Message(15,"You've received a character flag!");
			eq.set_global("pop_pod_alder_fuirstel", "1", 5, "F");
		end
		
	--Quest Text if Grummus dead and not talked to Elder Fuirstel to start Bertoxx quest line
	elseif(e.message:findi("hail") and tonumber(qglobals.pop_pod_alder_fuirstel) == 1 and tonumber(qglobals.pop_pod_grimmus_planar_projection) == 1 and qglobals.pop_pod_elder_fuirstel == nil ) then
		e.self:Say("Please you must hurry! Take the ward that surrounds you back to my brother and lift the sickness that has come over him!");
		
	--Quest Text if Grummus dead and spoken to Elder Fuirstel
	elseif(e.message:findi("hail") and tonumber(qglobals.pop_pod_elder_fuirstel) == 1) then
		e.self:Say("Your service to me and my brother will never be forgotten.  We are concentrating on how to close this portal now.  The Lord of Pestilience has made it abundantly clear that he cares not for his followers.  Thank you again, and good luck to you in your travels.");
	end
end

function event_trade(e)		--standard item return script
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end


