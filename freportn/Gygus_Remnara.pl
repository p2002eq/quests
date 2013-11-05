sub EVENT_SAY {
  if ($text=~/Hail/i){
    quest::say("The Temple of Marr welcomes you. I am Gygus Remnara. High Sentinel for the Sentries of Passion. We are the order of paladins within the Priests of Marr and whose charge it is to protect the holy Temple of Marr.");
  }
}
sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 18738 => 1)){ #A tattered note
		quest::say("Welcome to the Sentries of Passion. We are the protectors of the Temple of Marr. Wear our tunic with pride, young knight! Find your wisdom within these walls and in the words of our priests. And remember to aid all who follow the twin deities, Mithaniel and Erollisi Marr.");
		quest::summonitem(13556); #White and Blue Tunic
		quest::ding();
		quest::faction(258,10); #Priests of Marr
		quest::faction(105,-15); #The Freeport Militia
		quest::faction(184,10); #Knight of Truth
		quest::exp(100);
	}
	#do all other handins first with plugin, then let it do disciplines
	
	plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportn  ID:8028 -- Gygus_Remnara