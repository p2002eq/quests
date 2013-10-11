sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 18773 => 1)) { # Registration Letter
		quest::say("Welcome! I am Juline Urncaller, I will help to guide you on your path to becoming a powerful enchanter.");
		quest::summonitem(13522); # Dirty Gold Felt Robe*
		quest::ding();
		quest::faction(91,10); #eldritch collective
		quest::faction(71,-15); #Dark reflection
		quest::faction(322,-15); #the dead	
		quest::faction(115,10); #gem choppers
		quest::faction(176,10); #king ak'anon
		quest::exp(100);
	}
	plugin::return_items(\%itemcount);
}
