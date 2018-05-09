----------------------------------------------------------------------
-- Arc: Justice Flagging
-- Zone: Plane of Justice
-- NPC: Mavuin
-- Flags Used: pop_poj_mavuin, pop_poj_tribunal, pop_poj_valor_storms
----------------------------------------------------------------------

function event_say(e)
    local qglobals = eq.get_qglobals(e.other);

    if(e.message:findi("hail") and (qglobals.pop_poj_mavuin == nil)) then
        e.self:Emote("strains his eyes to look up at you in disbelief, then reaches down into a rusted vent and pulls out a journal.  'Please I implore you, take word to the Tribunal.  I have done nothing wrong, yet I have been sentenced to eternity in this cell.  I wish to present all of the [" .. eq.say_link("what information?",false,"information") .. "] about my case to them.  They must listen to my plea if they are truly the gods of justice.'");
    elseif(e.message:findi("what information") and (qglobals.pop_poj_mavuin == nil)) then
        e.self:Say("I know it has been said for years before me, and will be said for years after me, but I was truly framed for my crime.  You see the gods feared the knowledge that I carry with me.  So to prevent me passing this knowledge to others, it was set up to show that I had plotted to murder one of the other elders.  Please go before the tribunal and plead my case.  If you do this I will share what I know with you, I apologize for holding it against you, but I am desperate to be released.");
        eq.set_global("pop_poj_mavuin","1",5,"F");
        e.other:Message(15,"You've received a character flag!");
    elseif(e.message:findi("hail") and (qglobals.pop_poj_mavuin ~= nil and qglobals.pop_poj_tribunal == nil)) then
		e.self:Say("Please, you must plead my case to the Tribunal!")
	elseif(e.message:findi("hail") and (qglobals.pop_poj_mavuin ~= nil and qglobals.pop_poj_tribunal ~= nil)) then
        e.self:Say("So you have pleaded my case to the Tribunal, I am most thankful. I hope that they will listen to my case soon and release me. The knowledge that I promised you is this. The followers in the Plane of Tranquility are trying to find information on what has happened to Zebuxoruk. What I know is that he has been captured for a second time. If you want to find out more information I believe you should seek an audience with Karana and Mithaniel Marr. I can only assume that they were present at the time of his capture and know why this has taken place. Also seek from Marr a way to translate the divine language. Only with it can you understand the writing of the gods. There is no more that I can tell you, but thank you once again for your attempt in returning my freedom.");
        if qglobals.pop_poj_valor_storms == nil then
			eq.set_global("pop_poj_valor_storms","1",5,"F");
			e.other:Message(15,"You've received a character flag!");
		end
    end
end