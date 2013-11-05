sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Desist in your prattle.  If you want idle chitchat. talk to someone else."); 
	}
}

sub EVENT_ITEM { 
	if (plugin::check_handin(\%itemcount, 18017 => 1)) { # Fell Blade Guild Note
		quest::say("You are welcomed into the fold.  Now go out, and prove yourself, young one.  You have much to learn about the Dark Truth.");
		quest::summonitem(13573); # Blood Splattered Tunic
		quest::ding();
		quest::faction(143,10);  # Heretics
		quest::faction(79,-15);  # Deepwater Knights
		quest::faction(112,-15); # Gate Callers
		quest::faction(56,-15);  # Craftkeepers
		quest::faction(60,-15);  # Crimson Hands
		quest::exp(100);
	} 
	#do all other handins first with plugin, then let it do disciplines
	
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:paineel  ID:75111 -- Mandaril_Dark_Knife