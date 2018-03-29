#BeginFile nightmareb\#Terris_Thule.pl
#Quest file for Lair of Terris Thule - Terris Thule: Planar Progression

#Terris Thule will spawn 15 x a dream defiler at 75% health, cast Direption of Dreams at 50% health, and spawn 4 x a grotesque statue at 35% health. Upon death a Planar Projection will spawn to give flags. The timer is used to continuously check to make sure that she is not pulled from her lair. If so, she will shout a curse and despawn.

sub EVENT_SPAWN {
  quest::setnexthpevent(76);
  quest::settimer(1,5);
}

sub EVENT_HP {
  if($hpevent == 76) {
    quest::spawn2(221006,0,0,-1858,-25,134,10); #a dream defiler
    quest::spawn2(221006,0,0,-1780,-59,134,386); #a dream defiler
    quest::spawn2(221006,0,0,-1833,102,134,330); #a dream defiler
    quest::spawn2(221006,0,0,-1852,48,134,314); #a dream defiler
    quest::spawn2(221006,0,0,-1876,-63,134,456); #a dream defiler
    quest::spawn2(221006,0,0,-1933,49,134,312); #a dream defiler
    quest::spawn2(221006,0,0,-1984,-61,134,296); #a dream defiler
    quest::spawn2(221006,0,0,-1896,-108,134,460); #a dream defiler
    quest::spawn2(221006,0,0,-1899,-65,134,486); #a dream defiler
    quest::spawn2(221006,0,0,-1732,3,134,380); #a dream defiler
    quest::spawn2(221006,0,0,-1773,-39,134,374); #a dream defiler
    quest::spawn2(221006,0,0,-2005,85,134,198); #a dream defiler
    quest::spawn2(221006,0,0,-2031,-3,134,284); #a dream defiler
    quest::spawn2(221006,0,0,-1954,-29,134,142); #a dream defiler
    quest::spawn2(221006,0,0,-1887,33,134,226); #a dream defiler
    quest::setnexthpevent(51);
  }
  elsif($hpevent == 51) {
    $npc->SpellFinished(3150); #Direption of Dreams
    quest::setnexthpevent(36);
  }
  elsif($hpevent == 36) {
    quest::spawn2(221007,0,0,-1993,-102,134,478); #a grotesque statue
    quest::spawn2(221007,0,0,-1798,-102,134,402); #a grotesque statue
    quest::spawn2(221007,0,0,-1993,78,134,318); #a grotesque statue
    quest::spawn2(221007,0,0,-1798,78,134,382); #a grotesque statue
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::spawn2(202368,0,0,$x,$y,$z,$h); #A Planar Projection
  quest::stoptimer(1);
}

sub EVENT_TIMER {
  if(($x <= -2100) || ($y >= 230) || ($y <= -265) || ($x >= -1600)) {
    quest::shout("Never shall I be removed from nightmares!");
    quest::depop_withtimer();
  }
}

#EndFile: nightmareb\#Terris_Thule.pl (221008)
