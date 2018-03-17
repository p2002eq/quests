--Elder_Fuirstel
--Planar Progression (CoDecay Flag/Bertoxx)
--potranquility

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("hail") and tonumber(qglobals.pop_pod_alder_fuirstel) == 1 and tonumber(qglobals.pop_pod_grimmus_planar_projection) == 1 and qglobals.pop_pod_elder_fuirstel == nil then
		e.self:Emote("slowly turns towards you. You can feel the heat radiating from his face. The warding that envelopes your body reaches out and begins to surround him. You immediately see improvement in his condition. The pus filled sores covering his face and his burning fever start to vanish.");
		e.self:Say("Thank you friend. I no longer feel the touch of death on my soul. However I do feel the grasp on Bertoxxulous, his plague is still upon me but not spreading throughout my body. I fear the only way to remove this pox would be to weaken Bertoxxulous enough that his curse would be lifted. I now renounce my faith in Bertoxxulous, please fell this god so that I may continue and learn from my mistakes.");
		eq.set_global("pop_pod_elder_fuirstel", "1", 5, "F");
		e.other:Message(4,"You receive a character flag!");
	elseif e.message:findi("hail") and tonumber(qglobals.pop_cod_bertox) == 1 then
		e.self:Say("Welcome back friend. I must tell you that my brother and I shall never forget what you have done for us. We have since renounced our following of Bertoxxulous, for in him we only found suffering. We have joined a new following, learning from the gods without their direct influence over us. I shall not keep you though, thank you once again!");
		eq.set_global("pop_cod_final","1",5,"F");
		e.other:Message(15,"You receive a character flag!");
	end
end