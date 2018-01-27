--Bor_Wharhammer (203430)
--PoP quest armors
--originally written by Romei conveted to LUA by Daeron
--potranquility

local cash;
							--emblem, container
local class_armor_table = {	[1] = {16267,17184},		--Warrior	
							[2] = {16271,17184}, 		--Cleric
							[3] = {16269,17184}, 		--Paladin
							[4] = {16272,17184}, 		--Ranger
							[5] = {16270,17184}, 		--Shadowknight
							[6] = {16276,17185}, 		--Druid
							[7] = {16275,17185}, 		--Monk
							[8] = {16268,17184}, 		--Bard
							[9] = {16273,17184}, 		--Rogue
							[10] = {16274,17184}, 		--Shaman
							[11] = {16278,17185}, 		--Necromancer
							[12] = {16279,17185}, 		--Wizard
							[13] = {16280,17185}, 		--Mage
							[14] = {16281,17185}, 		--Enchanter
							[15] = {16277,17185} } 		--Beastlord

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetin's t'ye " .. e.other:GetName() .. "!  Isn't the area 'round 'ere so nice an' quiet?  Such a departure from me old days; slaving o'er the forge t'create masterpieces!  T'be 'onest, at times I do miss the old forge, but after I created me finest breastplate, it seemed as if nothing else I made could ever live up t'it.  So I left me home to'wander the land an' see what I could learn o'the world.  I 'ave learned quite a bit from the elders 'ere an' the skilled craftspeople in New Tanaan.  I 'ave even devised a [" .. eq.say_link("what emblem?",false,"type o'emblem") .. "] that will impart the magic o'tranquility into the user t'create [" .. eq.say_link("what planar armor?",false,"planar armors") .. "] from pieces o'energy found in the planes.");
	elseif (e.other:GetLevel() >= 55) then
		if(e.message:findi("emblem")) then
			e.self:Say("Well, the emblems dinnae be easy t'craft but I will gladly give ye one fer the price of 500 platinum pieces. They allow a planes traveler with no craftin' skills t'create many fine pieces o'planar armor in a special, magical kit I also 'ave an' will throw in with the price. The kit acts as a focal point fer the wild magic energy o'the Planes. Ye will only be able t'use each emblem an' kit once when ye create the piece, 'owever I dinnae be goin' anywhere soon! Just venture back when ye need another an' dinnae ferget the coin!");
		elseif(e.message:findi("planar armor")) then
			e.self:Say("From me understanding, the very fabric o'the planes is so strong out 'ere, it can be found in raw form the deeper ye traverse.  Anyone who ventures far into the planes finds that they must wear excellent armor t'protect them from the savage environment.  The very essence of planar energy can be focused into a form that can fit our shape.  As ye progress deeper into the planes, ye will find many molds an' patterns with which t'base a set o'armor.  If ye want t'know 'ow t'craft the various types o'armor, I can instruct ye about [" .. eq.say_link("plate") .. "], [" .. eq.say_link("chain") .. "], [" .. eq.say_link("leather") .. "] an' [" .. eq.say_link("silk") .. ".]'")
		elseif(e.message:findi("chain")) then
			e.self:Say("Ahhhhh " .. e.other:GetName() .. "! Chain armors, while not as sturdy as plate, provide so much more mobility if constructed properly. T'construct a piece o'chain armor, ye need t'combine a chain pattern, an emblem, various amounts of ethereal metal rings an' use one o'those crafty Tanaan smithin' 'ammers all within a furnace touched by Ro. Ethereal metal ring construction is another matter. Ye will need to combine a brick o'ethereal energy, an ethereal temper an' a file within a Tanaan forge. I would seek a skilled craftsperson t'make the rings fer ye; the emblem will enable ye t'craft the final armor piece no matter what yer skill be.");
		elseif(e.message:findi("silk")) then
			e.self:Say("Har! It be quite funny that we be referin' t'silk as armor, fer the amount o'protection it provides be miniscule at best. The planar armor made from strands o'ether can still be quite useful fer its magical properties, 'owever. Ye will need t'take up a Tanaan embroidery needle, a pattern, an emblem an' various amounts o'ether silk swatches t'create a piece. Craft it all within a sewing kit boilin' with magical energy.");
		elseif(e.message:findi("leather")) then
			e.self:Say("Leather armor provides little protection due t'the make-up o'the materials. We shall do our best, 'owever, t'see ye make a quality piece. T'do so, ye must combine a pattern, an emblem, various pieces o'cured ethereal energy an' a Tanaan embroidery needle all within a sewing kit boilin' with magical energy. The cured energy may be problematic fer an unskilled craftsman, 'owever. Just sew two silk ethereal swatches together using a Tanaan embroidery needle within a Tanaan loom. I can just imagine yer next question t'be about [" .. eq.say_link("swatches") .. "], aye?");
		elseif(e.message:findi("plate")) then
			e.self:Say("Ahhhhh " .. e.other:GetName() .. "! The fine rigid armor that can stop a shaft from piercing yer heart! Too bad it be so cumbersome an' difficult t'move about in. To construct a piece o'plate armor, ye need t'combine a plate mold, an emblem, various amounts o'sheet metal an' use one o'those crafty Tanaan smithin' 'ammers all within a furnace touched by Ro. Ethereal metal sheet construction is another matter. Ye will need t'combine two bricks o'ethereal energy, an ethereal temper an' a Tanaan smithin' 'ammer within a Tanaan forge. I would seek a skilled craftsperson t'make the metal sheets fer ye; the emblem will enable ye t'craft the final armor piece no matter what yer skill be.");
		elseif(e.message:findi("swatches")) then
			e.self:Emote("sighs at you. 'T'make a swatch, ye need t'combine two strands o'ether along with a curing agent in a Tanaan loom.  Ye will need t'seek a skilled brew master t'make the curing agent fer ye.  Just 'ave them create it by using two celestial essences, soda an' paeala sap.'");
		end
	else
		e.self:Say("Ye look mighty inexperienced t'be in this area, " .. e.other:GetName() .. ". Come an' seek me out when ye 'ave more knowledge o'the planes!");
	end
end


function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetLevel() >= 55) then 
		local money = e.trade.platinum + (e.trade.gold / 10) + (e.trade.silver / 100) + (e.trade.copper / 1000)
		if money ~= 500 then
			e.self:Say("I have no need for this, " .. e.other:GetName() .. ". You can have it back.")
		elseif e.other:GetClass() ~= nil and (item_lib.check_turn_in(e.self, e.trade, {platinum = 500})) then --Must be level 55 or higher
			e.other:SummonItem(class_armor_table[e.other:GetClass()][1]);	--Class Emblem
			e.other:SummonItem(class_armor_table[e.other:GetClass()][2]);	--Class Tradeskill Container
			e.self:Say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
		end
	else
		e.self:Say("Ye look mighty inexperienced t'be in this area. " .. e.other:GetName() .. ". Come an' seek me out when ye 'ave more knowledge o'the planes!");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

