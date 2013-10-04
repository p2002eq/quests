sub EVENT_SAY {
  if(($ulevel >= 46) && ($class=="Monk")) {
    if($text=~/hail/i) {
      # Monk Epic 1.0
      quest::say("Good day, citizen. Please remember to keep your voice down in our library. Feel free to browse the extensive collection of books we have on display. Learning is all about you. Our library is the greatest collection of educational literature in the world, as you can no doubt see. If you come across any [rare finds] we may be interested in purchasing them.");
    }
    elsif($text=~/rare finds/i) {
      # Monk Epic 1.0
      quest::say("Yes, any rare books, tomes, essays, or other literature you find may be of interest to me. Although the finds I am interested in are quite high profile and would most likely only be found in the possession of very powerful or influential beings. Give me what you find and I will pay you what it is worth to us.");
    }
    elsif($text=~/lheao/i) {
      # Monk Epic 1.0
      quest::say("Lheao was my predecessor here at the library of Erudin. He has since retired, just a few years ago. Im sure he would be most impressed with your find and other insightful conversation on the subject. Although Im not sure one of your profession would be interested in such a scholarly endeavor, no offense. If you are interested, find him and tell him you found the book Immortals. Im not sure where he has retired to, but I hear it is near an ocean somewhere.");
    }
  }
  else {
    if($text=~/hail/i) {
      quest::say("Good day, citizen. Please remember to keep your voice down in our library. Feel free to browse the extensive collection of books we have on display. Learning is all about you. Our library is the greatest collection of educational literature in the world, as you can no doubt see. Return to me again when you are an experienced monk.");
    }
  }
}

sub EVENT_ITEM {
  # Handin: Immortals (book)
  if((plugin::check_handin(\%itemcount, 18195 => 1)) && ($ulevel >= 46) && ($class=="Monk")) {
    # Monk Epic 1.0
    quest::emote("gasps at the sight of the rare book.");
    quest::say("This is a great find indeed! I can only imagine who you had to.. persuade to give you the book. Our library would be very interested in acquiring this and I am prepared to give you this referral that marks you as a friend of the library. If only [Lheao] could see this.");
    quest::summonitem(1682); #Danl's Reference
  }
  # Handin: Danl's Missing Book
  plugin::return_items(\%itemcount);
}
# End of File