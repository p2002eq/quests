sub EVENT_SAY { 
  if($text=~/hail/i){
    quest::say("Greetings, $name . Welcome to the home of the Keepers of the Art. I am in need of spell components. Would you be willing to [fetch] some for me?");
  }
  if($text=~/fetch/i){
    quest::say("What I need are some bat wings for a spell I am researching. If you bring me back four bat wings, I would be willing to reward you with a scroll.");
  }
}

sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount,13068=>4)) {
    quest::say("Ah yes.  These are exactly what I need.  Thank you very much.");
    quest::summonitem(quest::ChooseRandom(15310,15332));
    quest::faction(170,5);
    quest::faction(178,5);
    quest::faction(99,5);
    quest::faction(322,-10);
    quest::ding();
    quest::exp(350);
  }
  elsif (plugin::check_handin(\%itemcount,18777=> 1)) { # Enrollment Letter
    quest::say("Welcome. I am Niola Impholder. Master Magician of the Keepers of the Art. Here is our guild tunic. You have much to learn, so let's get started.");
    quest::summonitem(13592); # Faded Training Robe*
		quest::ding();
		quest::faction(170,10); # Keepers of the Art
		quest::faction(178,10); # King Tearis Thex
		quest::faction(99,10); # Faydark's Champions
		quest::faction(322,-15); # The Dead		
    quest::exp(100);
  }
  elsif (plugin::check_handin(\%itemcount,18902=> 1)) {
    quest::say("She is still alive? OH, thank you for this news.");
    quest::summonitem(1307);
    quest::exp(30000);
    quest::ding();
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:felwitheb  ID:62021 -- Niola_Impholder 

