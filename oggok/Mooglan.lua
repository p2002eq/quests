function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Yuz come lookeeng to make sum armorz? Yuz come to da right place, if'n yuz be a shadowknight. Is you a [" .. eq.say_link("secret mission") .. "]?");
	elseif(e.message:findi("shadowknight")) then
		e.self:Say("Mez tink dat yuz were. Letz begin yur traineeng. Da furst ting dat yuz needz to do is gather da itemz dat will be uzed in da krafteeng of da [" .. eq.say_link("armor") .. "] and den yuz can kraft dem in dis majikal assembly kit");
	elseif(e.message:findi("armor")) then
		e.self:Say("Da itemz you will needz to gather will be all ober da Feerrott. Dese itemz will be hard for yuz to gather, dey come from some of da meanest tings in da Feerrott. Once yuz are redy to begin, tell mez da piece dat yuz wantz to kraft and mez will give yuz da recipez dat yuz will need when making da armor. I have recipez for [" .. eq.say_link("Helm") .. "], [" .. eq.say_link("Bracers") .. "], [" .. eq.say_link("Sleeves") .. "], [" .. eq.say_link("Boots") .. "], [" .. eq.say_link("Legplates") .. "], [" .. eq.say_link("Gloves") .. "] and [" .. eq.say_link("Breastplate") .. "].");
		e.other:SummonItem(34079); -- Assembly Kit of Darkness
	elseif(e.message:findi("helm")) then
		e.self:Say("Da helm iz da most impotent piece to get, since it protekt da smertest part of da body. To kraft da helm, yuz needz to gather a pristine lizard scale, one chunk of light colored fungus, and two spider legs, and kraft dem into dis here majikal assembly kit to get yur brestplate material. Den yuz take dat material and dis mold to a forge and smelt dem together into a gud helm.");
		e.other:SummonItem(34080); -- Helm Mold of Darkness
	elseif(e.message:findi("bracers")) then
		e.self:Say("Da bracer is a gud piece to have. If yuz want to kraft a bracer, yuz need to gather a pristine lizard scale, two bone chips, and a pristine spider silk, and kraft dem into dis here majikal assembly kit to get yur brestplate material. Den yuz take dat material and dis mold to a forge and smelt dem together into a gud bracer.");
		e.other:SummonItem(34081); -- Bracer Mold of Darkness
	elseif(e.message:findi("sleeves")) then
		e.self:Say("Da sleeves is also a impotent piece or armer, one dat will serve yuz well if yuz decide to make some. If yuz want to kraft a sleeves, yuz need to gather a pristine lizard scale, one long lizard tail, and a chunk of dark colored fungus, and kraft dem into dis here majikal assembly kit to get yur brestplate material. Den yuz take dat material and dis mold to a forge and smelt dem together into a gud set of sleeves.");
		e.other:SummonItem(34082); -- Armplate Mold of Darkness
	elseif(e.message:findi("boots")) then
		e.self:Say("Da boots is a gud piece to have, dey is gud for trompin around in da Feerrott and even gud for skweeshing da big bugs dat lives out dere. If yuz want to kraft a boots, yuz need to gather pristine a lizard scale, two spiderling silks, and a giant bat wing, and kraft dem into dis here majikal assembly kit to get yur brestplate material. Den yuz take dat material and dis mold to a forge and smelt dem together into a gud set of boots.");
		e.other:SummonItem(34083); -- Boot Mold of Darkness
	elseif(e.message:findi("legplates")) then
		e.self:Say("Wez Ogre have big legz, which make big targets for da enemies, so itz a gud ting to protekt dem as best you can. To kraft some legplates, yuz need to gather two pristine lizard scales, one black spider silk, and one chunk of multi-colored fungus, and kraft dem into dis here majikal assembly kit to get yur brestplate material. Den yuz take dat material and dis mold to a forge and smelt dem together into some gud legplates");
		e.other:SummonItem(34084); -- Legplate Mold of Darkness
	elseif(e.message:findi("gloves")) then
		e.self:Say("We also have big handz, which makes dem very easy to get hurt in da battles, so it also be a good idea to protekt dem too. If yuz want to kraft a gloves, yuz need to gather a pristine lizard scale, one black lizard scale, and one spiderling silk, and kraft dem into dis here majikal assembly kit to get yur brestplate material. Den yuz take dat material and dis mold to a forge and smelt dem together into a some gud gloves");
		e.other:SummonItem(34085); -- Gauntlet Mold of Darkness
	elseif(e.message:findi("breastplate")) then	
		e.self:Say("Da brestplate is a gud piece to have, it protektz yuz from all da beatingz dat you get if you fight in da Feerrott. If yuz want to kraft a brestplate, yuz need to gather two pristine lizard scales, one black lizard scale, and four black spiderling silks, and kraft dem into dat there majikal assembly kit to get yur brestplate material. Den yuz take dat material and dis mold to a forge and smelt dem together into a gud breastplate.");
		e.other:SummonItem(34086); -- Breastplate Mold of Darkness
	end
end