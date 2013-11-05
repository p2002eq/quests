sub EVENT_ITEM { 
  if(plugin::check_handin(\%itemcount, 18760 => 1)) {
    quest::say("Greetin's! We are the mighty Wolves o' the North, protectors o' Halas, and we must work hard t' keep it safe fer our citizens. Here is our tunic, it identifies ye as a proud warrior o' this great city. Let's get started with yer training, then, shall we?");
		quest::ding();
    quest::summonitem(13511);
    quest::faction(361,10); # Wolves of the North
		quest::faction(294,10); # Shamen of Justice
		quest::faction(213,10); # Merchants of Halas
		quest::faction(311,10); # Steel Warriors
		quest::exp(100);
  }
  #do all other handins first with plugin, then let it do disciplines
  
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:halas  ID:29057 -- Kylan_O`Danos