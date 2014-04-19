sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Hail and well met, $name!  Have you come to study. or can you [perform a task] for me this day?");
	}
	if($text=~/perform a task/i){
		quest::say("That is the spirit.  There are many black wolves wandering Faydark these days.  One of my brethren needs a black wolf skin as a component for his magic.  Bring me a black wolf skin. and I shall reward you for your efforts."); 
	}
}

sub EVENT_ITEM { 
	if (plugin::check_handin(\%itemcount,13758=>1)) {
		quest::say("Ah yes.  This is exactly what I need.  Thank you very much.");
		quest::summonitem(quest::ChooseRandom(7007,13009,58094,59964,6012));
		quest::faction(170,2);
		quest::faction(178,2);
		quest::faction(99,2);
		quest::faction(322,-4);
		quest::ding();
		quest::exp(350);
	}
	elsif (plugin::check_handin(\%itemcount,18779=>1)) { # Enrollment Letter
		quest::say("Welcome to the wizards' guild of the Keepers of the Art. My name's Tarker, and I run this guild. You've got a lot of training ahead of you, so let's get started. Here, take this - it's our guild tunic. Wear it with honor, friend.");
		quest::summonitem(13594); # Singed Training Robe*
		quest::ding();
		quest::faction(170,100); # Keepers of the Art
		quest::faction(178,25); # King Tearis Thex
		quest::faction(99,15); # Faydark's Champions
		quest::faction(322,-25); # The Dead
		quest::exp(100);
	}
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:felwitheb  ID:62019 -- Tarker_Blazetoss
