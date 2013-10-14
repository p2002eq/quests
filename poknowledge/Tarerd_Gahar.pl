#Tarerd_Gahar.pl
#The Magic Pool



sub EVENT_SAY {
  if($text=~/pool/i) {
    quest::say("Oh Tatlan and Wicas sent you did they? I'll tell you what I told them, nothing is free. If you want to know about the pools then I need something [from you] first.");
  }
  if($text=~/from me/i) {
    quest::say("I'm sure it'll be easy for an adventurer as you. I am working on a potion, and I cannot currently travel to gather my last component. If you could bring me the blood of a Sarnak I'd be willing to share what I know.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 22519 => 1)) { #Sarnak Blood
    quest::say("Ahh this is exactly what I was looking for. All the information I've gathered from these pools has come from Myrist. Thiran will give you the book I used as a reference. Give him this note so he knows I sent you.");
    quest::summonitem(15958); #Note From Tarerd
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:poknowledge  ID:202060 -- Tarerd_Gahar