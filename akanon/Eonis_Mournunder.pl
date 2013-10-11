sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 18771 => 1)) { # Stained Letter
		quest::say("Hmmm.. As you wish, we will train you in our dark ways, but, now this, our art carries a high price, and there is no turning back for you now.");
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