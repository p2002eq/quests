sub EVENT_SAY {
  if ($text=~/mechanical pen/i) {
    quest::say("Why do you want one of those contraptions. You will spend more time repairing it then you will writing with it. But if you insist on getting one, you are going to have to do a small favor.");
    quest::emote("tugs at your robe and grins evilly. 'Mighty nice outfit you have there. Sure beats these drab robes us three are wearing. Hmm...my favorite color is purple, in fact a shiny metallic purple would do nicely. How bad did you want that pen?'");
  }
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 18703 => 1)) {  # Old Folded Letter
	quest::ding();
    quest::summonitem(13524); # Dark Gold Felt Robe*
	quest::faction(71,10); #Dark reflection
	quest::faction(91,-15); #eldritch collective
	quest::faction(115,-15); #gem choppers
	quest::faction(76,-15); #Deepmuses
    quest::exp(100);
  }
  if (plugin::check_handin(\%itemcount, 1360 => 1)) {
    quest::say("Very nice!! It is perfect! Here take this pen. Have fun with it.");
    quest::exp(50000);
    quest::summonitem(10600);
  }
  plugin::return_items(\%itemcount);
}

# EOF Zone: akanon ID: 55121 NPC: Rilgor_Plegnog