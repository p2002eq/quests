local shawlSignal = 0;

function event_say(e)
	if(e.message:findi("hail")) then
	    e.self:Emote("squints at you through one eye, the other covered by a metallic eyepatch.");
	    e.self:Say("Garrr. What `ave we here? Another beller yellied land blubber, eh? By the looks of ye someones mudder didn't know when ta throw a bad fish back. HAR HAR!");
	elseif(e.message:findi("bad fish")) then
	    e.self:Say("That means I'm callin ya ugly as a piece o' whale blubber but twice as bad smellin, ya son of a water treadin $race. Yer about as smart as the slime we use ta patch our boat hull, aren't ya?");
	elseif(e.message:findi("boat")) then
	    e.self:Say("'Arrrr. So we ain't got a boat right now. What's that got ta do with anythin'? Just cause we ain't got a boat, or a way to sail the waters, or even know how ta sail, don't mean we aren't crusty and dangerous. Just watch yerself cause we're mean.");
	elseif(e.message:findi("mean")) then
	    e.self:Say("Thats right! We're mean, nasty, devious 'n cruel. We'll knock ya down, bite yer knees, and steal yer money. Arrr. We won't always say please and thank you either! Just remember that and don't be tryin' anyhin' funny.");
	elseif(e.message:findi("funny")) then
	    e.self:Say("Uh, I dunno what funny stuff. No one's ever asked that one. You know, just be nice ta everyone I guess. Think ya can do that?");
	elseif(e.message:findi("map")) then
	    e.self:Say("The map? What map? Oh wait, that thing I made ol' what's-his-name do ta get los... uh adventure. Uh, sure. If yer wantin' we've got a job for ya. If ya do it ya get ta be a real member o' me crew.");
	elseif(e.message:findi("real member of your crew")) then
	    e.self:Say("That means ya get ta take orders from me and ya get ta use fancy words like bilge hoistin' land blubbing beller yellied, and more. Anyways, we needed a map so me lads would stop gettin' lost, but the lad I sent out ain't come back with it. I even sent out a search party but I ain't heard from them either. If ya find 'im get the map and get back 'ere.");
    end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30047})) then
        e.self:Emote("squints and then knocks hard on the metal half of his face to get his eye back in adjustment. 'Arrr. This is perfect. Har! Now we can be plannin' our pillagin' and plunderin' all proper like. Good work, $name!'");
        e.self:Emote("slaps you on the back and accidentally drops his eyepatch. Being a proper pirate now you conveniently forget to mention it to him.");
        e.other:AddEXP(50000);
        e.other:SummonItem(30008);
    end   
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 1) then
	    e.self:Say("Hrm? Who is scuffin' around out here?");
        eq.signal(110227, 2, 4000);
    elseif(e.signal == 3) then
        e.self:Say("Arrrrrr what is it ye want?");
        eq.signal(110227, 3, 4000);
    elseif(e.signal == 4) then
        e.self:Say("Velium eh? Well there matey lets hear what you have got to say!");
        eq.signal(110227, 4, 4000);
    elseif(e.signal == 10) then
        e.self:Emote("scratches his head, 'Yar ya do that ya crazy Coldain.'");
        e.self:Moveto(1324.9, 4638.9, 73.3, 124.5);
    end
end

