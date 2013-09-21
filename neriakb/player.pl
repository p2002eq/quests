#There's a gate in the Neriak Commons that is actually three separate doors, but the gates should all lift together as one. This CLICKDOOR script accomplishes that.

sub EVENT_CLICKDOOR {
  if($doorid == 1) {
    quest::forcedooropen(2);
    quest::forcedooropen(49);
  }
  if($doorid == 2) {
    quest::forcedooropen(1);
    quest::forcedooropen(49);
  }
  if($doorid == 49) {
    quest::forcedooropen(1);
    quest::forcedooropen(2);
  }
}

#Submitted by Jim Mills