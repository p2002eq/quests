# Enchanter epic weapon Staff of the Serpent lead-in quest
# added "of Kunark" to npc dialogue since the quest is six years old now
# Altered for Scryer's Trespass turnins -Kilelen


sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Good day, I have discovered something truly wonderful! If I only had the materials required so I can copy my notes and send them to my teacher.");
  }
  if ($text=~/discover/i) {
    quest::say("I was researching a new spell, and discovered new information concerning the history of the Serpent.");
  }
  if ($text=~/materials/i) {
    quest::say("The materials I need are a mechanical pen, ink of the dark, and white paper. Bring me those and I will give you a copy of this information.");
  }
  if ($text=~/teacher/i) {
    quest::say("My teacher is Jeb Lumsed. He was last seen in the regions of the newly discovered lands of Kunark. If you wish to find him that is where you must seek him out.");
  }
  if ($text=~/ink of the dark/i) {
    quest::say("Dark illusions, thievery, and the plague of the living will guide you. These are the only hints I can provide. Safe travels and may you be protected from all maladies.");
  }
  if ($text=~/mechanical pen/i) {
    quest::say("The answer you seek is in your question. If you are unable to figure it out, then perhaps you are not ready to travel along this path.");
  }
  if ($text=~/white paper/i) {
    quest::say("It may seem like ordinary paper at first. However, this paper was enchanted by a friend of mine. This paper was given to a lass in the Karanas to help with her writings. The paper will guide her hands and draw forth the thoughts in her mind. I no longer have any and I have not had contact with my friend in some time. Search them out.");
  }
}

sub EVENT_ITEM {
  # check for ink of the dark, mechanical pen and white paper
  if (plugin::check_handin(\%itemcount, 10600 => 1, 10601 => 1, 10602 => 1)) {
    quest::say("Yes, that is what I wanted. Here, take these notes. My teacher will be very interested if he is shown what I have found.");
    quest::exp(50000);
    quest::faction(342,30);
    quest::summonitem(10603);
  }
  plugin::return_items(\%itemcount);
}

# EOF Zone: erudnext ID: 24013 NPC: Stofo_Olan

