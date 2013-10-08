sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 18727 => 1)) { # Tattered Note
		quest::say("Greetings. I am Ghanlin Skyphire, Master Wizard of the Crimson Hands. All of us here have devoted our lives to the studies of the arcane and mystical. Let's get you started. Here's your training robe.  Now, go find Raskena. She'll help train you and give you your first lesson.");
		quest::summonitem(13550); #Old Used Robe*
		quest::ding();
		quest::faction(60,10);   #Crimson Hands
		quest::faction(145,10);  #High Council of Erudin
		quest::faction(143,-15); #Heretics
		quest::faction(147,10);  #High Guard of Erudin		
		quest::exp(100);
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:erudnint  ID:24040 -- Ghanlin_Skyphire