--Eriak is for Black Insanity (Rallos Zek bane) weapons. They were originally going to be the only way to harm Rallos, but he was changed to where he could be hit with normal weapons. Eriak is also used for the 'Proof for Phara Dar' quest.

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("hail") and qglobals.pop_tactics_tallon == 1 and qglobals.pop_tactics_vallon == 1 then
		e.self:Emote("grins at you coldly. 'The twins lie bleeding at the feet of Rallos, and the halls of Drunder shiver with uncertainty. But one challenge lies before you. Face the warlord and his two injured acolytes and the power of Drunder is yours for the taking. The Warlord will not fall easily. The weapons of dark courage will not be enough, your [" .. eq.say_link("weapons") .. "] will require the power of torment to topple the Warlord.");
	elseif e.message:findi("weapons") and qglobals.pop_tactics_tallon == 1 and qglobals.pop_tactics_vallon == 1 then
		e.self:Say("Though your weapons may have been effective against the twins, they will prove of little use against the Warlord. Temper them with the Torment of Saryn and you may yet be able to cleave the armor of the warlord. Insanity is not easily manipulated though. You'll have to suspend it in the [" .. eq.say_link("blood") .. "] of Zek.");
	elseif e.message:findi("blood") and qglobals.pop_tactics_tallon == 1 and qglobals.pop_tactics_vallon == 1 then
		e.self:Emote("looks at you silently for a moment. His eyes scan from your feet up to your face and linger there, staring into your eyes. He blinks once, slowly. He then draws a dagger from his waist and throws the iron gauntlet from his left hand to the floor. The dagger drifts across his forearm, and without a sound cuts into his calloused skin. A trickle of dark blood creeps down his arm and drips into a small vial in Eriak's right hand. He hands you the vial, staring through your eyes into your soul without a word.");
		e.self:SummonItem(28592); 
	else
		e.self:Emote("glares at you through blackened eyes of malice. 'Foolish, but brave I suppose. As if that word has any meaning in this place. Prove yourself on the field of blood if you dare.");
	end
end

--Submitted by Jim Mills