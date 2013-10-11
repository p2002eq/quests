sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Well met, friend. May I be of assistance?");
	}
	if(($text=~/application/i) && ($qglobals{Shar_Vahl_Cit} == 1)){
		quest::say("Luckily for you someone found it.");
		quest::summonitem(2873);
	}
	if(($text=~/cloak/i) && ($qglobals{Shar_Vahl_Cit} == 7)){
		quest::say("Someone found a rockhopper chewing on this in the pit. Try not to lose it this time.");
		quest::summonitem(2878);
	}
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18554 => 1)) { #Taruun Guild Summons
		quest::say("Good $name, I am pleased to see you. You have come of age and it is time for you to register for citzenship. Your invitation indicates that the Taruun, hunters and providers of Shar Vahl, have noticed you and consider your potential to be worthy of our training. First, take this application to the Registrar Bindarah and return to me with proof of citzenship.");
		quest::say("I know that you may be nervous right now... after all, this should be very exciting first step for you. If you happen to get lost while looking for the registrar, just ask one of the other citizens or guards for directions. They will most likely know where to find the place or person that you are looking for.");
    quest::summonitem(2873); #Application for Citizenship
		quest::setglobal("Shar_Vahl_Cit",1,5,"F");
		quest::ding();
		quest::exp(100);
  }
  elsif (plugin::check_handin(\%itemcount, 29828 => 1)) { #Shadowscream Steel Boots
    quest::say("So you're Barkhem's newest student are you? I may not have taken your word for it, but craftsmanship this fine could only be from a student of our Master Smith. Take this and fill it with Shadowscream steel boots. I need 6 pairs to outfit some of my hunters. When you've finished, return the box to me.");
    quest::summonitem(17499); #Boot Case
  }
  elsif (plugin::check_handin(\%itemcount, 29825 => 1)) { #Shadowscream Boot Case
    quest::emote("inspects the boots for a moment and looks you square in the eyes. 'This is excellent work, $name, you do not disappoint! Would that you could outfit all of my hunters with these boots, but I must not keep your talents all to myself. Take some change for your troubles and this seal back to Barkhem - let him know that I am very impressed with his new protege.'");
    quest::faction(132,10); #Guardians of Shar Vahl
    quest::exp(500);
    quest::summonitem(29826); #Rakutah's Seal
  }
  elsif(plugin::check_handin(\%itemcount, 2897 => 1)){ #Notorized Application
    quest::say("Allow me to be the first to welcome you. Accept this cloak, young initiate. It is a symbol of your loyalty to our noble people. May it serve you as you serve us all. Present your acrylia slate to Harbin Gernawl and he will give you instruction. May the spirits of the beasts guide you and keep you safe.'");
    quest::summonitem(2878); #Initiate's Cloak of Shar Vahl
		quest::setglobal("Shar_Vahl_Cit",7,5,"F");
		quest::ding();
		quest::exp(100);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:sharvahl  ID:155169 -- Master_Taruun_Rakutah