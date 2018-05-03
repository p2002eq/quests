--TrapMan (218341)
--selects mob trap spawns based on trap location
--poeartha
--by Daeron

--[[
		Trap Types:
		
		1) Undead Ruins (low trigger chance given cluster of traps in area - verified on test server)
		2) Croc traps (hatchling trap mob or can spawn trash mob needlescale basilsk)
		3) Tree traps (tenacious trap mob or can spawn trash mob unkempt arborean)
		4) Dust traps  (magical dust trap mob or can spawn trash mob earthen crusader)
		5) Mud traps (mudfilled earth golem)earthen mudslinger trash mob
		6) Rock traps (named galsinak earthcrafter
		7) Frog traps (young tree frog trap mob, korascian hunter trash mob)  
		8) Initiate traps (earthen initiate trap mob, fearsome earthcrater trash mob)
		9) Vekerchiki mobs (drone trap mob, warrior trash mob, chieftain named)
		10) Gem mobs  - all common/named share loot spawns

]]

--traps listed by spawnpoint ID
local trap_list = { [1] = {365475,365692,365969,366014,367310,367349,366594,366588,365509, 365897, 365898, 366319,366206},	--undead spawns (13)
					[2] = {366553,365538,367096,366915,367129},		--croc traps
					[3] = {366174,365793,367353,366782,365288},		--tree traps
					[4] = {366143,366780,365850,366865,366465},		--dust traps
					[5] = {366232,365648,366703,366158,365663},		--mud traps
					[6] = {365308,366179,365269,365479,366534},		--stone traps
					[7] = {365901,367122,366410,366960,367522},		--frog traps
					[8] = {365483,366352,366495,365816,366459},		--earth initiate traps
					[9] = {366698,367239,365564,366544,366080};		--Vekerchiki spawns
					[10] = {366554,365670,367496,365950,366118,367126,366186,367255,366738,366409,365549,365886,367024,366237,365605,366297,367182,366584,365320,366039} } 	--gem cave traps (20)
					
--Note:  Traps (excluding undead/geos trap types) can spawn one of the following:  1) Trap specific version, 2) Common trash version, 3) Named/rare  

local trap_npc_common = {	[1] = {218346}, 							--#A_Decaying_Spelunker (218346)
							[2] = {218364,218006},						--#A_Needlescale_Hatchling (218364), A_Needlescale_Basilisk (218006)
							[3] = {218375,218011},						--#A_Tenacious_Arborean (218375), An_Unkempt_Arborean(218011)
							[4] = {218354,218238},						--#A_Magical_Collection_of_Dust (218354), An_Earthen_Crusader (218238)
							[5] = {218362,218000},						--#A_Mudfilled_Earth_Golem (218362), An_Earthen_Mudslinger(218000)
							[6] = {218377,218016},						--#A_Unfinished_Stonewalker (218377), A_Stone_Abomination{218016)
							[7] = {218380,218004},						--#A_Young_Frog(218380), A_Korascian_Hunter(218004)
							[8] = {218382,218008},						--#An_Earth_Initiate(218382), A_Fearsome_Earthcrafter(218008)
							[9] = {218378,218025},						--#A_Vekerchiki_Drone (218378), A_Vekerchiki_Warrior(218025)
							[10] = {218350,218351,218372,218379} }; 	--#A_Gemmed_Rock_Man (218350), #A_Glass_Formation (218351), #A_Small_Rockmonster (218372), A_Young_Cave_Geonid (218379)
							
							
local trap_npc_rare = {		[1] = {}, 								--no named chance for undead 
							[2] = {218368},							--#A_Prismatic_Basilisk (218368)
							[3] = {218384},							--#Calris_Bristlebranch (218384)		
							[4] = {218389},							--#The_Living_Earth (218389)
							[5] = {218357},							--A_Monstrous_Earthwalker(218357)
							[6] = {218386},							--#Galsinak_Earthrumble(218386)
							[7] = {218352},							--A_Korascian_Warlord(218352)
							[8] = {218390},							--#Tribal_Leader_Diseranon(218390)
							[9] = {218381}, 						--#An_Ancient_Vekerchiki_Champion (218381)
							[10] = {218369,218365,218370,218387} }; --A_Pristine_Gem_Golem (218369), A_Perfect_Rock_Formation(218365), A_Shimmering_Gem_Sentry (218370),#Glimmerstone(218387)		


function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	eq.set_proximity(xloc - 40, xloc + 40, yloc - 40, yloc + 40, zloc - 20, zloc + 20);
end

function event_enter(e)
	local trap_type = trap_type_check(e);
	if trap_type == 1 then	--special rules for undead trap type
		trap_chance = 5;
		named_chance = 0;
	else
		trap_chance = 50;
		named_chance = 3;
	end

	local rand = math.random(1,100);
	if not e.other:GetGM() and rand <= trap_chance then 	
		local x, y, z, h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();		
		local npc_id = mob_selection(trap_type,named_chance);
			
		local spawned = eq.spawn2(npc_id,0,0,x,y,z,h);	
		eq.set_timer('depop', 15 * 60 * 1000, spawned);
        
        eq.local_emote({x,y,z},7,75,"The earth begins to rumble and shake beneath you as an unseen monster rises from the rubble."); 
        eq.depop_with_timer();
	end
end

function trap_type_check(e)
	for n = 1, #trap_list do 
		for k,v in pairs(trap_list[n]) do
			if e.self:GetSpawnPointID() == v then
				return n;
			end
		end
	end
end

function mob_selection(trap, chance)
	local roll = math.random(1,100);	
	if roll <= chance then 
		local rare = trap_npc_rare[trap];
		return rare[math.random(#rare)];
	else
		local common = trap_npc_common[trap];
		if #common == 2 then 
			if math.random(100) <= 75 then	--higher chance to get a trap mob vs common mob (doesn't apply to undead or geo caves)
				return common[1];	
			else 
				return common[2];
			end		
		else		
			return common[math.random(#common)];
		end
	end
end


