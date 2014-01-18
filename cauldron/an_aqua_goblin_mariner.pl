#Bilge Farfathom spawn
#npc - an_aqua_goblin_mariner (trigger for #Bilge_Farfathom 70059)
#zone - Dagnors Cauldron

sub EVENT_DEATH_COMPLETE{
 my $random_result = int(rand(100));
 #these are not PEQ IDs
 my $a=70059; #Bilge
 my $b=70061; #npc - #aqua_goblin_shaman
 if($random_result<99){
  quest::spawn2($b,6,0,-974.5,436.4,-343.8,29);
  #quest::say("spawn shaman");
  }else{
    #quest::say("Spawning Bilge Farfathom");
    quest::spawn2($a,4,0,-1123.30,-1194.57,-98.32,122);
  };
 };
