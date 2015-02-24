function event_waypoint_arrive(e)
	if(e.wp == 17) then
		e.self:Emote("stops skipping and looks around, 'Uh oh'");
	elseif(e.wp == 43) then
		e.self:Emote("glances about, looking a bit lost. 'Well this doesn't look like a place I belong in at all'");
	elseif(e.wp == 49) then
		e.self:Say("Uh oh? this looks dangerous, I don't think I am allowed to be here.");
	elseif(e.wp == 51) then
		e.self:Emote("notices the pile of bones next to her and shudders, 'Eeep! I wonder what happened to him.");
	elseif(e.wp == 57) then
		e.self:Say("Hi, how do I get outside, huh?");
	elseif(e.wp == 58) then
		e.self:Emote("smiles at the sight of daylight, 'Ahhh yes, this is the way!'");
	elseif(e.wp == 66) then
		e.self:Emote("squints around, thinking hard, 'Hrmmm, this does look familiar. I think i came from this-a-way.'");
	elseif(e.wp == 68) then
		e.self:Say("Oh look, there it is!");
	elseif(e.wp == 80) then
		e.self:Emote("Yawns tiredly and says, 'That was fun. Time for me to go to sleep though.' She crawls under the blanket and falls sound asleep.");
	end
end

function event_spawn(e)
	eq.signal(155041,2,10);
end

function event_say(e)
	local a = 155339;
	if((e.wp < 17) and (e.message:findi("Hail"))) then
		e.self:Say("Hello, my name is Shainai and I am on a very important mission for my Daddy. He ran out of buttons for the officers' clothes so I have to get him more. I am an excellent helper.");
	end
	if((e.wp > 60) and (e.message:findi("Hail"))) then
		e.self:Say("Hi there, I am headed home before I get in trouble.  I got a little lost, but I am ok now.  I hope Daddy isn't too mad.  Bye bye!");
	end
	if(((e.wp > 16) and (e.wp < 61)) and (e.message:findi("Hail"))) then
		e.self:Say("Hi. I was getting some buttons for Daddy and I got a little lost. I know the way, I mean it...but if you wanted to [follow] me home to make sure I got there safe and all, you could.");
	end
	if(((e.wp > 16) and (e.wp < 61)) and (e.message:findi("follow"))) then
		e.self:Say("You will?!? Oh good, now I won't be so lonesome. Here hold my bag of buttons if you please, my arms are tired. Ready? Follow me now, I know the way.  'Shainai pauses and looks around, ' Hmmmm...");
		e.other:QuestReward(e.self,0,0,0,0,4460);
	end
	if(((e.wp > 16) and (e.wp < 27)) and (e.message:findi("follow"))) then
		eq.spawn2(a,29,0,401,135,-188,0);
		eq.depop_with_timer();
	end
	if(((e.wp > 26) and (e.wp < 32)) and (e.message:findi("follow"))) then
		eq.spawn2(a,27,0,129,169,-248,0);
		eq.depop_with_timer();
	end
	if(((e.wp > 31) and (e.wp < 38)) and (e.message:findi("follow"))) then
		eq.spawn2(a,28,0,95,188,-248,0);
		eq.depop_with_timer();
	end
	if(((e.wp > 37) and (e.wp < 61)) and (e.message:findi("follow"))) then
		eq.spawn2(a,30,0,-373,190,-236,0);
		eq.depop_with_timer();
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
