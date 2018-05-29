--Elder_Gelok (203399)
--Gelok's Supplies Questline
--potranqulity

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello there! Welcome in. . . Welcome in. . . Just watch yourself when making your way past my most trusted assistant, Drogguk. While he may have superior strength, his coordination is most inferior. He's dropped many a gear on my toes, but I know he means well. In fact, I was intending to send him on a [" .. eq.say_link("serious mission") .. "], though I would rather he not go.");
	elseif( e.message:findi("serious mission")) then
		e.self:Say("You see, this windmill is more than it seems. It's quite a splendid device! It produces energy by converting the wind that rotates the blades into a power that supercharges the windmill's transcentrifugal axles. In simple terms, what it does is creates a portal into the [" .. eq.say_link("Plane of Innovation") .. "]. What a wonderful place that is! A virtual dream-land for any gnome!");
	elseif( e.message:findi("plane of innovation")) then
		e.self:Say("Oh, it is such an amazing place! I ultimately desire to travel there to learn of advanced mechanics. Alas, this windmill requires constant upkeep due the constant surge of power that it propels. The gears are constantly getting sandy and the axles lose their grease almost daily. I'm often in need of [" .. eq.say_link("new parts") .. "] and that's where Drogguk's assistance would currently be handy, but I simply cannot sacrifice his current duties at this time. Pity, pity.");
	elseif( e.message:findi("new parts")) then
		e.self:Say("Well, Drogguk used to travel through the portal to acquire items for me from the salvage yard. The last time he went through in search of parts he came back [" .. eq.say_link("badly wounded") .. "] and that's saying quite a lot! I was quite alarmed, but the elders nursed him to health with amazing haste. I simply cannot imagine placing him in such jeopardy again. He was lucky to return at all by the look of him then!");
	elseif( e.message:findi("badly wounded")) then
		e.self:Say("Aye, you can still see some of the scars about his body. He stumbled out of the portal that day, bloody and spouting on about shiny men trying to tear him apart. He said they were speaking of research the whole time. Frightful stuff, really. Well, you look adventurous enough. Why don't you go collect some supplies for me? I fear that Drogguk would not be able to manage another trip to collect the [" .. eq.say_link("supplies") .. "] I require to maintain this place.");
	elseif( e.message:findi("supplies")) then
		e.self:Say("Size 12 sprockets are always greatly needed. Any Silicorrosive Grease you find would be a huge help as well. You can never have too much Silicorrosive grease laying around. Also, tri-platinum foil and mini-gyro shields would be good for something or another. Micro-ceramic sleeves are a nice find as well. Got all that? Now, reach around up there in the area of the transcentrifugal axle that isn't working. You'll either be badly wounded or transported to the Plane of Innovation. Take care!");
	end
end

function event_trade(e)
	local item_lib = require("items");
  	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 28162}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 28163}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 28164}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 28165})) then	--Mini-gyro Shields, Silicorrosive Grease, Size 12 Sprockets, Tri-platinum Foil
		e.self:Emote("examines the object for a moment and then says, 'This is great! The windmill should function for weeks to come due to your hard work. Feel free to bring me any others that you find. A stockpile of parts never hurt anyone!'");
		e.other:AddEXP(500000); 
		if math.random(100) <= 20 then	--20% chance for gem on reward
			e.other:SummonItem(eq.ChooseRandom(10028, 10037, 22503, 15981));	--Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
