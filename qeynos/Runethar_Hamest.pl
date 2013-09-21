sub EVENT_SIGNAL {
	quest::say("Hire one soon, Wolten. We need to get in touch with Drosco!");
}

sub EVENT_SAY { 
	if ($text=~/hail/i){
		quest::say("Welcome to the Temple of Thunder. We are home to paladins and clerics who follow the ways of Karana. Do you [need guidance] or are you [already a follower of Karana]?"); 
	}
	if ($text=~/need guidance/i){
		quest::say("Then go forth into the church and speak with Gehna Solbenya. She will assist you."); 
	}
	if ($text=~/follower of karana/i){
		quest::say("So you are one with our cause? This is good. Be aware that there are forces at work which not even the Qeynos Guard can keep at bay. We are here to spread the words of Karana and smite those who should try to end His children. We and Antonius Bayle shall work together in our destruction of evil. He requests our aid. Do you also [wish to assist Lord Bayle]?"); 
	}
	if ($text=~/wish to assist/i){
		quest::say("Then we command you to assist the Qeynos Guard with the destruction of Blackburrow. Report to Captain Tillin of Qeynos Guard and speak with him of the [gnolls of Blackburrow]. I believe he is at the arena. My loyal friend, if you have earned your Thunder Staff, I urge you to [retrieve the Bayle list]."); 
	}
	if ($text=~/will retrieve/i){
		quest::say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us. But this matter is of vital importance to us and we need more proof of your devotion to our cause"); 
	}
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 18710 => 1)) { #Tattered Note
		quest::say("Greetings, fellow knight of Karana, and welcome to the Temple of Thunder! Here, wear this tunic and help our crusade. Wolten Grafe is my assistant, he will get you started and teach you the ways of the Rainkeeper.");
		quest::summonitem(13505); #Old Gray Tunic*
		quest::ding();
		quest::faction(183,10); #Knight of Thunder
		quest::faction(21,-15); #Bloodsabers
		quest::faction(257,10); #Priest of Life
		quest::faction(135,10); #Guards of Qeynos
		quest::exp(100);
	} else {
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
	}
	plugin::return_items(\%itemcount);
}


#END of FILE Zone:qeynos  ID:1136 -- Runethar_Hamest 

