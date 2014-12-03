-- Converted to .lua and GM event mods by Speedz

local slot;
local spell;
local status = 0;
function event_say(e)
	if(e.message:findi("Hail")) then
		e.other:SetLanguageSkill(0,100);
		e.self:Say("Greetings " .. e.other:GetName() .. ". When a hero of our world is slain their soul returns to the place it was last bound and the body is reincarnated. As a member of the Order of Eternity  it is my duty to [bind your soul] to this location if that is your wish.");
		if(e.other:Admin() >= status) then
			e.other:Message(14,"If you are attending the raid, I can help you [prepare] or I can send you to [fight] if you are of worthy level.");
		end
	elseif(e.message:findi("bind my soul")) then
		e.self:Say("Binding your soul. You will return here when you die.");
		e.self:CastSpell(2049,e.other:GetID(),0,1);
	elseif(e.message:findi("prepare") and e.other:Admin() >= status) then
		raid(e);
	elseif(e.message:findi("fight") and e.other:Admin() >= status and e.other:GetLevel() >= 50) then
		e.other:MovePC(27,1389,1014,134,301);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function clericSpells(e)
	slot = 0;
	e.other:ScribeSpell(9,slot);
	slot = slot + 1;
	spell = 11;
	while(spell < 21) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 35;
	while(spell < 38) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 43;
	while(spell < 46) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 47;
	while(spell < 51) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 52;
	while(spell < 54) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 59;
	while(spell < 65) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(89,slot);
	slot = slot + 1;
	spell = 95;
	while(spell < 98) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(115,slot);
	slot = slot + 1;
	spell = 117;
	while(spell < 119) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 123;
	while(spell < 129) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 130;
	while(spell < 133) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 134;
	while(spell < 137) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 200;
	while(spell < 204) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(205,slot);
	slot = slot + 1;
	spell = 207;
	while(spell < 214) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 215;
	while(spell <217) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 218;
	while(spell < 220) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 221;
	while(spell < 236) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(244,slot);
	slot = slot + 1;
	e.other:ScribeSpell(248,slot);
	slot = slot + 1;
	e.other:ScribeSpell(312,slot);
	slot = slot + 1;
	e.other:ScribeSpell(314,slot);
	slot = slot + 1;
	e.other:ScribeSpell(329,slot);
	slot = slot + 1;
	e.other:ScribeSpell(368,slot);
	slot = slot + 1;
	e.other:ScribeSpell(388,slot);
	slot = slot + 1;
	spell = 391;
	while(spell < 393) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 405;
	while(spell < 407) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 413;
	while(spell < 418) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(475,slot);
	slot = slot + 1;
	e.other:ScribeSpell(480,slot);
	slot = slot + 1;
	spell = 485;
	while(spell < 489) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(501,slot);
	slot = slot + 1;
	e.other:ScribeSpell(504,slot);
	slot = slot + 1;
	e.other:ScribeSpell(560,slot);
	slot = slot + 1;
	spell = 662;
	while(spell < 665) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(672,slot);
	slot = slot + 1;
	e.other:ScribeSpell(675,slot);
	slot = slot + 1;
	e.other:ScribeSpell(1411,slot);
	slot = slot + 1;
	spell = 1443;
	while(spell < 1446) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 1798;
	while(spell < 1801) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 1885;
	while(spell < 1889) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 1894;
	while(spell < 1899) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 2168;
	while(spell < 2173) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(2175,slot);
	slot = slot + 1;
	spell = 2501;
	while(spell < 2506) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 2740;
	while(spell < 2743) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(2946,slot);
	slot = slot + 1;
	spell = 3250;
	while(spell < 3252) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 3575;
	while(spell < 3577) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(3692,slot);
	slot = slot + 1;
	spell = 3994;
	while(spell < 3999) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
end

function paladinSpells(e)
	slot = 0;
	spell = 11;
	while(spell < 13) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(15,slot);
	slot = slot + 1;
	spell = 17;
	while(spell < 20) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(37,slot);
	slot = slot + 1;
	e.other:ScribeSpell(43,slot);
	slot = slot + 1;
	spell = 47;
	while(spell < 49) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(89,slot);
	slot = slot + 1;
	e.other:ScribeSpell(95,slot);
	slot = slot + 1;
	e.other:ScribeSpell(117,slot);
	slot = slot + 1;
	e.other:ScribeSpell(123,slot);
	slot = slot + 1;
	spell = 200;
	while(spell < 204) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(205,slot);
	slot = slot + 1;
	spell = 208;
	while(spell < 211) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(213,slot);
	slot = slot + 1;
	spell = 215;
	while(spell < 217) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 218;
	while(spell < 220) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 221;
	while(spell < 224) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 226;
	while(spell < 229) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(230,slot);
	slot = slot + 1;
	spell = 233;
	while(spell < 236) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(312,slot);
	slot = slot + 1;
	e.other:ScribeSpell(368,slot);
	slot = slot + 1;
	e.other:ScribeSpell(391,slot);
	slot = slot + 1;
	spell = 485;
	while(spell < 488) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(501,slot);
	slot = slot + 1;
	e.other:ScribeSpell(693,slot);
	slot = slot + 1;
	spell = 1453;
	while(spell < 1455) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 2168;
	while(spell < 2172) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 2581;
	while(spell < 2587) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(2946,slot);
	slot = slot + 1;
	spell = 3577;
	while(spell < 3579) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(3683,slot);
end

function rangerSpells(e)
	slot = 0;
	e.other:ScribeSpell(12,slot);
	slot = slot + 1;
	e.other:ScribeSpell(17,slot);
	slot = slot + 1;
	e.other:ScribeSpell(26,slot);
	slot = slot + 1;
	e.other:ScribeSpell(34,slot);
	slot = slot + 1;
	e.other:ScribeSpell(48,slot);
	slot = slot + 1;
	e.other:ScribeSpell(51,slot);
	slot = slot + 1;
	e.other:ScribeSpell(60,slot);
	slot = slot + 1;
	e.other:ScribeSpell(76,slot);
	slot = slot + 1;
	e.other:ScribeSpell(78,slot);
	slot = slot + 1;
	e.other:ScribeSpell(80,slot);
	slot = slot + 1;
	e.other:ScribeSpell(86,slot);
	slot = slot + 1;
	spell = 91;
	while(spell < 93) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(115,slot);
	slot = slot + 1;
	e.other:ScribeSpell(129,slot);
	slot = slot + 1;
	e.other:ScribeSpell(200,slot);
	slot = slot + 1;
	e.other:ScribeSpell(203,slot);
	slot = slot + 1;
	e.other:ScribeSpell(213,slot);
	slot = slot + 1;
	e.other:ScribeSpell(222,slot);
	slot = slot + 1;
	spell = 224;
	while(spell < 226) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(237,slot);
	slot = slot + 1;
	spell = 239;
	while(spell < 243) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 247;
	while(spell < 251) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(252,slot);
	slot = slot + 1;
	e.other:ScribeSpell(254,slot);
	slot = slot + 1;
	e.other:ScribeSpell(256,slot);
	slot = slot + 1;
	e.other:ScribeSpell(261,slot);
	slot = slot + 1;
	spell = 263;
	while(spell < 265) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 268;
	while(spell < 270) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(278,slot);
	slot = slot + 1;
	e.other:ScribeSpell(419,slot);
	slot = slot + 1;
	e.other:ScribeSpell(421,slot);
	slot = slot + 1;
	e.other:ScribeSpell(425,slot);
	slot = slot + 1;
	e.other:ScribeSpell(500,slot);
	slot = slot + 1;
	e.other:ScribeSpell(513,slot);
	slot = slot + 1;
	spell = 515;
	while(spell < 519) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(655,slot);
	slot = slot + 1;
	e.other:ScribeSpell(691,slot);
	slot = slot + 1;
	spell = 1461;
	while(spell < 1463) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(1776,slot);
	slot = slot + 1;
	e.other:ScribeSpell(2110,slot);
	slot = slot + 1;
	spell = 2591;
	while(spell < 2596) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 3564;
	while(spell < 3566) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(3601,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3687,slot);
	slot = slot + 1;
