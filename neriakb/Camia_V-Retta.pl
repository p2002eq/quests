sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18753 => 1)) { #tattered note
    quest::say("Greetings, and welcome to the Tower of the Spurned! I am Camia V'Retta, master enchantress. Here is your guild tunic, wear it with pride.  Go to Ulvex D'Jerna; he whall help you with your new studies.");
		quest::ding();
    quest::summonitem(13582); #Ruined Red Robe*
		quest::faction(331,10); #The Spurned
		quest::faction(322,-15); #The Dead
    quest::exp(100);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:neriakb  ID:41052 -- Camia_V`Retta