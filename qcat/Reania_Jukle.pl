sub EVENT_SAY {
  if ($text=~/what is the ink of the dark/i) {
		quest::say("Ink of the Dark, you say? That isn't an everyday item, you know. In fact, I can't remember the last time someone requested it. I have given up keeping any here with me. You are going to need to find your own supply now. Sorry.");
	}
	if($text=~/where can i find the ink of the dark/i) {
      quest::say("The ink is the blood of a dark scribe. Tempt him and give him this vial. He should cooperate.");
      quest::summonitem(10626);
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 18851 => 1)) { #Blood Stained Note
		quest::summonitem(13596); #Dirty Purple Robe*
		quest::ding();
		quest::faction(21,100); #Bloodsabers
		quest::faction(135,-15); #Guards of Qeynos
		quest::faction(235,10); #Opal Dark Briar
		quest::faction(257,-25); #Priest of Life
		quest::faction(53,5); #Corrupt Qeynos Guards
		quest::exp(100);
	}
	plugin::return_items(\%itemcount);
}

# EOF Zone: qcat ID: 45082 NPC: Reania_Jukle