end

function shadowknightSpells(e)
	slot = 0;
	e.other:ScribeSpell(48,slot);
	slot = slot + 1;
	e.other:ScribeSpell(61,slot);
	slot = slot + 1;
	e.other:ScribeSpell(90,slot);
	slot = slot + 1;
	e.other:ScribeSpell(117,slot);
	slot = slot + 1;
	e.other:ScribeSpell(127,slot);
	slot = slot + 1;
	e.other:ScribeSpell(209,slot);
	slot = slot + 1;
	e.other:ScribeSpell(213,slot);
	slot = slot + 1;
	e.other:ScribeSpell(218,slot);
	slot = slot + 1;
	e.other:ScribeSpell(221,slot);
	slot = slot + 1;
	spell = 225;
	while(spell < 227) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(229,slot);
	slot = slot + 1;
	e.other:ScribeSpell(233,slot);
	slot = slot + 1;
	spell = 235;
	while(spell < 237) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 340;
	while(spell < 345) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 346;
	while(spell < 348) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 351;
	while(spell < 353) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 354;
	while(spell < 356) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(357,slot);
	slot = slot + 1;
	spell = 359;
	while(spell < 361) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 362;
	while(spell < 364) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 366;
	while(spell < 368) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(370,slot);
	slot = slot + 1;
	e.other:ScribeSpell(414,slot);
	slot = slot + 1;
	spell = 440;
	while(spell < 442) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(445,slot);
	slot = slot + 1;
	e.other:ScribeSpell(452,slot);
	slot = slot + 1;
	e.other:ScribeSpell(475,slot);
	slot = slot + 1;
	e.other:ScribeSpell(478,slot);
	slot = slot + 1;
	spell = 491;
	while(spell < 493) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(502,slot);
	slot = slot + 1;
	e.other:ScribeSpell(522,slot);
	slot = slot + 1;
	e.other:ScribeSpell(692,slot);
	slot = slot + 1;
	spell = 1221;
	while(spell < 1223) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 1225;
	while(spell < 1227) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(1289,slot);
	slot = slot + 1;
	spell = 1457;
	while(spell < 1459) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(2139,slot);
	slot = slot + 1;
	e.other:ScribeSpell(2213,slot);
	slot = slot + 1;
	spell = 2571;
	while(spell < 2575) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(2969,slot);
	slot = slot + 1;
	spell = 3560;
	while(spell < 3562) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(3583,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3686,slot);
	slot = slot + 1;
end

function druidSpells(e)
	slot = 0;
	e.other:ScribeSpell(12,slot);
	slot = slot + 1;
	e.other:ScribeSpell(15,slot);
	slot = slot + 1;
	e.other:ScribeSpell(17,slot);
	slot = slot + 1;
	spell = 26;
	while(spell < 30) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 34;
	while(spell < 37) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 48;
	while(spell < 51) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(57,slot);
	slot = slot + 1;
	spell = 60;
	while(spell < 65) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 76;
	while(spell < 79) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(80,slot);
	slot = slot + 1;
	e.other:ScribeSpell(86,slot);
	slot = slot + 1;
	spell = 91;
	while(spell < 94) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 95;
	while(spell < 97) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(99,slot);
	slot = slot + 1;
	spell = 115;
	while(spell < 117) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(129,slot);
	slot = slot + 1;
	spell = 137;
	while(spell < 146) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(169,slot);
	slot = slot + 1;
	e.other:ScribeSpell(200,slot);
	slot = slot + 1;
	e.other:ScribeSpell(203,slot);
	slot = slot + 1;
	e.other:ScribeSpell(211,slot);
	slot = slot + 1;
	e.other:ScribeSpell(213,slot);
	slot = slot + 1;
	e.other:ScribeSpell(217,slot);
	slot = slot + 1;
	e.other:ScribeSpell(220,slot);
	slot = slot + 1;
	e.other:ScribeSpell(222,slot);
	slot = slot + 1;
	spell = 224;
	while(spell < 229) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(234,slot);
	slot = slot + 1;
	spell = 237;
	while(spell < 243) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(245,slot);
	slot = slot + 1;
	spell = 247;
	while(spell < 251) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 252;
	while(spell < 265) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(268,slot);
	slot = slot + 1;
	e.other:ScribeSpell(273,slot);
	slot = slot + 1;
	e.other:ScribeSpell(278,slot);
	slot = slot + 1;
	e.other:ScribeSpell(356,slot);
	slot = slot + 1;
	spell = 405;
	while(spell < 407) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 417;
	while(spell < 431) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 432;
	while(spell < 434) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(490,slot);
	slot = slot + 1;
	spell = 512;
	while(spell < 521) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 530;
	while(spell < 539) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 550;
	while(spell < 559) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 607;
	while(spell < 612) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 663;
	while(spell < 666) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(671,slot);
	slot = slot + 1;
	e.other:ScribeSpell(753,slot);
	slot = slot + 1;
	e.other:ScribeSpell(1285,slot);
	slot = slot + 1;
	e.other:ScribeSpell(1326,slot);
	slot = slot + 1;
	e.other:ScribeSpell(1392,slot);
	slot = slot + 1;
	e.other:ScribeSpell(1398,slot);
	slot = slot + 1;
	spell = 1433;
	while(spell < 1441) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(1517,slot);
	slot = slot + 1;
	spell = 1736;
	while(spell < 1738) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(1740,slot);
	slot = slot + 1;
	e.other:ScribeSpell(1776,slot);
	slot = slot + 1;
	e.other:ScribeSpell(1800,slot);
	slot = slot + 1;
	e.other:ScribeSpell(1888,slot);
	slot = slot + 1;
	spell = 2020;
	while(spell < 2022) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 2029;
	while(spell < 2032) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 2110;
	while(spell < 2112) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(2183,slot);
	slot = slot + 1;
	e.other:ScribeSpell(2417,slot);
	slot = slot + 1;
	e.other:ScribeSpell(2419,slot);
	slot = slot + 1;
	e.other:ScribeSpell(2422,slot);
	slot = slot + 1;
	e.other:ScribeSpell(2424,slot);
	slot = slot + 1;
	e.other:ScribeSpell(2427,slot);
	slot = slot + 1;
	e.other:ScribeSpell(2429,slot);
	slot = slot + 1;
	spell = 2432;
	while(spell < 2434) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 2511;
	while(spell < 2516) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(2591,slot);
	slot = slot + 1;
	e.other:ScribeSpell(2946,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3182,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3184,slot);
	slot = slot + 1;
	spell = 3277;
	while(spell < 3280) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 3579;
	while(spell < 3581) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(3583,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3601,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3695,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3792,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3794,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3834,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3998,slot);
	slot = slot + 1;
