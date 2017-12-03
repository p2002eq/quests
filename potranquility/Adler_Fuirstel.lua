--Adler_Fuirstel
--Planar Progression (CoDecay Flag)
--potranquility

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("Hail") and qglobals.pop_pod_alder_fuirstel == nil then	 
		e.self:Say("Can you smell it? It is the musk of death and pestilence. It is a smell that I have welcomed for so long, but now it turns my stomach. My brother Milyk and I have come here from Qeynos. We were members of the Bloodsabers but sought higher enlightenment. Upon arriving here Milyk began to channel all of his energy into opening the [" .. eq.say_link("portal to the Plane of Disease") .. "].");
	elseif e.message:findi("portal to the plane of disease") and qglobals.pop_pod_alder_fuirstel == nil then	 
		e.self:Say("We sought only the wisdom of Bertoxxulous. When Milyk finished his chant and the portal opened, it began to spew out this vile pestilence you see before you. Milyk caught the brunt of the plague, and his condition worsens. I have been infected as well, and am weak but I will go into the plane to save my brother if I must. The weavers have seen in their tapestries that one holds a [" .. eq.say_link("ward") .. "] that will halt the effects of the toxins that the touch of Bertoxxulous brings.");
	elseif e.message:findi("ward") and qglobals.pop_pod_alder_fuirstel == nil then	
		e.self:Say("The ward is carried by the one that Bertoxxulous has created to protect the entrance into his den. If you dare travel into this pungent plane and find the ward bring it back. If we can halt the advanced toxins in Milyk's system maybe we can save him.");
		eq.set_global("pop_pod_alder_fuirstel", "1", 5, "F");
		e.other:Message(4,"You receive a character flag!");
	elseif e.message:findi("hail") and tonumber(qglobals.pop_pod_alder_fuirstel) == 1 and tonumber(qglobals.pop_pod_grimmus_planar_projection) == 1 and qglobals.pop_pod_elder_fuirstel == nil then
		e.self:Say("Please you must hurry! Take the ward that surrounds you back to my brother and lift the sickness that has come over him!");
	elseif e.message:findi("hail") and tonumber(qglobals.pop_pod_alder_fuirstel) == 1 and tonumber(qglobals.pop_pod_grimmus_planar_projection) == 1 and tonumber(qglobals.pop_pod_elder_fuirstel) == 1 then
		e.self:Say("Did you learn how to get into Bertoxxulous' lair when you retrieved the ward? In my brother's vision he spoke of a huge metal pipe, that would only be affected by one that carries the knowledge of what lies behind it. Go now into disease and move the rotted pipe that is behind Grummus. There you will find the Lord of Pestilence. I beg of you for the mercy of my brother, and myself, weaken Bertoxxulous to a point where his curse on us can be lifted.");
	end
end
	 
 