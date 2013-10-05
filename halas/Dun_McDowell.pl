sub EVENT_ITEM { 
	if (plugin::check_handin(\%itemcount, 18762 => 1)) {
		quest::say("Ah.. ye wish to be a member o' the White Rose, then. eh? Well, let's train ye fer a bit. and see if ye've got what it takes.");
		quest::ding();
		quest::summonitem(13513); # torn white tunic
		quest::faction(275,5); # Rogues of the White Rose
		quest::exp(100);
	} 
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
	plugin::return_items(\%itemcount);
}


#END of FILE Zone:halas  ID:29069 -- Dun_McDowell 