end

function bardSpells(e)
	slot = 0;
	e.other:ScribeSpell(7,slot);
	slot = slot + 1;
	spell = 700;
	while(spell < 731) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 734;
	while(spell < 751) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(868,slot);
	slot = slot + 1;
	e.other:ScribeSpell(1287,slot);
	slot = slot + 1;
	spell = 1448;
	while(spell < 1451) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 2601;
	while(spell < 2606) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 3566;
	while(spell < 3568) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(3682,slot);
end

function shamanSpells(e)
	slot = 0;
	e.other:ScribeSpell(12,slot);
	slot = slot + 1;
	e.other:ScribeSpell(15,slot);
	slot = slot + 1;
	e.other:ScribeSpell(17,slot);
	slot = slot + 1;
	spell = 31;
	while(spell < 33) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 35;
	while(spell < 37) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 39;
	while(spell < 41) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(42,slot);
	slot = slot + 1;
	e.other:ScribeSpell(46,slot);
	slot = slot + 1;
	spell = 48;
	while(spell < 51) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 60;
	while(spell < 65) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(75,slot);
	slot = slot + 1;
	e.other:ScribeSpell(79,slot);
	slot = slot + 1;
	e.other:ScribeSpell(86,slot);
	slot = slot + 1;
	e.other:ScribeSpell(93,slot);
	slot = slot + 1;
	spell = 95;
	while(spell < 97) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(98,slot);
	slot = slot + 1;
	spell = 110;
	while(spell < 113) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(131,slot);
	slot = slot + 1;
	e.other:ScribeSpell(134,slot);
	slot = slot + 1;
	spell = 144;
	while(spell < 169) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(170,slot);
	slot = slot + 1;
	spell = 200;
	while(spell < 202) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(203,slot);
	slot = slot + 1;
	e.other:ScribeSpell(205,slot);
	slot = slot + 1;
	spell = 211;
	while(spell < 214) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(220,slot);
	slot = slot + 1;
	e.other:ScribeSpell(222,slot);
	slot = slot + 1;
	spell = 224;
	while(spell < 229) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(230,slot);
	slot = slot + 1;
	e.other:ScribeSpell(238,slot);
	slot = slot + 1;
	e.other:ScribeSpell(245,slot);
	slot = slot + 1;
	e.other:ScribeSpell(255,slot);
	slot = slot + 1;
	spell = 260;
	while(spell < 262) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 265;
	while(spell < 268) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 269;
	while(spell < 273) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 274;
	while(spell < 285) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(308,slot);
	slot = slot + 1;
	e.other:ScribeSpell(326,slot);
	slot = slot + 1;
	e.other:ScribeSpell(337,slot);
	slot = slot + 1;
	e.other:ScribeSpell(345,slot);
	slot = slot + 1;
	e.other:ScribeSpell(349,slot);
	slot = slot + 1;
	e.other:ScribeSpell(365,slot);
	slot = slot + 1;
	e.other:ScribeSpell(384,slot);
	slot = slot + 1;
	e.other:ScribeSpell(389,slot);
	slot = slot + 1;
	e.other:ScribeSpell(417,slot);
	slot = slot + 1;
	e.other:ScribeSpell(424,slot);
	slot = slot + 1;
	e.other:ScribeSpell(431,slot);
	slot = slot + 1;
	spell = 434;
	while(spell < 439) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 505;
	while(spell < 512) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 526;
	while(spell < 528) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(577,slot);
	slot = slot + 1;
	e.other:ScribeSpell(580,slot);
	slot = slot + 1;
	e.other:ScribeSpell(640,slot);
	slot = slot + 1;
	e.other:ScribeSpell(649,slot);
	slot = slot + 1;
	e.other:ScribeSpell(754,slot);
	slot = slot + 1;
	e.other:ScribeSpell(1285,slot);
	slot = slot + 1;
	spell = 1427;
	while(spell < 1431) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(1776,slot);
	slot = slot + 1;
	e.other:ScribeSpell(1831,slot);
	slot = slot + 1;
	spell = 1884;
	while(spell < 1887) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(1891,slot);
	slot = slot + 1;
	e.other:ScribeSpell(1895,slot);
	slot = slot + 1;
	e.other:ScribeSpell(2111,slot);
	slot = slot + 1;
	spell = 2521;
	while(spell < 2526) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(2750,slot);
	slot = slot + 1;
	e.other:ScribeSpell(2946,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3454,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3573,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3583,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3694,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3994,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3997,slot);
	slot = slot + 1;
end

function necromancerSpells(e)
	slot = 0;
	e.other:ScribeSpell(3,slot);
	slot = slot + 1;
	e.other:ScribeSpell(6,slot);
	slot = slot + 1;
	e.other:ScribeSpell(31,slot);
	slot = slot + 1;
	spell = 35;
	while(spell < 37) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 48;
	while(spell < 50) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(59,slot);
	slot = slot + 1;
	e.other:ScribeSpell(61,slot);
	slot = slot + 1;
	e.other:ScribeSpell(63,slot);
	slot = slot + 1;
	spell = 65;
	while(spell < 68) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(90,slot);
	slot = slot + 1;
	e.other:ScribeSpell(96,slot);
	slot = slot + 1;
	spell = 117;
	while(spell < 119) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(127,slot);
	slot = slot + 1;
	e.other:ScribeSpell(133,slot);
	slot = slot + 1;
	spell = 196;
	while(spell < 200) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 204;
	while(spell < 206) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(209,slot);
	slot = slot + 1;
	e.other:ScribeSpell(213,slot);
	slot = slot + 1;
	e.other:ScribeSpell(218,slot);
	slot = slot + 1;
	e.other:ScribeSpell(221,slot);
	slot = slot + 1;
	spell = 225;
	while(spell < 227) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 229;
	while(spell < 231) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(233,slot);
	slot = slot + 1;
	spell = 235;
	while(spell < 237) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(246,slot);
	slot = slot + 1;
	e.other:ScribeSpell(288,slot);
	slot = slot + 1;
	e.other:ScribeSpell(305,slot);
	slot = slot + 1;
	e.other:ScribeSpell(309,slot);
	slot = slot + 1;
	e.other:ScribeSpell(331,slot);
	slot = slot + 1;
	spell = 338;
	while(spell < 345) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 346;
	while(spell < 349) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 351;
	while(spell < 356) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 357;
	while(spell < 372) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(387,slot);
	slot = slot + 1;
	spell = 393;
	while(spell < 395) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 413;
	while(spell < 416) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(435,slot);
	slot = slot + 1;
	spell = 440;
	while(spell < 450) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 451;
	while(spell < 458) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(475,slot);
	slot = slot + 1;
	e.other:ScribeSpell(478,slot);
	slot = slot + 1;
	spell = 491;
	while(spell < 496) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(502,slot);
	slot = slot + 1;
	e.other:ScribeSpell(522,slot);
	slot = slot + 1;
	spell = 524;
	while(spell < 526) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(549,slot);
	slot = slot + 1;
	e.other:ScribeSpell(559,slot);
	slot = slot + 1;
	spell = 641;
	while(spell < 645) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 661;
	while(spell < 663) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(694,slot);
	slot = slot + 1;
	spell = 698;
	while(spell < 700) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(1285,slot);
	slot = slot + 1;
	e.other:ScribeSpell(1391,slot);
	slot = slot + 1;
	spell = 1411;
	while(spell < 1414) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(1415,slot);
	slot = slot + 1;
	spell = 1508;
	while(spell < 1516) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(2014,slot);
	slot = slot + 1;
	e.other:ScribeSpell(2139,slot);
	slot = slot + 1;
	e.other:ScribeSpell(2213,slot);
	slot = slot + 1;
	spell = 2541;
	while(spell < 2546) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(2757,slot);
	slot = slot + 1;
	e.other:ScribeSpell(2759,slot);
	slot = slot + 1;
	e.other:ScribeSpell(2764,slot);
	slot = slot + 1;
	e.other:ScribeSpell(2969,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3571,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3583,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3702,slot);
	slot = slot + 1;
