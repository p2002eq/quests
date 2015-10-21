function event_say(e)
	if(e.message:findi("Hail")) then
        e.self:Say("Errrr.  You come for master. learning like me?");
    elseif(e.message:findi("what learning")) then
        e.self:Say("I am learning ways of skinning and tailoring.  None left but the master so I must learn to help.  For now I only clean the furs.");
    elseif(e.message:findi("i come for learning")) then
        e.self:Say("I am learning ways of skinning and tailoring.  None left but the master so I must learn to help.  For now I only clean the furs.");
    end
end