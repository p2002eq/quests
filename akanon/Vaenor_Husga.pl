sub EVENT_ITEM { 
  if(plugin::check_handin(\%itemcount, 18702 => 1)) {
    quest::ding();
    quest::summonitem(13524); # Dark Gold Felt Robe*
    quest::faction(71,10); #Dark reflection
    quest::faction(91,-15); #eldritch collective
    quest::faction(115,-15); #gem choppers
    quest::faction(76,-15); #Deepmuses
    quest::exp(100);
  }
  plugin::return_items(\%itemcount);
}