end

function wizardSpells(e)
	slot = 0;
	spell = 22;
	while(spell < 24) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 35;
	while(spell < 37) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(38,slot);
	slot = slot + 1;
	e.other:ScribeSpell(42,slot);
	slot = slot + 1;
	spell = 48;
	while(spell < 50) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(51,slot);
	slot = slot + 1;
	e.other:ScribeSpell(54,slot);
	slot = slot + 1;
	spell = 65;
	while(spell < 68) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(73,slot);
	slot = slot + 1;
	e.other:ScribeSpell(80,slot);
	slot = slot + 1;
	spell = 84;
	while(spell < 86) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 108;
	while(spell < 110) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 131;
	while(spell < 134) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(205,slot);
	slot = slot + 1;
	e.other:ScribeSpell(230,slot);
	slot = slot + 1;
	e.other:ScribeSpell(232,slot);
	slot = slot + 1;
	e.other:ScribeSpell(234,slot);
	slot = slot + 1;
	e.other:ScribeSpell(236,slot);
	slot = slot + 1;
	e.other:ScribeSpell(246,slot);
	slot = slot + 1;
	e.other:ScribeSpell(261,slot);
	slot = slot + 1;
	e.other:ScribeSpell(288,slot);
	slot = slot + 1;
	e.other:ScribeSpell(305,slot);
	slot = slot + 1;
	e.other:ScribeSpell(309,slot);
	slot = slot + 1;
	e.other:ScribeSpell(323,slot);
	slot = slot + 1;
	e.other:ScribeSpell(354,slot);
	slot = slot + 1;
	spell = 372;
	while(spell < 384) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 385;
	while(spell < 388) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 393;
	while(spell < 395) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 458;
	while(spell < 472) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(477,slot);
	slot = slot + 1;
	e.other:ScribeSpell(500,slot);
	slot = slot + 1;
	e.other:ScribeSpell(503,slot);
	slot = slot + 1;
	spell = 528;
	while(spell < 530) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(539,slot);
	slot = slot + 1;
	spell = 541;
	while(spell < 549) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 561;
	while(spell < 569) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 578;
	while(spell < 580) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 602;
	while(spell < 607) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(612,slot);
	slot = slot + 1;
	e.other:ScribeSpell(636,slot);
	slot = slot + 1;
	spell = 656;
	while(spell < 661) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(666,slot);
	slot = slot + 1;
	e.other:ScribeSpell(674,slot);
	slot = slot + 1;
	e.other:ScribeSpell(679,slot);
	slot = slot + 1;
	spell = 731;
	while(spell < 734) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(752,slot);
	slot = slot + 1;
	e.other:ScribeSpell(755,slot);
	slot = slot + 1;
	e.other:ScribeSpell(1325,slot);
	slot = slot + 1;
	spell = 1336;
	while(spell < 1340) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 1371;
	while(spell < 1376) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(1399,slot);
	slot = slot + 1;
	spell = 1417;
	while(spell < 1424) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(1425,slot);
	slot = slot + 1;
	e.other:ScribeSpell(1516,slot);
	slot = slot + 1;
	e.other:ScribeSpell(1549,slot);
	slot = slot + 1;
	spell = 1738;
	while(spell < 1740) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(1744,slot);
	slot = slot + 1;
	e.other:ScribeSpell(1899,slot);
	slot = slot + 1;
	spell = 2022;
	while(spell < 2029) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(2184,slot);
	slot = slot + 1;
	e.other:ScribeSpell(2418,slot);
	slot = slot + 1;
	spell = 2420;
	while(spell < 2422) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(2423,slot);
	slot = slot + 1;
	spell = 2425;
	while(spell < 2427) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(2428,slot);
	slot = slot + 1;
	spell = 2430;
	while(spell < 2432) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 2551;
	while(spell < 2556) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(2758,slot);
	slot = slot + 1;
	spell = 2943;
	while(spell < 2946) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 3180;
	while(spell < 3182) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(3183,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3264,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3581,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3793,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3795,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3811,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3833,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3849,slot);
	slot = slot + 1;
end

function magicianSpells(e)
	slot = 0;
	e.other:ScribeSpell(4,slot);
	slot = slot + 1;
	spell = 35;
	while(spell < 37) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(42,slot);
	slot = slot + 1;
	spell = 48;
	while(spell < 51) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 55;
	while(spell < 57) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(58,slot);
	slot = slot + 1;
	spell = 65;
	while(spell < 71) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 80;
	while(spell < 84) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 93;
	while(spell < 95) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 100;
	while(spell < 112) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 113;
	while(spell < 117) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 120;
	while(spell < 123) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(189,slot);
	slot = slot + 1;
	e.other:ScribeSpell(205,slot);
	slot = slot + 1;
	e.other:ScribeSpell(211,slot);
	slot = slot + 1;
	e.other:ScribeSpell(232,slot);
	slot = slot + 1;
	e.other:ScribeSpell(246,slot);
	slot = slot + 1;
	e.other:ScribeSpell(248,slot);
	slot = slot + 1;
	e.other:ScribeSpell(288,slot);
	slot = slot + 1;
	e.other:ScribeSpell(305,slot);
	slot = slot + 1;
	spell = 309;
	while(spell < 312) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(313,slot);
	slot = slot + 1;
	spell = 315;
	while(spell < 326) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 327;
	while(spell < 329) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 330;
	while(spell < 337) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 395;
	while(spell < 405) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 409;
	while(spell < 413) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(479,slot);
	slot = slot + 1;
	spell = 496;
	while(spell < 500) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 569;
	while(spell < 577) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 613;
	while(spell < 619) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 620;
	while(spell < 636) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 663;
	while(spell < 665) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(680,slot);
	slot = slot + 1;
	spell = 1285;
	while(spell < 1287) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(1382,slot);
	slot = slot + 1;
	spell = 1400;
	while(spell < 1404) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 1503;
	while(spell < 1506) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(1944,slot);
	slot = slot + 1;
	e.other:ScribeSpell(2111,slot);
	slot = slot + 1;
	spell = 2230;
	while(spell < 2235) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 2236;
	while(spell < 2238) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 2239;
	while(spell < 2241) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 2242;
	while(spell < 2244) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 2531;
	while(spell < 2536) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 3583;
	while(spell < 3585) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(3699,slot);
	slot = slot + 1;
end

