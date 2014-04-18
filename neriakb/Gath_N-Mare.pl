sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 18755 => 1)) { #Tattered Note
		quest::say("I am Gath N'Mare, master wizard of the Tower of the Spurned. Welcome to our guild. Let's get started, shall we?  Here is your tunic, represent us well with it. Shanez X'Teria is our beginning guild trainer. He will teach you the basics and give you a solid learning foundation of magic.  Good luck, and study hard.");
		quest::ding();
		quest::summonitem(13584); #Stained Red Robe*
		quest::faction(331,100); #The Spurned
		quest::faction(322,-15); #The Dead
		quest::exp(100);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:neriakb  ID:41053 -- Gath_N`Mare