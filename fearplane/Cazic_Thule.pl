# Call Dread, Fright & Terror to aid Cazic Thule if they're still alive
# code by mystic414
#
# Cazic Thule also administers the Whistling Fists quest for iksar monks

sub EVENT_SPAWN {
  quest::settimer("Shout",600);
}

sub EVENT_SAY {
 if($text=~/gandan has failed in his task/i) {
  quest::emote("'s thoughts begin to pervade your own, they creep into your mind with great force. You feel pressure as if your head will explode. You see his thoughts becoming your own. You see in these visions a tome bound in flesh dropped to the ground. You then open your eyes to see that same book, and take it knowing that it was meant for you.");
  quest::summonitem(18898);
 }
}

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 8226 => 1, 18898 => 1, 18899 => 1)){
  quest::emote("seems pleased with the amount of pain that you have been able to inflict. Cazic Thule then grabs your hands and begins to infuse them with his power. Your hands burn like they were placed in lava for a moment, then feel cool as ice. You can feel the sheer power flowing through your new weapons of pain.");
  quest::summonitem(7836);
  quest::exp(100000);
  quest::ding();
 }
 plugin::return_items(\%itemcount);
}

sub EVENT_AGGRO {
  quest::shout("Denizens of Fear, your master commands you to come forth to his aid!!");
  quest::signalwith(72000,1,0);
  quest::signalwith(72004,1,0);
  quest::signalwith(72002,1,0);
  my $dread_mob = $entity_list->GetMobByNpcTypeID(72000);
  my $fright_mob = $entity_list->GetMobByNpcTypeID(72004);
  my $terror_mob = $entity_list->GetMobByNpcTypeID(72002);
  if ($dread_mob) {
    my $dread_mobnpc = $dread_mob->CastToNPC();
    $dread_mobnpc->AddToHateList($client, 1);
  }
  if ($fright_mob) {
    my $fright_mobnpc = $fright_mob->CastToNPC();
    $fright_mobnpc->AddToHateList($client, 1);
  }
  if ($terror_mob) {
    my $terror_mobnpc = $terror_mob->CastToNPC();
    $terror_mobnpc->AddToHateList($client, 1);
  }
}

sub EVENT_TIMER {
 if ($timer eq "Shout") {
  quest::shout("Beware all infidels who dare to taint my plane, for I shall rend your minds with fright, dread, and terror!");
  quest::signalwith(72000,0,0);
  quest::signalwith(72002,0,0);
  quest::signalwith(72004,0,0);
  quest::signalwith(72012,0,0);
  quest::signalwith(72015,0,0);
  quest::signalwith(72198,0,0);
  quest::signalwith(72022,0,0);
  quest::signalwith(72029,0,0);
  quest::signalwith(72031,0,0);
  quest::signalwith(72036,0,0);
  quest::signalwith(72052,0,0);
  quest::signalwith(72055,0,0);
  quest::signalwith(72058,0,0);
  quest::signalwith(72061,0,0);
  quest::signalwith(72065,0,0);
  quest::signalwith(72067,0,0);
  quest::signalwith(72076,0,0);
  quest::signalwith(72081,0,0);
  quest::signalwith(72094,0,0);
  quest::signalwith(72103,0,0);
 }
}

#(Aggro) Created by Mystic414, (Say, Item, Spawn and Timer) Additions by Jim Mills