function event_say(e)

	if (e.message:findi("hail")) then
		e.self:Say("Good day, night, or whatever the time is. I am Mercutius Del Torre, minstrel of the Draconic Loyalist Fellowship. The great crystalline dragon goddess, Veeshan, has blessed my life with the opportunity to live among her children here in the Skyshrine. I have learned more of the dragons history, lore, and heritage than I ever could have dreamed of knowing back in my younger days in Qeynos. If you are privy to the musical arts and a friend of the dragons and kin I have developed a method of crafting [" .. eq.say_link("draconic instruments") .. "] and would craft some for you given I am provided with the necessary materials.");
	elseif(e.message:findi("draconic instruments")) then
		e.self:Say("I have a collection of instruments that I have crafted during my stay here in the Skyshrine from materials that can be found here on the continent of Velious. I presented my crafted instruments to the dragon scholars and they decorated them with runes in the ancient dragon script that enhances the magnificence of their sounds. I will craft either a [" .. eq.say_link("draconic drum") .. "], [" .. eq.say_link("draconic lute") .. "], or [" .. eq.say_link("draconic horn") .. "] if you bring me the materials in order to do so.");
	elseif(e.message:findi("draconic horn")) then
		e.self:Say("The horn must be crafted from the horn of a dragon, but you must not slay or participate in the slaying of a dragon to acquire this item. The horn must be from a dragon of no prominent social status that died from natural causes. The old dragon horn must also be treated with a [" .. eq.say_link("special shellac") .. "] before it is returned to me. I will also require a black sapphire that will be cut into a mouthpiece for the horn. If you bring me those items I will craft the horn for you and have it inscribed with the dragon script runes.");
	elseif(e.message:findi("draconic drum")) then
		e.self:Say("The frame of the drum must be crafted from Kromrif Bones and the skin of the drum must be crafted from a [" .. eq.say_link("Cured Brontotherium Hide") .. "]. If you bring me those items I will craft the drum for you and have it inscribed with the dragon script runes.");
	elseif(e.message:findi("draconic lute")) then
		e.self:Say("The strings of the draconic lute must be crafted from Siren Hair and the body of the lute must be carved from a Brontotherium Femur treated with a [" .. eq.say_link("special shellac") .. "]. If you bring me those items I will craft the lute for you and have it inscribed with the dragon script runes.");
	elseif(e.message:findi("cured brontotherium hide")) then
		e.self:Say("First you must hunt down a brontotherium and skin its hide. Once you have the hide it needs to be cured with a [" .. eq.say_link("special tannin") .. "] in a tailoring kit.");
	elseif(e.message:findi("special tannin")) then
		e.self:Say("The tannin used to cure the brontotherium hide must be created by a brewer from a Flask of Water, an [" .. eq.say_link("Oily Goo Secretion") .. "], and one [" .. eq.say_link("Melted Glacier Whiskey") .. "].");
	elseif(e.message:findi("oily goo secretion")) then
		e.self:Say("In the caves of the Geonids in the Wakening Lands can be found Tar Goos. These Tar Goos secrete a sticky oily substance that makes an excellent preservative.");
	elseif(e.message:findi("melted glacier whiskey")) then
		e.self:Say("Melted Glacier Whiskey is a strong alcohol that can be purchased from the Coldain brewers of Thurgadin.");
	elseif(e.message:findi("special shellac")) then
		e.self:Say("The shellac used for the instruments must be created by a brewer from a Flask of Water, an [" .. eq.say_link("Oily Goo Secretion") .. "], and one [" .. eq.say_link("Kromrif Spit Vodka") .. "]. Once you have the shellac fire the old dragon horn or brontotherium femur in a kiln with the shellac.");
	elseif(e.message:findi("kromrif spit vodka")) then
		e.self:Say("Kromrif Spit Vodka is a strong alcohol that can be purchased from the Coldain brewers of Thurgadin.");				
	end
end

function event_trade(e)
	local item_lib=require("items");

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 11655, item2 = 11654})) then
		e.self:Say("This will do nicely. Here take the drum I have already prepared and I will craft myself another drum from the materials you have collected.");
		e.other:Faction(42, 10); --CoV
		e.other:QuestReward(e.self, 0, 0, 0, 0, 12552, 50000); --Draconic drum
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 1834, item2 = 11657})) then
		e.self:Say("This will do nicely. Here take the lute I have already prepared and I will craft myself another lute from the materials you have collected.");
		e.other:Faction(42, 10); --CoV
		e.other:QuestReward(e.self, 0, 0, 0, 0, 12553, 50000); --Draconic Lute
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10036, item2 = 11658})) then
		e.self:Say("This will do nicely. Here take the horn I have already prepared and I will craft myself another horn from the materials you have collected.");
		e.other:Faction(42, 10); --CoV
		e.other:QuestReward(e.self, 0, 0, 0, 0, 12554, 50000);
	end

	item_lib.return_items(event.self, event.other, event.trade);

end