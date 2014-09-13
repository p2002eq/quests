function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. " .. e.other:GetName() .. "!  My name is Roesager Thusten. Paladin of Life.  I am a loyal servant of the Prime Healer and I seek to destroy all who wish to bring death and disease to the land of Norrath.");
	elseif(e.message:findi("prime healer")) then
		e.self:Say("Rodcet Nife is teh Prime Healer.  It is He who gives us the power to resist the decay and death that Bertoxxulous has released upon Norrath. The Temple of Life is dedicated to his honor.");
	elseif(e.message:findi("death and disease")) then
		e.self:Say("The Plaguebringers are followers of the disease lord, Bertoxxulous. We  believe a sect of them now operates in Qeynos, be we need proof before we can act.");
	elseif(e.message:findi("need proof")) then
		e.self:Say("Someone reported seeing a Plaguebringer roaming about in the hills near Qeynos. We have long suspected that their dark influence was spreading. I am searching for proof that they are now here in Qeynos.  If you find anything, please bring it to me at the Temple of Life.");
	elseif(e.message:findi("temple of life")) then
		e.self:Say("The Temple of LIfe, dedicated to the glory of the Prime Healer, is in the heart of North Qeynos. Enter the glowing disks above the Pool of Jahnda and you will magically appear inside the temple.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos2  ID:2049 -- Roesager_Thusten