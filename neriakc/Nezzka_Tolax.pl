sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 18757 => 1)) { #tattered note
		quest::say("Hmmm, I hope you're tougher than you look. Here, put this on. Go find Ulraz, he'll beat you into shape. There's no turning back now, punk. So, you'd better do well, got it?");
		quest::ding();
		quest::summonitem(13586); #Black Training Tunic
		quest::faction(322,100); #The Dead
		quest::faction(268,15); #Queen Cristanos Thex
		quest::faction(177,-15); #King Naythox Thex
		quest::faction(170,-15); #Keeper of the Art
		quest::faction(91,-15); #Eldritch Collective
		quest::faction(260,-200); #Primodial Malice
		quest::exp(100);
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:neriakc  ID:42069 -- Nezzka_Tolax