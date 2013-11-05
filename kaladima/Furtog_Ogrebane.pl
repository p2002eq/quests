sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Hail. mighty $name! Welcome to Stormguard Hall. I am Captain Furtog Ogrebane. only surviving descendant of the legendary Trondle Ogrebane. slayer of the [Mudtoes]. If you wish to serve the grand city of Kaladim. I urge you to speak with any of the trainers. Good day.");
	}
	if($text=~/mudtoes/i){
		quest::say("The Mudtoes were a small but mighty clan of ogres. My great father [Trondle] destroyed them. I have heard disturbing rumors of one Mudtoe surviving. Would you mind [searching for the Mudtoes] or have you other duties to perform?");
	}
	if($text=~/trondle/i){
		quest::say("Trondle was my great father and slayer of the Mudtoes. He was killed by those vile Crushbone orcs. If you truly wish to help Kaladim remain safe. speak with trainer Canloe Nusback. Say that you are ready to serve Kaladim.");
	}
	if($text=~/searching for the mudtoes/i){
		quest::say("I have heard persistent rumors of two Mudtoe ogres who survived the slaughter.  Go to the port of Butcherblock.  Those dock hands must have heard of the name [Mudtoe].  Bring me the remaining heads of the Mudtoes!!  I want all the Mudtoes dead!!  Do not return until you have them both!!");
	}
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 18766 => 1)){ # Recruitment Letter
		quest::say("Greetings, friend, and welcome to Stormguard Hall! I am Furtog Ogrebane, Captain of the Guard. We shall train you to be a fearless warrior, who will serve and protect King Kazon well. Here is your tunic.  Now, let's begin your training.");
		quest::summonitem(13515); # Dirt Stained Tunic*
		quest::ding();
		quest::faction(314,10); # Storm Guard
		quest::faction(169,10); # Kazon Stormhammer
		quest::faction(219,10); # Miners Guild 249
		quest::faction(215,10); # Merchants of Kaladim
		quest::faction(57,-15); # Craknek Warriors
		quest::exp(100);
	}
   elsif (plugin::check_handin(\%itemcount, 13316 => 1, 13317 => 1)) { # Ogre Heads
      quest::say("Finally my great father's work has been completed. All the Mudtoe ogres have been exterminated. Thank you. Take this weapon which my father pried from the cold, dead hands of the Mudtoe ogre captain. It is called an ogre war maul. May you wield it with honor in the name of Kaladim.");
      quest::faction(314, 25); # Storm Guard
      quest::faction(169, 25); # Kazon Stormhammer
      quest::faction(219, 25); # Miners Guild 249
      quest::faction(215, 25); # Merchants of Kaladim
      quest::faction(57, -25); # Craknek Warriors
      quest::exp(250);
      quest::givecash(0, 3, 7, 1);
      quest::summonitem(6302); # Ogre War Maul
   }
	#do all other handins first with plugin, then let it do disciplines
	
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:kaladima  ID:60008 -- Furtog_Ogrebane