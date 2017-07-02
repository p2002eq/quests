-- Crest of the Unicorn Quest (requires PoMischief)
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Salutations! I am the Prince of the Tunarean Court! What brings you to this most sacred of all Tunares blessed creations?");
    elseif(e.message:findi("Lady Gelistial")) then
		e.self:Say("Gelistial is a very wise Lady. She does well in her duties to the court as well as the duties to her people. Unfortunately the weight of her responsibility prevents us from meeting as often as I would like.");
    elseif(e.message:findi("Lithiniath")) then
		e.self:Say("Ahh..Lithiniath, the first of the black unicorns, cursed by Fizzlethorpe Bristlebane to spread madness and delusions. Lithiniath is not evil, but his lawful magical nature has been replaced with a chaotic reflection of it that has twisted his mind. Thank you for inquiring after him. I hope to save him one day when the domain of Bristlebane is accessible once more.");
		e.other:SummonItem(24869);
	elseif(e.message:findi("phat lewt")
		e.self:SpellFinished(982, e.other);  --cast Cazic Touch (10K unresistable dmg)
    end
end

-- THIS IS THE CORRECT QUEST LINE - CHANGED UNTIL MISCHIEF AVAILABLE

--    elseif(e.message:findi("Lithiniath")) then
--		e.self:Say("Ahh..Lithiniath, the first of the black unicorns, cursed by Fizzlethorpe Bristlebane to spread madness and delusions. Lithiniath is not evil, but his lawful magical nature has been replaced with a chaotic reflection of it that has twisted his mind. Lithiniaths physical form can not survive the removal of the chaotic magical nature. The only cure for Lithiniath is death and rebirth into a lawful vessel.");
