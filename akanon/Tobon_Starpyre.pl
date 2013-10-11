sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("It is good to see the young show an interest in the ways of magic. Its circles can be used in tandem with our unique ways of tinkering. Have you [joined the Eldritch Collective] or are you [merely curious]?");
  }
  if($text=~/joined the Eldritch Collective/i) {
    quest::say("Very good. Would you like to [go on a little mission] or are you busy studying?");
  }
  if($text=~/merely curious/i) {
    quest::say("Please look around. We have much knowledge within these halls. May you soon find your place among our members. Good day.");
  }
  if($text=~/go on a little mission/i) {
    quest::say("Fabulous! Here is a list of the observers outside of Ak'Anon. Go and ask each for a [spare telescope lens]. Each should give you one. We have need of them. I await your return as does your reward, either Fire Bolt or Fingers of Fire. Meant for a skilled wizard of the eighth trial.");
    quest::summonitem(18868);# Observer List
  }
  if($text=~/yendar/i) {
    quest::say("Oh, he is my older brother. Used to be the leader of the Eldritch Collective. Then he founded the Observers, a pretty good piece of work. Went off his rocker a long while back, though. Became obsessed with Innoruuk and the Teir'Dal. Stays away for days at a time, nobody knows where he has been. Mother still worries about him, asked me to keep an eye on him. But he is a grown gnome, and with his mastery of the art, has little to fear in this world or others. But if you are seeking him, I would look outside Ak'Anon, in the Steamfonts. That is where he makes his home these days.");
  }
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 18774 => 1)) { # Registration Letter
		quest::say("Ah.. Welcome, friend! I am Tobon Starpyre, Master Wizard of Library Mechanimagica. This is our tunic - wear it with pride. Study hard, master your skills, and make us proud.");
		quest::summonitem(13523); # Soot Stained Gold Robe*
		quest::ding();
		quest::faction(91,10); #Eldritch Collective
		quest::faction(71,-15); #Dark reflection
		quest::faction(322,-15); #The Dead	
		quest::faction(115,10); #Gem Choppers
		quest::faction(176,10); #King Ak'Anon
		quest::exp(100);
	}
	elsif(plugin::check_handin(\%itemcount, 13275 => 1, 13276 => 1, 13277 => 1, 13279 => 1)) {
		quest::say("Thank you for your work. I heard news of the troubles you encountered. Besides these troubles you still completed your mission. We are grateful. And as I once stated, your reward awaits.");
		quest::summonitem(quest::ChooseRandom(15380,15477,15656));
		quest::exp(500);
		quest::givecash(0,0,0,1);
	}
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:akanon  ID:55130 -- Tobon_Starpyre