function enchanterSpells(e)
	slot = 0;
	e.other:ScribeSpell(10,slot);
	slot = slot + 1;
	e.other:ScribeSpell(21,slot);
	slot = slot + 1;
	spell = 24;
	while(spell < 26) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(33,slot);
	slot = slot + 1;
	spell = 35;
	while(spell < 37) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 39;
	while(spell < 43) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 45;
	while(spell < 50) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 64;
	while(spell < 68) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 71;
	while(spell < 75) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(80,slot);
	slot = slot + 1;
	e.other:ScribeSpell(84,slot);
	slot = slot + 1;
	e.other:ScribeSpell(86,slot);
	slot = slot + 1;
	e.other:ScribeSpell(127,slot);
	slot = slot + 1;
	spell = 131;
	while(spell < 134) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 162;
	while(spell < 164) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 170;
	while(spell < 189) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 190;
	while(spell < 196) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(205,slot);
	slot = slot + 1;
	e.other:ScribeSpell(208,slot);
	slot = slot + 1;
	e.other:ScribeSpell(222,slot);
	slot = slot + 1;
	spell = 228;
	while(spell < 231) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(235,slot);
	slot = slot + 1;
	e.other:ScribeSpell(243,slot);
	slot = slot + 1;
	e.other:ScribeSpell(246,slot);
	slot = slot + 1;
	e.other:ScribeSpell(261,slot);
	slot = slot + 1;
	e.other:ScribeSpell(276,slot);
	slot = slot + 1;
	e.other:ScribeSpell(281,slot);
	slot = slot + 1;
	spell = 285;
	while(spell < 308) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(309,slot);
	slot = slot + 1;
	e.other:ScribeSpell(331,slot);
	slot = slot + 1;
	e.other:ScribeSpell(350,slot);
	slot = slot + 1;
	e.other:ScribeSpell(390,slot);
	slot = slot + 1;
	spell = 407;
	while(spell < 409) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(417,slot);
	slot = slot + 1;
	e.other:ScribeSpell(439,slot);
	slot = slot + 1;
	e.other:ScribeSpell(450,slot);
	slot = slot + 1;
	e.other:ScribeSpell(473,slot);
	slot = slot + 1;
	spell = 481;
	while(spell < 485) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(489,slot);
	slot = slot + 1;
	spell = 500;
	while(spell < 502) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(521,slot);
	slot = slot + 1;
	e.other:ScribeSpell(540,slot);
	slot = slot + 1;
	spell = 581;
	while(spell < 602) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(619,slot);
	slot = slot + 1;
	spell = 645;
	while(spell < 649) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 650;
	while(spell < 655) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 667;
	while(spell < 671) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(673,slot);
	slot = slot + 1;
	spell = 676;
	while(spell < 679) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 681;
	while(spell < 691) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 695;
	while(spell < 698) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(1285,slot);
	slot = slot + 1;
	e.other:ScribeSpell(1359,slot);
	slot = slot + 1;
	spell = 1406;
	while(spell < 1409) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(1474,slot);
	slot = slot + 1;
	e.other:ScribeSpell(1797,slot);
	slot = slot + 1;
	spell = 1889;
	while(spell < 1891) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 1892;
	while(spell < 1894) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 2561;
	while(spell < 2566) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(3583,slot);
	slot = slot + 1;
	spell = 3585;
	while(spell < 3587) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(3696,slot);
	slot = slot + 1;
	spell = 3981;
	while(spell < 3994) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
end

function beastlordSpells(e)
	slot = 0;
	e.other:ScribeSpell(12,slot);
	slot = slot + 1;
	e.other:ScribeSpell(17,slot);
	slot = slot + 1;
	e.other:ScribeSpell(40,slot);
	slot = slot + 1;
	e.other:ScribeSpell(42,slot);
	slot = slot + 1;
	e.other:ScribeSpell(48,slot);
	slot = slot + 1;
	e.other:ScribeSpell(50,slot);
	slot = slot + 1;
	e.other:ScribeSpell(75,slot);
	slot = slot + 1;
	e.other:ScribeSpell(79,slot);
	slot = slot + 1;
	e.other:ScribeSpell(86,slot);
	slot = slot + 1;
	e.other:ScribeSpell(96,slot);
	slot = slot + 1;
	spell = 146;
	while(spell < 148) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(149,slot);
	slot = slot + 1;
	e.other:ScribeSpell(151,slot);
	slot = slot + 1;
	e.other:ScribeSpell(162,slot);
	slot = slot + 1;
	spell = 200;
	while(spell < 202) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(203,slot);
	slot = slot + 1;
	e.other:ScribeSpell(211,slot);
	slot = slot + 1;
	e.other:ScribeSpell(213,slot);
	slot = slot + 1;
	e.other:ScribeSpell(222,slot);
	slot = slot + 1;
	spell = 224;
	while(spell < 229) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(238,slot);
	slot = slot + 1;
	e.other:ScribeSpell(261,slot);
	slot = slot + 1;
	e.other:ScribeSpell(267,slot);
	slot = slot + 1;
	spell = 270;
	while(spell < 272) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(274,slot);
	slot = slot + 1;
	spell = 276;
	while(spell < 280) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 282;
	while(spell < 284) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(308,slot);
	slot = slot + 1;
	e.other:ScribeSpell(345,slot);
	slot = slot + 1;
	e.other:ScribeSpell(434,slot);
	slot = slot + 1;
	e.other:ScribeSpell(649,slot);
	slot = slot + 1;
	e.other:ScribeSpell(1285,slot);
	slot = slot + 1;
	e.other:ScribeSpell(2068,slot);
	slot = slot + 1;
	e.other:ScribeSpell(2176,slot);
	slot = slot + 1;
	e.other:ScribeSpell(2178,slot);
	slot = slot + 1;
	spell = 2611;
	while(spell < 2622) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	spell = 2632;
	while(spell < 2640) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(3291,slot);
	slot = slot + 1;
	spell = 3568;
	while(spell < 3570) do
		e.other:ScribeSpell(spell,slot);
		slot = slot + 1;
		spell = spell + 1;
	end
	e.other:ScribeSpell(3583,slot);
	slot = slot + 1;
	e.other:ScribeSpell(3689,slot);
	slot = slot + 1;
end


function warriorSkills(e)
	e.other:SetSkill(0,200);
	e.other:SetSkill(1,200);
	e.other:SetSkill(2,200);
	e.other:SetSkill(3,200);
	e.other:SetSkill(7,200);
	e.other:SetSkill(9,175);
	e.other:SetSkill(10,220);
	e.other:SetSkill(15,210);
	e.other:SetSkill(16,200);
	e.other:SetSkill(19,140);
	e.other:SetSkill(20,205);
	e.other:SetSkill(22,210);
	e.other:SetSkill(28,100);
	e.other:SetSkill(30,149);
	e.other:SetSkill(33,210);
	e.other:SetSkill(34,200);
	e.other:SetSkill(36,200);
	e.other:SetSkill(37,200);
	e.other:SetSkill(40,200);
	e.other:SetSkill(50,200);
	e.other:SetSkill(51,113);
	e.other:SetSkill(55,200);
	e.other:SetSkill(57,250);
	e.other:SetSkill(60,250);
	e.other:SetSkill(61,250);
	e.other:SetSkill(63,250);
	e.other:SetSkill(64,250);
	e.other:SetSkill(65,250);
	e.other:SetSkill(66,200);
	e.other:SetSkill(67,200);
	e.other:SetSkill(68,250);
	e.other:SetSkill(69,250);
	e.other:SetSkill(73,200);
end

