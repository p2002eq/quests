function event_say(e)
	if(e.message:findi("why were you selected")) then
		e.self:Say("You dare to ask one such as I the will of the Hateful Father?! However. you do seem to be quite lacking in the field of thought and intelligence. which would easily explain why you have not heard my name nor of my [legend].");
	end
	if(e.message:findi("what legend")) then
		e.self:Say("I. my dear witless Dark Elf. was chosen by Innoruuk's hand during the uprising and fall of the [Combine Empire.] When the Teir`Dal first began to discuss the decision to sign a treaty and join the Empire. I was one of the few who opposed siding with humans and the rest of the lowly creatures of this world.");
	end
	if(e.message:findi("why did you return")) then
		e.self:Say("It is the Dark Father's will that I have returned to this realm. I do not question his judgement. nor shall I ever. His will is mine. and I do not question myself. The Dark Father wishes to expand his followers within the Realm of Heroes. and thus. I have been sent as more of a judge and jury for those who would consider themselves [worthy of Innoruuk's recognition] and divine favor.");
	end
end
--END of FILE Zone:neriakb  ID:41082 -- Vorshar_the_Despised


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
