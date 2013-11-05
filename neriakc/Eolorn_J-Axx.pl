sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("It is good to see new blood in our halls. I am the leader of this house. If you are looking for guidance, seek out the masters within. I rarely appoint tasks to new recruits, unless I need to retrieve the [foreign take].");
  }
  if($text=~/foreign take/i) {
    quest::say("We have rogues operating in a few great cities. We send young rogues to retrieve the monthly take. We have been awaiting the Freeport delivery. The last youth I sent must have been killed along the way. I will need a new runner to [retrieve the chest].");
  }
  if($text=~/retrieve the chest/i) {
    quest::say("You seem able enough. Here. Take this note to Freeport. Go through the Commonlands and be careful not to encounter any Freeport guards. There is a network of aqueducts accessible through hidden passages. Search the outside walls of Freeport. Take the note to Giz. She will meet you at night, on an island in the harbor. Good luck.");
    quest::summonitem(18844);
  }
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 18752 => 1)) { #tattered note
		quest::say("You wanna be part of the Ebon Mask, huh? Well, you'll need to impress me. Here's your guild tunic. Go find Hekzin, he'll have some work for you, I'm sure. Don't screw up, kid.  That pretty face of yours would make a fine trophy, got it? Now, quit breathin' my air, and go get some work done.");
		quest::ding();
		quest::summonitem(13581); #Old Black Tunic*
		quest::faction(90,10); #Ebon Mask
		quest::faction(135,-15); #Guard of Qeynos
		quest::faction(361,-15); #Wolves of the North
		quest::faction(133,-15); #Guardians of the Vale
		quest::faction(31,-15); #Carson McCabe
		quest::exp(100);
	}
	#do all other handins first with plugin, then let it do disciplines
	
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:neriakc  ID:42074 -- Eolorn_J`Axx