function clericSkills(e)
	e.other:SetSkill(0,175);
	e.other:SetSkill(2,175);
	e.other:SetSkill(4,235);
	e.other:SetSkill(5,235);
	e.other:SetSkill(9,200);
	e.other:SetSkill(10,180);
	e.other:SetSkill(13,200);
	e.other:SetSkill(14,235);
	e.other:SetSkill(15,200);
	e.other:SetSkill(18,235);
	e.other:SetSkill(19,75);
	e.other:SetSkill(24,235);
	e.other:SetSkill(28,75);
	e.other:SetSkill(31,235);
	e.other:SetSkill(33,200);
	e.other:SetSkill(40,200);
	e.other:SetSkill(43,235);
	e.other:SetSkill(44,235);
	e.other:SetSkill(45,235);
	e.other:SetSkill(46,235);
	e.other:SetSkill(47,235);
	e.other:SetSkill(50,200);
	e.other:SetSkill(55,200);
	e.other:SetSkill(57,250);
	e.other:SetSkill(60,250);
	e.other:SetSkill(61,250);
	e.other:SetSkill(63,250);
	e.other:SetSkill(64,250);
	e.other:SetSkill(65,250);
	e.other:SetSkill(66,200);
	e.other:SetSkill(67,200);
	e.other:SetSkill(68,250);
	e.other:SetSkill(69,250);
end

function paladinSkills(e)
	e.other:SetSkill(0,200);
	e.other:SetSkill(1,200);
	e.other:SetSkill(2,200);
	e.other:SetSkill(3,200);
	e.other:SetSkill(4,235);
	e.other:SetSkill(5,235);
	e.other:SetSkill(7,75);
	e.other:SetSkill(9,200);
	e.other:SetSkill(10,180);
	e.other:SetSkill(13,200);
	e.other:SetSkill(14,235);
	e.other:SetSkill(15,210);
	e.other:SetSkill(16,70);
	e.other:SetSkill(18,235);
	e.other:SetSkill(19,125);
	e.other:SetSkill(20,200);
	e.other:SetSkill(24,235);
	e.other:SetSkill(28,100);
	e.other:SetSkill(31,185);
	e.other:SetSkill(33,200);
	e.other:SetSkill(34,175);
	e.other:SetSkill(36,200);
	e.other:SetSkill(37,175);
	e.other:SetSkill(40,200);
	e.other:SetSkill(50,200);
	e.other:SetSkill(55,200);
	e.other:SetSkill(57,250);
	e.other:SetSkill(60,250);
	e.other:SetSkill(61,250);
	e.other:SetSkill(63,250);
	e.other:SetSkill(64,250);
	e.other:SetSkill(65,250);
	e.other:SetSkill(66,200);
	e.other:SetSkill(67,200);
	e.other:SetSkill(68,250);
	e.other:SetSkill(69,250);
	e.other:SetSkill(73,180);
end

function rangerSkills(e)
	e.other:SetSkill(0,200);
	e.other:SetSkill(1,200);
	e.other:SetSkill(2,200);
	e.other:SetSkill(3,200);
	e.other:SetSkill(4,235);
	e.other:SetSkill(5,235);
	e.other:SetSkill(7,240);
	e.other:SetSkill(9,150);
	e.other:SetSkill(13,200);
	e.other:SetSkill(14,235);
	e.other:SetSkill(15,200);
	e.other:SetSkill(16,55);
	e.other:SetSkill(18,235);
	e.other:SetSkill(19,137);
	e.other:SetSkill(20,200);
	e.other:SetSkill(22,210);
	e.other:SetSkill(24,235);
	e.other:SetSkill(27,200);
	e.other:SetSkill(28,100);
	e.other:SetSkill(29,75);
	e.other:SetSkill(30,149);
	e.other:SetSkill(31,185);
	e.other:SetSkill(33,210);
	e.other:SetSkill(34,185);
	e.other:SetSkill(36,200);
	e.other:SetSkill(37,150);
	e.other:SetSkill(40,200);
	e.other:SetSkill(42,75);
	e.other:SetSkill(50,200);
	e.other:SetSkill(51,113);
	e.other:SetSkill(53,200);
	e.other:SetSkill(55,200);
	e.other:SetSkill(60,250);
	e.other:SetSkill(61,250);
	e.other:SetSkill(63,250);
	e.other:SetSkill(64,250);
	e.other:SetSkill(65,250);
	e.other:SetSkill(66,200);
	e.other:SetSkill(67,200);
	e.other:SetSkill(68,250);
	e.other:SetSkill(69,250);
	e.other:SetSkill(73,150);
end

function shadowknightSkills(e)
	e.other:SetSkill(0,200);
	e.other:SetSkill(1,200);
	e.other:SetSkill(2,200);
	e.other:SetSkill(3,200);
	e.other:SetSkill(4,235);
	e.other:SetSkill(5,235);
	e.other:SetSkill(7,75);
	e.other:SetSkill(9,150);
	e.other:SetSkill(10,175);
	e.other:SetSkill(13,200);
	e.other:SetSkill(14,235);
	e.other:SetSkill(15,210);
	e.other:SetSkill(16,70);
	e.other:SetSkill(18,235);
	e.other:SetSkill(19,125);
	e.other:SetSkill(20,200);
	e.other:SetSkill(24,235);
	e.other:SetSkill(28,100);
	e.other:SetSkill(29,75);
	e.other:SetSkill(31,185);
	e.other:SetSkill(33,200);
	e.other:SetSkill(34,175);
	e.other:SetSkill(36,200);
	e.other:SetSkill(37,175);
	e.other:SetSkill(40,200);
	e.other:SetSkill(50,200);
	e.other:SetSkill(55,200);
	e.other:SetSkill(57,250);
	e.other:SetSkill(60,250);
	e.other:SetSkill(61,250);
	e.other:SetSkill(63,250);
	e.other:SetSkill(64,250);
	e.other:SetSkill(65,250);
	e.other:SetSkill(66,200);
	e.other:SetSkill(67,200);
	e.other:SetSkill(68,250);
	e.other:SetSkill(69,250);
	e.other:SetSkill(73,180);
end

function druidSkills(e)
	e.other:SetSkill(0,175);
	e.other:SetSkill(1,175);
	e.other:SetSkill(2,175);
	e.other:SetSkill(4,235);
	e.other:SetSkill(5,235);
	e.other:SetSkill(9,200);
	e.other:SetSkill(13,200);
	e.other:SetSkill(14,235);
	e.other:SetSkill(15,200);
	e.other:SetSkill(18,235);
	e.other:SetSkill(19,75);
	e.other:SetSkill(24,235);
	e.other:SetSkill(27,200);
	e.other:SetSkill(28,75);
	e.other:SetSkill(31,235);
	e.other:SetSkill(33,200);
	e.other:SetSkill(40,200);
	e.other:SetSkill(43,235);
	e.other:SetSkill(44,235);
	e.other:SetSkill(45,235);
	e.other:SetSkill(46,235);
	e.other:SetSkill(47,235);
	e.other:SetSkill(50,200);
	e.other:SetSkill(53,125);
	e.other:SetSkill(55,200);
	e.other:SetSkill(60,250);
	e.other:SetSkill(61,250);
	e.other:SetSkill(63,250);
	e.other:SetSkill(64,250);
	e.other:SetSkill(65,250);
	e.other:SetSkill(66,200);
	e.other:SetSkill(67,200);
	e.other:SetSkill(68,250);
	e.other:SetSkill(69,250);
end

