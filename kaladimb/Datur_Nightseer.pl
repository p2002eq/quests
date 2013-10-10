sub EVENT_SAY {
   if ($text=~/hail/i) {
      quest::say("Welcome to our temple. We are the paladins of the Church of Underfoot. I am lord of our holy order. I call upon you to assist us in the defense of Kaladim. Speak with the master paladins or priests and find ways to prove your allegiance to Brell.");
	}
}

sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 18768 => 1)) {
		quest::say("Welcome, we are the Paladins of the Underfoot. I am Datur, and I will help teach you the word and will of the Duke of Below, Brell Serilis. Here is our guild tunic. Let's get started, shall we?");
      quest::summonitem(13514);
	  quest::ding();
      quest::faction(44, 4);
      quest::faction(169, 4);
      quest::faction(246, 4);
      quest::faction(351, 4);
	  quest::exp(100);
   }
   if (($faction <= 4) && (plugin::check_handin(\%itemcount, 12279 => 1))) {
      quest::say("The chalice is returned!! Praise be to Brell!! You have proven yourself to our church and have earned our respect. Let me welcome you into our brotherhood with the Cape of Underfoot. Wear it with pride as all of our finest paladins do.");
      quest::faction(44, 25);
      quest::faction(169, 25);
      quest::faction(219, 25);
      quest::exp(250);
      quest::givecash(0, 0, 0, 3);
      quest::summonitem(12281);
   }
   #do all other handins first with plugin, then let it do disciplines
   plugin::try_tome_handins(\%itemcount, $class, 'Paladin');

   plugin::return_items(\%itemcount);
}

#END of FILE Zone:kaladimb  ID:67029 -- Datur_Nightseer