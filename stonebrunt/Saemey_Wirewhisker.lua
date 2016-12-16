function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to Kejek friend. I am the seer of this village for I have been gifted by the spirits with an affinity for their realm. The barrier between the spirit and physical realms is thin in these lands. The heretics know this and must be prevented from committing [atrocities] similar to those that have been committed in the past.");
	elseif(e.message:findi("atrocities")) then
		e.self:Say("Long ago when our noble ancestors the Vah Shir were destroyed by an explosion that devastated the warring Heretic and Erudin armies an evil creature by the name of Tserrina Syl'Tor was attracted to the sudden abundance of new spirits in these lands. Tserrina was capable of capturing these spirits before they were able to cross over beyond the mortal realm and through her dark magic transformed them into a [crystalline shadow] substance.");
	elseif(e.message:findi("crystalline shadow")) then
		e.self:Say("The crystalline shadow substance was used as building blocks for Tserrina's tower on an Island near the frozen lands to the south as well as fashioned into armor and weapons for her mindless servants. Emylie Steelclaws has developed a means to purify the armor and weapons using the special properties of our Kejek forge and a smithy hammer blessed by the Titan Spirits. The purifying process transfers the imprisoned spirits into [soul orbs]. Ask Emylie about the purification process.");
	elseif(e.message:findi("soul orbs")) then
		e.self:Say("I have perfected a ritual that will free the imprisoned spirits within the soul orbs. I simply require some kejek [spirit powder] to scrawl the proper sigils and a soul orb upon which to perform the ceremony. My apprentice will perform the ceremony on fading soul orbs. Simply bring him a fading soul orb and some kejek spirit powder.");
	elseif(e.message:findi("spirit powder")) then
		e.self:Say("The spirit power of which I speak is composed of ground spiritling stones. I will grind some powder for you if you would bring me a Valley Spiritling Stone, a Jungle Spiritling Stone, and a Mountain Spiritling Stone. Collecting the stones does not truly harm the spiritlings for when slain in this realm their essence simply disperses until it eventually reforms into a new spiritling.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6970, item2 = 6971, item3 = 6972})) then -- Valley Spiritling Stone, Jungle Spiritling Stone, Mountain Spiritling Stone
		e.self:Emote("grinds the spiritling stones in a mortar and pestle with foreign runes scratched into the ceramic. 'This powder will assist in matters concerning the contacting or freeing of spirits.'");
		e.other:QuestReward(e.self,0,0,0,0,0,100);  
		for i=1,math.random(1,4) do
			e.other:SummonItem(6980); -- Kejek Spirit Powder x 1 to 4 (Random)
		end
		e.other:Faction(172, 1, 0); -- Kejek Villiage
		e.other:Faction(247, 1, 0); -- Peace Keepers
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 6980, item2 = 6977})) then -- Kejek Spirit Powder, Soul Orb
		e.self:Say("I require a Soul Orb and Kejek Spirit Dust in order to perform the ritual that will free the imprisoned souls.");
		e.self:Emote("scrawls an arcane symbol on the ground with an odd powder and places the orb in its center. He then begins reciting an incantation and waving his arms over the symbol and orb. Moments later the orb shatters and an apparition appears.");
		e.other:QuestReward(e.self,0,0,0,0,2576,100); -- Shattered Soul Orb
		e.other:Faction(172, 1, 0); -- Kejek Villiage
		e.other:Faction(247, 1, 0); -- Peace Keepers
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
