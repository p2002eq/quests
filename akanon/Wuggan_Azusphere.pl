sub EVENT_ITEM { 
  if(plugin::check_handin(\%itemcount, 18772 => 1)) { # Registration Letter
    quest::say("Welcome to Library Mechanimagica. I am Master Magician Wuggan Azusphere. and I will help to teach you the ways of summoning. Here is our guild tunic, make us proud.");
    quest::summonitem(13521); # Dusty Gold Robe*
		quest::ding();
		quest::faction(91,10); #Eldritch Collective
		quest::faction(71,-15); #Dark reflection
		quest::faction(322,-15); #The Dead	
		quest::faction(115,10); #Gem Choppers
		quest::faction(176,10); #King Ak'Anon
		quest::exp(100);
	}
  plugin::return_items(\%itemcount);
}
