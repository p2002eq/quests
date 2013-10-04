sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("I am a Drill Master of the Legion of Cabilis.  I have no time for idle chitchat.  Be off if you were not summoned to this fortress!  Find that guild which was chosen for you as an egg.");
	}
	if ($text=~/militia pike/i) {
		quest::say("The pike is the prime weapon of Cabilis warriors. It can be upgraded, too, such as from the partisan pike to the militia pike and beyond. All these pikes may be slung on one's back when your hands are needed for other pursuits. To upgrade a pike is something that is learned, but it can never be performed without a [geozite tool]. Do you [desire to upgrade the partisan pike]?");
	}
	if ($text=~/upgrade the partisan pike/i) {
		quest::say("It seems as though a traitor is among our people. Someone has smuggled shackle keys to the slaves. The froglok slaves have been escaping into the swamplands and there we can hear the whistle of their contact who escorts them to freedom. We must put a stop to this! I desire three things. Your partisan pike, the head of the Iksar traitor and the whistle of the escort. Bring these to me and I shall give you the militia pike.");
	}
	if ($text=~/what geozite tool/i) {
		quest::say("The Geozite Tool is used to sharpen the pikes of the Legion of Cabilis. Only it can produce the serrated edges necessary for these deadly weapons. They are not handed out to just any broodling. The tool is only given to warriors who serve the legion. Do you [want a geozite tool]?");
	}
	if ($text=~/want a geozite tool/i) {
		quest::say("Then take this satchel and go to the outer walls of Cabilis and seek out large scorpions. When you can fill and combine the satchel with scorpion pincers, then you shall prove to me that you are truly a warrior and I shall send you off on your true test.");
		quest::summonitem(17993);
	}
	if ($text=~/true warrior of the legion/i) {
		quest::say("If you are you will have proof; else you will have the wrath of the Legion upon you for such a claim.");
	}
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 18203 => 1)){ #Guild Summons
		quest::say("I see they have begun to draft younger broodlings? Hmmph!! No matter. We Drill Masters shall make a warrior of you. Here is your partisan's pike and some coin as your wages. Be sure that you begin your training in blacksmithing and report to the other Drill Masters for any tasks they may have for you. Let them know you are [a partisan of Cabilis]. Perhaps soon you shall be rewarded the [militia pike].");
		quest::summonitem(5130); #Partisan's Pike
		quest::ding();
		quest::faction(193,10); #Legion of Cabilis
		quest::faction(30,10); #Cabilis Residents
		quest::faction(282,10); #Scaled Mystics
		quest::faction(62,10);	#Crusader of Greenmist
		quest::faction(317,10); #Swift Tails
		quest::exp(100);
	}
	elsif (plugin::check_handin(\%itemcount, 12675 =>1, 12677=>1, 5130=>1 )) {
		quest::say("You have perfomed just as expected. I bestow upon you the rank of militiaman. Here is your new pike. Past this, you shall require the [geozite tool] to upgrade your future pikes and mancatchers. We see much promise in you, militiaman. Go forth to serve the realm.");
		quest::summonitem(5131);
		quest::exp(200);
		quest::faction( 30,2);
		quest::faction( 193,2);
		quest::faction( 282,2);
		quest::faction( 317,2);
		quest::faction( 62,2);
	}
	elsif (plugin::check_handin(\%itemcount, 12658 =>1 )) {
		quest::say("You are a true warrior of Cabilis. You obviously are aware that in order to upgrade your pike you shall need a [geozite tool]. Take this note to the Lord of the outer gates. He desires a young warrior for a small task. Do this and he is instructed to reward you with the tool.");
		quest::exp(200);
		quest::faction( 30,2);
		quest::faction( 193,2);
		quest::faction( 282,2);
		quest::faction( 317,2);
		quest::faction( 62,2);
		quest::givecash(10,0,1,0);
		quest::summonitem(quest::ChooseRandom(18213,18211,18210));
	}
	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	plugin::return_items(\%itemcount);
}
