# On death, spawns the Idol of Rallos Zek

sub EVENT_DEATH_COMPLETE {
  quest::shout("Protect the Idol of Zek!");
  quest::spawn2(113628,0,0,1289,1300,-90,254.5);
}

# Quest by mystic414

