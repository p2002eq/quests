sub EVENT_SAY {
   if ($text=~/hail/i) {
      if ($faction <= 7) {
         quest::say("So, you think you have what it takes to be a Scout of Tunare? Come back with two gold and two rusty daggers and I'll make it worth your while.");
      }
      else {
         quest::say("You dare to speak with a loyal member of the Scouts of Tunare?!! You are truly foolish!! Run away, while you still can.");
      }
   }
   elsif ($text=~/gem of tunare/i) {
      if ($faction <= 7) {
         quest::say("The bright green Gem of Tunare was discovered by the Scouts of Tunare in the trunk of a great tree. The lightning streaked down to split the tree in twain and there, inside, was the gem, Tunare's gift to the people of Kelethin. It has no magical properties, but it represents the glory of Tunare. It appears as a small emerald shard. Alas, now it has been stolen by Faldor Hendrys and only his brother [Elmion Hendrys] could know of his whereabouts.");
      }
      else {
         quest::say("You dare to speak with a loyal member of the Scouts of Tunare?!! You are truly foolish!! Run away, while you still can.");
      }
   }
   elsif ($text=~/elmion hendrys/i) {
      if ($faction <= 7) {
         quest::say("Seek out the Fier'Dal, Elmion. He was last heard telling the local bar patrons that he was off to do some adventuring at the lake near the estate. What that is, I do not know.");
      }
      else {
         quest::say("You dare to speak with a loyal member of the Scouts of Tunare?!! You are truly foolish!! Run away, while you still can.");
      }
   }
}

sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 18784 => 1)) { #Tattered Note
      quest::say("Hmm.. I hope you can prove yourself a lot more valuable than you look. Here, throw this on.. it'll help protect you a little. Let's get started on improving your skills.");
      quest::summonitem(13535); #Old Worn Gray Tunic*
      quest::ding();
      quest::faction(283,100); #Tunare's Scouts
      quest::exp(100);
   }
   elsif (($gold >= 2) && (plugin::check_handin(\%itemcount, 7007 => 1))) {
      quest::say("Well, well. I didn't think you could do it. Here's your cut and don't be surprised that it's not much because it's your first lesson. Remember. the smaller the operation. the bigger the share, and the richest rogues have the tightest lips.");
      quest::summonitem("7021");
      quest::givecash("0","5","0","0");
      quest::faction(283,5);
      quest::exp(100);
   }
   elsif (plugin::check_handin(\%itemcount,  13322=> 1)) {
      quest::say("Excellent job, $name, we will turn you into a rogue of Tunare yet.  Here this is for your trouble.");
      quest::summonitem(3315);
   }
   
   #do all other handins first with plugin, then let it do disciplines
   
   plugin::return_items(\%itemcount);
}

#END of FILE Zone:gfaydark  ID:54087 -- Tylfon