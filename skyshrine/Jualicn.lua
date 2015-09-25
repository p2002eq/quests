function event_say(e)


	if(e.message:findi("hail"))  then
		e.self:Say("Why hello there, "..e.other:GetName..". I do not see many that pass through these chambers unless they are trusted. What brings you before me today?");
	elseif(e.message:findi("Teachings of Relinar"))
		e.self:Say("In order to receive the teachings, you need to gather four runes from the [descendants of Relinar]. Each descendant of Relinar has one of the four runes. You will find them where they stand six abreast in the wasteland. However in order to know that you have my blessing you must present them with a [treasure] that they would know came from me.");
		--Hsagra's Wrath
	elseif(e.message:findi("treasure")) then
		e.other:SummonItem(1908); --Julicn's Token
	elseif(e.message:findi("descendants of Relinar")) then
		e.self:Say("Another wizard joining our ranks? Excellent. Listen closely, " ..e.other:GetName..". I will give you the Lexicon of Relinar, a great and well remembered sorcerer whose teachings are necessary in constructing a spell that is very powerful against the giants. I will give you his ancient lexicon which can harness his teachings if you can carry this large tome. You may need to rearrange your belongings. Are you [ready to receive the lexicon]?");	 
	elseif(e.message:findi("I am ready to receive the lexicon")) then
		e.self:Say("Combine the four runes in this lexicon and you will then have the teachings of Relinar. After you have done this, you are required to speak again with Lawyla about the [problems] we are having [with Kromzek spies].");
		e.other:SummonItem(17061); --Lexicon of Relinar
	end
end
