sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 18760 => 1)) {
		quest::say("Greetin's! We are the mighty Wolves o' the North, protectors o' Halas, and we must work hard t' keep it safe fer our citizens. Here is our tunic, it identifies ye as a proud warrior o' this great city. Let's get started with yer training, then, shall we?");
		quest::ding();
		quest::summonitem(13511);
		quest::faction(361,100); # Wolves of the North
		quest::faction(294,20); # Shamen of Justice
		quest::faction(213,25); # Merchants of Halas
		quest::faction(311,5); # Steel Warriors
		quest::exp(100);
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:halas  ID:29057 -- Kylan_O`Danos