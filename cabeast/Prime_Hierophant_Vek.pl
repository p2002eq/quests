sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Praise to the ancients, my friend! There is much suffering to be given unto the world. I am the Prime Hierophant of the Temple of Terror.  Through me and my fellow priests flows the wisdom of our ancestors.");
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 18206 => 1)){ #guild summon
		quest::say("Welcome, young petitioner. You have been summoned to this temple to join with the Scaled Mystics. Ours is the way of pain and suffering. Here is the weapon of a petitioner. Through you the power of our ancestors shall flow. As your wisdom grows, so shall your power. Someday you may be a vessel for the supreme might of the ancients. Seek knowldege within this temple. The hierophants are here to guide you.");
		quest::summonitem(5140); #Iron Cudgel of the Petitioner
		quest::ding();
		quest::faction(282,100); #Scaled Mystics
		quest::faction(193,25); #Legion of Cabilis
		quest::exp(100);
	}
	elsif(plugin::check_handin(\%itemcount, 18462 => 1, 22917 => 1)){
		quest::emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
		quest::summonitem(7881);
		quest::exp(20000);
		quest::ding();
		quest::faction(317,20);
		quest::faction(193,10);
	}
	elsif(plugin::check_handin(\%itemcount, 18359 => 1, 22916 => 1)){
		quest::emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
		quest::summonitem(7881);
		quest::exp(20000);
		quest::ding();
		quest::faction(317,20);
		quest::faction(193,10);
	}
	elsif (plugin::check_handin(\%itemcount, 14790 =>1 )) {
		quest::emote("stares down at the note, confused, until he recognizes the writing and gasps in shock!");
		quest::say("You spoke to the Brothers? You, a simple Legionnaire? Well, no matter, you are here to test your virtue of sacrifice and we will take pleasure in it as we have for generations even before the Fallen Brothers. One of our greatest allies in pain is disease. In the woods outside our fair city is a small tribe of goblins. There is a certain goblin famed for his [unique weapon]. Take this knife and use it to cut this from the goblin. Then return his weapon, the knife, a sapphire, and an opal to me.");
		quest::summonitem(14784);
	}
	elsif (plugin::check_handin(\%itemcount, 14784 =>1, 14785 =>1, 10034 =>1, 10030 =>1 )) {
		quest::say("Well done");
		quest::ding();
		quest::summonitem(14786);
		quest::exp(10000);
	}
  plugin::return_items(\%itemcount);
}

#Submitted by Jim Mills, with thanks to BWStripes