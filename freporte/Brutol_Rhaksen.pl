sub EVENT_SAY { 
	if($text=~/hail/i) {
		quest::say("Oh. hello down there. puny one. I'm Brutol Rhaksen. Commmander of warriors who [serve] the Dismal Rage. and that's really all you need to know..for now.");
	}
	if($text=~/serve/i) {
		quest::say("You must become strong to survive amongst the ranks of the Dismal Rage. Take this note to Rolfic Gohar and he will help you get a suit of armor to protect your scrawny hide from the weapons of our enemies. Once you have been properly outfitted return to me and will give you your [next orders].");
		quest::summonitem(19843); # Note to Rolfic Gohar
	}
	if($text=~/next orders/i) {
		quest::say("Ready to make yourself useful $name ? Beneath West Freeport are sewer tunnels leading to North Freeport being used by the Knights of Truth and the Sentries and Passion that have gained too much notoriety with the Freeport Militia and the Dismal Rage to pass safely through the eastern and western quarters of Freeport. We believe a sympathizer of the Sentries of Passion. Tarsa Yovar. is hiding somewhere in the western tunnel system. The sympathizer is a Steel Warrior faithful to Erollisi and although she is only a minor nuisance must be dealt with. Find her and bring me her head.");
	}
}

sub EVENT_ITEM { 
	if (plugin::check_handin(\%itemcount, 18857 => 1)) { # A tattered note
		quest::say("Hahaha.. I sure hope you prove more valuable than you look, little one.");
		quest::ding();
		quest::summonitem(13561); # Faded Crimson Tunic
		quest::faction(86,10); #Dismal Rage
		quest::faction(184,-15); #Knights of Truth
		quest::faction(235,10); #Opal Dark Briar  
		quest::exp(100);
	}
	elsif (plugin::check_handin(\%itemcount, 19932 => 1)) { # Tarsa Yovar's Head ID-19932
		quest::say("Take this and get it sharpened. Bring it back to me with a Giant Rattlesnake Skin and you will have proven yourself able to wield a Dismal Rage Battle Axe, to help teach the way of Innoruuk!");
		quest::ding();
		quest::summonitem("55623"); # Dull Axe ID-55623
		quest::exp("100");
	}
	elsif (plugin::check_handin(\%itemcount, 59953 => 1, 19852 => 1)) { # Sharpened Axe ID-59953 - Giant Rattlesnake Skin ID-19852
		quest::say("You have proven your faith $name. Take this to vanquish any and all whom question the absolute power of Innoruuk!");
		quest::ding();
		quest::summonitem(19938); # Dismal Rage Battle Axe ID- 19938
		quest::exp("100");
	}
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:freporte -- Brutol_Rhaksen