function monkSkills(e)
	e.other:SetSkill(0,240);
	e.other:SetSkill(2,240);
	e.other:SetSkill(9,200);
	e.other:SetSkill(11,200);
	e.other:SetSkill(15,230);
	e.other:SetSkill(16,200);
	e.other:SetSkill(19,200);
	e.other:SetSkill(20,210);
	e.other:SetSkill(21,200);
	e.other:SetSkill(22,252);
	e.other:SetSkill(23,200);
	e.other:SetSkill(25,200);
	e.other:SetSkill(26,200);
	e.other:SetSkill(28,225);
	e.other:SetSkill(30,200);
	e.other:SetSkill(32,200);
	e.other:SetSkill(33,230);
	e.other:SetSkill(37,200);
	e.other:SetSkill(38,200);
	e.other:SetSkill(39,200);
	e.other:SetSkill(40,200);
	e.other:SetSkill(42,113);
	e.other:SetSkill(50,200);
	e.other:SetSkill(51,113);
	e.other:SetSkill(52,200);
	e.other:SetSkill(55,200);
	e.other:SetSkill(60,250);
	e.other:SetSkill(61,250);
	e.other:SetSkill(63,250);
	e.other:SetSkill(64,250);
	e.other:SetSkill(65,250);
	e.other:SetSkill(66,200);
	e.other:SetSkill(67,200);
	e.other:SetSkill(68,250);
	e.other:SetSkill(69,250);
	e.other:SetSkill(71,200);
end

function bardSkills(e)
	e.other:SetSkill(0,200);
	e.other:SetSkill(1,200);
	e.other:SetSkill(9,150);
	e.other:SetSkill(12,235);
	e.other:SetSkill(15,200);
	e.other:SetSkill(17,100);
	e.other:SetSkill(19,125);
	e.other:SetSkill(22,210);
	e.other:SetSkill(27,55);
	e.other:SetSkill(28,100);
	e.other:SetSkill(29,40);
	e.other:SetSkill(31,1);
	e.other:SetSkill(33,200);
	e.other:SetSkill(35,100);
	e.other:SetSkill(36,200);
	e.other:SetSkill(39,40);
	e.other:SetSkill(40,200);
	e.other:SetSkill(41,235);
	e.other:SetSkill(42,75);
	e.other:SetSkill(49,235);
	e.other:SetSkill(50,200);
	e.other:SetSkill(51,113);
	e.other:SetSkill(53,100);
	e.other:SetSkill(54,235);
	e.other:SetSkill(55,200);
	e.other:SetSkill(60,250);
	e.other:SetSkill(61,250);
	e.other:SetSkill(62,75);
	e.other:SetSkill(63,250);
	e.other:SetSkill(64,250);
	e.other:SetSkill(65,250);
	e.other:SetSkill(66,200);
	e.other:SetSkill(67,200);
	e.other:SetSkill(68,250);
	e.other:SetSkill(69,250);
	e.other:SetSkill(70,235);
	e.other:SetSkill(71,100);
end

function rogueSkills(e)
	e.other:SetSkill(0,200);
	e.other:SetSkill(1,200);
	e.other:SetSkill(6,200);
	e.other:SetSkill(7,200);
	e.other:SetSkill(8,200);
	e.other:SetSkill(9,181);
	e.other:SetSkill(15,200);
	e.other:SetSkill(16,200);
	e.other:SetSkill(17,200);
	e.other:SetSkill(19,150);
	e.other:SetSkill(20,200);
	e.other:SetSkill(22,210);
	e.other:SetSkill(28,100);
	e.other:SetSkill(29,200);
	e.other:SetSkill(33,210);
	e.other:SetSkill(34,200);
	e.other:SetSkill(35,200);
	e.other:SetSkill(36,210);
	e.other:SetSkill(37,200);
	e.other:SetSkill(39,94);
	e.other:SetSkill(40,200);
	e.other:SetSkill(42,200);
	e.other:SetSkill(48,200);
	e.other:SetSkill(50,200);
	e.other:SetSkill(51,220);
	e.other:SetSkill(55,200);
	e.other:SetSkill(56,200);
	e.other:SetSkill(57,250);
	e.other:SetSkill(60,250);
	e.other:SetSkill(61,250);
	e.other:SetSkill(62,200);
	e.other:SetSkill(63,250);
	e.other:SetSkill(64,250);
	e.other:SetSkill(65,250);
	e.other:SetSkill(66,200);
	e.other:SetSkill(67,200);
	e.other:SetSkill(68,250);
	e.other:SetSkill(69,250);
	e.other:SetSkill(71,200);
end

function shamanSkills(e)
	e.other:SetSkill(0,200);
	e.other:SetSkill(2,200);
	e.other:SetSkill(4,235);
	e.other:SetSkill(5,235);
	e.other:SetSkill(9,200);
	e.other:SetSkill(13,200);
	e.other:SetSkill(14,235);
	e.other:SetSkill(15,200);
	e.other:SetSkill(18,235);
	e.other:SetSkill(19,75);
	e.other:SetSkill(24,235);
	e.other:SetSkill(28,75);
	e.other:SetSkill(31,235);
	e.other:SetSkill(33,200);
	e.other:SetSkill(36,200);
	e.other:SetSkill(40,200);
	e.other:SetSkill(43,235);
	e.other:SetSkill(44,235);
	e.other:SetSkill(45,235);
	e.other:SetSkill(46,235);
	e.other:SetSkill(47,235);
	e.other:SetSkill(50,200);
	e.other:SetSkill(55,200);
	e.other:SetSkill(59,130);
	e.other:SetSkill(60,250);
	e.other:SetSkill(61,250);
	e.other:SetSkill(63,250);
	e.other:SetSkill(64,250);
	e.other:SetSkill(65,250);
	e.other:SetSkill(66,200);
	e.other:SetSkill(67,200);
	e.other:SetSkill(68,250);
	e.other:SetSkill(69,250);
end

function necromancerSkills(e)
	e.other:SetSkill(0,110);
	e.other:SetSkill(2,110);
	e.other:SetSkill(4,235);
	e.other:SetSkill(5,235);
	e.other:SetSkill(9,100);
	e.other:SetSkill(13,200);
	e.other:SetSkill(14,235);
	e.other:SetSkill(15,145);
	e.other:SetSkill(18,235);
	e.other:SetSkill(19,75);
	e.other:SetSkill(24,235);
	e.other:SetSkill(28,75);
	e.other:SetSkill(31,235);
	e.other:SetSkill(33,140);
	e.other:SetSkill(36,110);
	e.other:SetSkill(40,200);
	e.other:SetSkill(43,235);
	e.other:SetSkill(44,235);
	e.other:SetSkill(45,235);
	e.other:SetSkill(46,235);
	e.other:SetSkill(47,235);
	e.other:SetSkill(50,200);
	e.other:SetSkill(51,75);
	e.other:SetSkill(55,200);
	e.other:SetSkill(57,250);
	e.other:SetSkill(58,175);
	e.other:SetSkill(60,250);
	e.other:SetSkill(61,250);
	e.other:SetSkill(63,250);
	e.other:SetSkill(64,250);
	e.other:SetSkill(65,250);
	e.other:SetSkill(66,200);
	e.other:SetSkill(67,200);
	e.other:SetSkill(68,250);
	e.other:SetSkill(69,250);
end

