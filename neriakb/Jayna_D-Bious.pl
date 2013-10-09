sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 18754 => 1)) { #Tattered Note
		quest::say("Welcome, young magician. I am Jayna D'Bious. You have much to learn, so let's get you started. Here is your guild tunic.  Go find Belux, he is in charge of instructing our new recruits.  Study hard, and you will do well.");
		quest::ding();
		quest::summonitem(13583); #Torn Red Robe*
		quest::faction(331,10); #The Spurned
		quest::faction(322,-15); #The Dead
		quest::exp(100);
	}
  	plugin::return_items(\%itemcount);
}

#END of FILE Zone:neriakb  ID:41054 -- Jayna_D`Bious