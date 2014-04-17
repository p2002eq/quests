sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 18847 =>1)) {     # Tattered note
		quest::say("Welcome $name! The blood of our brothers the wolves run strong through your veins. You must learn to control your spiritual link with our canine brothers. Wear this tunic so that others may recognize you as a Field Priest of the Tribunal, the claws and fangs of justice! Talk to my friend Hoyce and he can get you started.");
		quest::ding();
		quest::faction(294, 15);   # Shamen of Justice
		quest::faction(213, 2);   # Merchants of Halas
		quest::faction(33, -2);   # Circle Of Unseen Hands
		quest::faction(48, -2); 	# Coalition of Tradefolk Underground
		quest::faction(90, -3); 	# Ebon Mask
		quest::summonitem(13574);   # Soiled Gray Tunic
		quest::exp(100);        	# Give exp for turning in quest
	}
	plugin::return_items(\%itemcount);
}