function wizardSkills(e)
	e.other:SetSkill(0,110);
	e.other:SetSkill(2,110);
	e.other:SetSkill(4,235);
	e.other:SetSkill(5,235);
	e.other:SetSkill(9,100);
	e.other:SetSkill(13,200);
	e.other:SetSkill(14,235);
	e.other:SetSkill(15,145);
	e.other:SetSkill(18,235);
	e.other:SetSkill(19,75);
	e.other:SetSkill(24,235);
	e.other:SetSkill(28,75);
	e.other:SetSkill(31,235);
	e.other:SetSkill(33,140);
	e.other:SetSkill(36,110);
	e.other:SetSkill(40,200);
	e.other:SetSkill(43,235);
	e.other:SetSkill(44,235);
	e.other:SetSkill(45,235);
	e.other:SetSkill(46,235);
	e.other:SetSkill(47,235);
	e.other:SetSkill(50,200);
	e.other:SetSkill(51,75);
	e.other:SetSkill(55,200);
	e.other:SetSkill(57,250);
	e.other:SetSkill(58,175);
	e.other:SetSkill(60,250);
	e.other:SetSkill(61,250);
	e.other:SetSkill(63,250);
	e.other:SetSkill(64,250);
	e.other:SetSkill(65,250);
	e.other:SetSkill(66,200);
	e.other:SetSkill(67,200);
	e.other:SetSkill(68,250);
	e.other:SetSkill(69,250);
end

function magicianSkills(e)
	e.other:SetSkill(0,110);
	e.other:SetSkill(2,110);
	e.other:SetSkill(4,235);
	e.other:SetSkill(5,235);
	e.other:SetSkill(9,100);
	e.other:SetSkill(13,200);
	e.other:SetSkill(14,235);
	e.other:SetSkill(15,145);
	e.other:SetSkill(18,235);
	e.other:SetSkill(19,75);
	e.other:SetSkill(24,235);
	e.other:SetSkill(28,75);
	e.other:SetSkill(31,235);
	e.other:SetSkill(33,140);
	e.other:SetSkill(36,110);
	e.other:SetSkill(40,200);
	e.other:SetSkill(43,235);
	e.other:SetSkill(44,235);
	e.other:SetSkill(45,235);
	e.other:SetSkill(46,235);
	e.other:SetSkill(47,235);
	e.other:SetSkill(50,200);
	e.other:SetSkill(51,75);
	e.other:SetSkill(55,200);
	e.other:SetSkill(57,250);
	e.other:SetSkill(58,175);
	e.other:SetSkill(60,250);
	e.other:SetSkill(61,250);
	e.other:SetSkill(63,250);
	e.other:SetSkill(64,250);
	e.other:SetSkill(65,250);
	e.other:SetSkill(66,200);
	e.other:SetSkill(67,200);
	e.other:SetSkill(68,250);
	e.other:SetSkill(69,250);
end

function enchanterSkills(e)
	e.other:SetSkill(0,110);
	e.other:SetSkill(2,110);
	e.other:SetSkill(4,235);
	e.other:SetSkill(5,235);
	e.other:SetSkill(9,100);
	e.other:SetSkill(13,200);
	e.other:SetSkill(14,235);
	e.other:SetSkill(15,145);
	e.other:SetSkill(18,235);
	e.other:SetSkill(19,75);
	e.other:SetSkill(24,235);
	e.other:SetSkill(28,75);
	e.other:SetSkill(31,235);
	e.other:SetSkill(33,140);
	e.other:SetSkill(36,110);
	e.other:SetSkill(40,200);
	e.other:SetSkill(43,235);
	e.other:SetSkill(44,235);
	e.other:SetSkill(45,235);
	e.other:SetSkill(46,235);
	e.other:SetSkill(47,235);
	e.other:SetSkill(50,200);
	e.other:SetSkill(51,75);
	e.other:SetSkill(55,200);
	e.other:SetSkill(57,250);
	e.other:SetSkill(58,175);
	e.other:SetSkill(60,250);
	e.other:SetSkill(61,250);
	e.other:SetSkill(63,250);
	e.other:SetSkill(64,250);
	e.other:SetSkill(65,250);
	e.other:SetSkill(66,200);
	e.other:SetSkill(67,200);
	e.other:SetSkill(68,250);
	e.other:SetSkill(69,250);
end

function beastlordSkills(e)
	e.other:SetSkill(0,200);
	e.other:SetSkill(2,200);
	e.other:SetSkill(4,235);
	e.other:SetSkill(5,235);
	e.other:SetSkill(9,200);
	e.other:SetSkill(11,150);
	e.other:SetSkill(13,200);
	e.other:SetSkill(14,235);
	e.other:SetSkill(15,210);
	e.other:SetSkill(18,235);
	e.other:SetSkill(19,125);
	e.other:SetSkill(22,210);
	e.other:SetSkill(24,235);
	e.other:SetSkill(28,200);
	e.other:SetSkill(30,180);
	e.other:SetSkill(31,185);
	e.other:SetSkill(33,200);
	e.other:SetSkill(36,200);
	e.other:SetSkill(37,150);
	e.other:SetSkill(40,200);
	e.other:SetSkill(50,200);
	e.other:SetSkill(51,118);
	e.other:SetSkill(55,200);
	e.other:SetSkill(60,250);
	e.other:SetSkill(61,250);
	e.other:SetSkill(63,250);
	e.other:SetSkill(64,250);
	e.other:SetSkill(65,250);
	e.other:SetSkill(66,200);
	e.other:SetSkill(67,200);
	e.other:SetSkill(68,250);
	e.other:SetSkill(69,250);
end


function raid(e)
	if(e.other:GetLevel() < 51) then
		e.other:SetLevel(50);
		e.other:SetEXP(170000000,0);
		e.other:UnscribeSpellAll();
		if(e.other:GetClass() == 1) then -- warrior
			warriorSkills(e);
		elseif(e.other:GetClass() == 2) then -- cleric
			clericSpells(e);
			clericSkills(e);
		elseif(e.other:GetClass() == 3) then -- paladin
			paladinSpells(e);
			paladinSkills(e);
		elseif(e.other:GetClass() == 4) then -- ranger
			rangerSpells(e);
			rangerSkills(e);
		elseif(e.other:GetClass() == 5) then -- shadowknight
			shadowknightSpells(e);
			shadowknightSkills(e);
		elseif(e.other:GetClass() == 6) then -- druid
			druidSpells(e);
			druidSkills(e);
		elseif(e.other:GetClass() == 7) then -- monk
			monkSkills(e);
		elseif(e.other:GetClass() == 8) then -- bard
			bardSpells(e);
			bardSkills(e);
		elseif(e.other:GetClass() == 9) then -- rogue
			rogueSkills(e);
		elseif(e.other:GetClass() == 10) then -- shaman
			shamanSpells(e);
			shamanSkills(e);
		elseif(e.other:GetClass() == 11) then -- necromancer
			necromancerSpells(e);
			necromancerSkills(e);
		elseif(e.other:GetClass() == 12) then -- wizard
			wizardSpells(e);
			wizardSkills(e);
		elseif(e.other:GetClass() == 13) then -- magician
			magicianSpells(e);
			magicianSkills(e);
		elseif(e.other:GetClass() == 14) then -- enchanter
			enchanterSpells(e);
			enchanterSkills(e);
		elseif(e.other:GetClass() == 15) then -- beastlord
			beastlordSpells(e);
			beastlordSkills(e);
		end
	end
end
