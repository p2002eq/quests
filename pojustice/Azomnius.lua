----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Azomnius (201379)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("hail")) then 
        e.self:Emote("stretches and turns ageless eyes upon you. 'Mortal " .. e.other:Race() .. ". Mortal " .. e.other:Race() .. ", there is trouble for you. Trouble I foresee. Azomnius can see your future, " .. e.other:Race() .. ", and your [" .. eq.say_link("future") .. "] is turbulent.");
    elseif(e.message:findi("future")) then 
		e.self:Say("Already written, is the story of your life, " .. e.other:Race() .. ". Penned with blood, upon pages of flayed skin, bound in tanned flesh and stored with an infinity of likewise tales, [" .. eq.say_link("tales") .. "] for the living, recorded by the dead.");
	elseif(e.message:findi("tales")) then
		e.self:Say("These books can I see. Visit the Spliye Librarium of Tenthia, do I. Visit now, while we speak. Your story I read, and woeful are its twists. Yours is a story of gravity, it bends stories from far and wide to itself. Interesting, it is. Most rare. Throughout Farfurlong, there are few of your kind. Where are you from, wonder I. Perhaps where is not close. . . perhaps I should ask from [" .. eq.say_link("When") .. "]?");
	elseif(e.message:findi("when")) then	
		e.self:Say("Time is abstract, " .. e.other:Race() .. ". Your tales are penned outside of time, stored in the Spliye Librarium, read by me, by others. Your When is distant. Either far past or aeons yet to occur. . . continents will rise and fall between us, " .. e.other:Race() .. ". Tell me, do you know of [" .. eq.say_link("Farfurlong") .. "], even?");
	elseif(e.message:findi("farfurlong")) then	
		e.self:Say("Your eyes tell me all I need to know, " .. e.other:Race() .. ". . . into the aeons I have stepped, with your tale I see pages. . . of such. . . ' His eyes instantly open wide, he regards you with a shocked expression. 'I would not have guessed it possible. . . perhaps the Prophecy of Bridged Time is upon us! I. . . I must. . . read more of your story, " .. e.other:Race() .. ". Much, much more. . .' His eyes close, he appears to slip into a trance, from which you fear to wake him.' ");
	end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end