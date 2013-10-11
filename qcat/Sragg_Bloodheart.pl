sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 18706  => 1)) { #Stained Cloth Note
		quest::say("Ah, another would-be soldier for the army of the Plaguebringer. Unmuz has just lost a few of his men, he'll have plenty of work for you. I'm sure. Begone!");
		quest::summonitem(13598); #Ruined Training Tunic*
		quest::ding();
		quest::faction(21,10); #Bloodsabers
		quest::faction(135,-15); #Guards of Qeynos
		quest::faction(235,10); #Opal Dark Briar
		quest::faction(257,-15); #Priest of Life
		quest::faction(53,10); #Corrupt Qeynos Guards
		quest::exp(100);
	}
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
	plugin::return_items(\%itemcount);
}
