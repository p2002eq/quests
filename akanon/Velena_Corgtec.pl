sub EVENT_ITEM { 
	if (plugin::check_handin(\%itemcount, 18704 => 1)) { #Old Folded Letter
		quest::summonitem(13524); # Dark Gold Felt Robe*
		quest::ding();
		quest::faction(71,10); #Dark Reflection
		quest::faction(91,-15); #Eldritch Collective
		quest::faction(115,-15); #Gem Choppers
		quest::faction(76,-15); #Deepmuses
		quest::exp(100);
	}
  plugin::return_items(\%itemcount);
}
