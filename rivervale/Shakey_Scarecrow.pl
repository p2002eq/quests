sub EVENT_SAY {
if($text=~/hail/i){
  quest::emote("Shakey Scarecrow rustles and looks up at you in acknowledgment.");
  quest::signalwith(19052,0,0);
  }
}
sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount,14321=> 1)){
  quest::summonitem(quest::ChooseRandom(13980,13980,14031));
}
plugin::return_items(\%itemcount);
 }
