sub EVENT_SAY { 
	if ($text=~/hail/i){
		quest::say("Greetings, child of Tunare. As druids of the Mother of all, we may only use blunt weapons and the scimitar, all other blades are forbidden. Prove your devotion by bringing me a [rusty short sword], a [rusty long sword], a [rusty broad sword], and a [rusty bastard sword]. I will destroy them and reward your faith.");
	}
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 18786 => 1)){ #Tattered Note
		quest::say("Welcome! We are the Soldiers of Tunare, the sworn protectors of Faydark. I thank you for joining our cause, we can always use the help. Here, put on this tunic, and let's get started.. you have much to learn.");
		quest::summonitem(13537); #Green and Tan Tunic
		quest::ding();
		quest::faction(304,10); #soldier of Tunare
		quest::faction(178,10); #King Tearis Thex
		quest::faction(99,10);  #Faydark's Champions
		quest::exp(100);
	}
	if(plugin::check_handin(\%itemcount, 5013 => 1, 5016 => 1, 5019 => 1, 5022 => 1)) {
		quest::say("You have done well, child! Take this as a blessing from Tunare for doing her will.");
		quest::summonitem(5047);
		quest::givecash("0,0,6,0");
		quest::exp(250);
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:gfaydark  ID:54083 -- Heartwood_Master 