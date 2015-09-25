function event_say(e)
	if (e.other:GetFaction(e.self) == 1) then --Must be ally
		if(e.message:findi("hail")) then
			e.self:Say("Greetings. You address Crusader Grendish, keeper of mindful discipline and the spiritual ties of our manifestations upon this world. I can sense as clear as the warmth of Ro's touch upon our scales that honor washes through the fabric of your being -- honor that has been displayed and proven countless times over in your loyalty to the Claws of Veeshan. But something obstructs purity in you -- your motives are clearer still. All of your kind that have come before us believe we to be as our brethren -- at ease with our stations and at a loss of judgment toward those whom have proven worthy of our recognition and knowledge. Know that the Crusaders do not regard you or your kind to be paralleled in existence unto us -- a regard that the recent, ignorant and disregarding [actions] of your kind has justly and firmly instated within us.");
		elseif(e.message:findi("actions")) then
			e.self:Say("Kerafyrm, the Sleeper, has been awoken. For centuries the Claws of Veeshan have maintained the prismatic threat's imprisonment, an act that was not achieved without much sacrifice and loss, but now all seems to have been destroyed and left as a struggle that ended in vain. The Sleeper is free and his power grows with every passing moment -- a threat that has descended upon the steel of second generation warriors. You have condemned yourself, as you have since the dawn of your creation, but your actions guided by shallow lusts for power and fame within your fledgling insignificance has spilled into the ancient world that cradles your very existence. It is you who have ushered us into being as we are now -- the apprentices we are no longer and as the [Crusaders of Veeshan] we stand before and shall either [command or disregard you].");
		elseif(e.message:findi("Crusaders of Veeshan")) then
			e.self:Say("When the warders were first charged with the duty of holding the captured Kerafyrm in enchanted stases, they were ordered by the elder council to mate with dragons whose elemental influence mirrored their own. From these unions would be born the apprentices, dragons whom would be dedicated from birth to the maintenance and imprisonment of the darkest threat to descend upon this entire plane of being. Inevitably, the council did not foresee the release of Kerafyrm by the actions of the second generation -- for it was their foolhardy nature to underestimate and ignore the true depths of your fallible existence. When the Sleeper took flight, the apprentices became the Crusaders out of necessity for the unforeseen present. Where our predecessors were of the passive duty to maintain Kerafyrm's imprisoned slumber, the Crusaders must be of aggressive natures to pursue and eliminate his threat once more. But what has been [unleashed] is far more than a prismatic dragon.");
		elseif(e.message:findi("unleashed")) then
			e.self:Say("In the era when Kerafyrm had begun to foreshadow the true face of malevolence and destruction that lurked within the seemingly fledgling dragon, the council commanded preparations for Kerafyrm's end. What the council did not know was that four amongst them had vowed their lives to Kerafyrm and would betray all of Veeshan's brood in the first envenomed strike of a civil war. Kerafyrm was eventually apprehended and the warders were successful in the execution of their spell, subduing the great beast that neither claw nor fang could slay. The four elders that had zealously pledged their allegiance to the abomination escaped our grasp and in the years that Kerafyrm slumbered, they remained an impression upon a legend that would never fade. With the council's attentions intent upon maintaining Kerafyrm in their custody and the conflict with Kael rising to the brink of a fiery war, the treacherous elders were not pursued, an inevitable decision that would have [dire consequences] of unfathomable magnitude.");
		elseif(e.message:findi("dire consequences")) then
			e.self:Say("We know that the [elders] whom had favored Kerafyrm in the conflict were somehow linked to their prismatic master. Their troops, consisting of younger and more impressionable dragons and several hordes of dragon kin, were significantly out numbered by the forces of the Claws of Veeshan, but yet they posed a near infallible opposition. Kerafyrm is indeed a power unto himself and the elders at his side were not forces to be underestimated by even our own council, but something was terribly unbalanced and unnatural within them. Never did Kerafyrm fight at the side of his elder allies and never were they seen in conjunction together. It is this truth that leads us to believe that Kerafyrm's mind, consciousness, and the essence of his power had been infused into those of the elders, for every army and every wave of their attacks were flawlessly choreographed as if the great prismatic dragon conducted each of their movements with his own.");	
		elseif(e.message:findi("elders")) then
			e.self:Say("The elders were powerful dragons upon the council and had fallen into the dangerous preaching of Kildrukaun, the black dragon who at that time held the title of Arch Priest to our great Wyrm Queen. Those that fell beneath Kildrukaun's influence were beings of immense power and their traitorous act inspired grave concern and an almost crippling bite to the moral of Velious' dragon nation. Tjudawos, the golden arch mage, whose knowledge of the mind are yet to be rivaled, was the first to fall beneath Kildrukaun's spell. Second was Zeixshi-Kar, the silver general who guided the Claws through the then fledgling campaign against the giants of Kael -- a fanatic loyalist to Kildrukaun since before Kerafyrm's birth, it was not surprising to see her allegiance shift, although the impact of her loss was nonetheless irreparable. The [final dragon] to side with Kildrukaun was perhaps the most devastating loss that was faced in this division.");
		elseif(e.message:findi("final dragon")) then
			e.self:Say("Vyskudra, the storm dragon and only child of Kildrukaun, seemed at first to deny separation from the council, but when the first battle of this civil war dawned, Vyskudra's allegiance became clear when her fatal bite stayed the claw of a council elder's strike against the engaged black dragon. The impact of her loss lied within the nature of her being, for the storm dragons will not exist in simultaneous population. It is unknown as to why this phenomenon exists unto this species alone, but it has caused her to become a relic unto herself. When Kerafyrm was apprehended and the elders were lost without trace, the council held a silent remorse in the thought of losing Vyskudra and her kind forever. The elders took flight from Velious when Kerafyrm was apprehended; an act that was executed beneath the direct order of Kerafyrm himself, for their devotion to him is stronger than even our most devout priest's reverence for Veeshan herself. But with his awakening, these creatures of mass destruction have [returned].");
		elseif(e.message:findi("returned")) then
			e.self:Say("The elders have gone beyond the reaches of mortality and they have ascended to the status of the Ancients -- beings of pure consciousness and power. The existence of four ancients upon the prime holds great concern for all of Norrath's beings, dragon kind and second generation alike, especially when one regards the malevolent natures that each of them have come to embody. Kildrukaun has always held a deep-seated hatred for the second generation and his three compeers are not without this same contempt. The nature of their agenda is unknown to us, and shall likely remain an impenetrable mystery until they are prepared to execute their plans, which undoubtedly shall revolve around their leader and his active return. We cannot allow this to happen -- we [cannot wait idly] by while the Ancients grow in strength and their hold upon the former tomb becomes unbreakable.");
		elseif(e.message:findi("idly by")) then
			e.self:Say("Your wish to uphold your pledge to the Claws of Veeshan and in doing so, return to us what favor we have graced upon you is a bold statement to not go without regard, but only your actions shall show the true extend and honor of your convictions. If you wish to aid the Crusaders of Veeshan, your motives holding neither meaning nor consideration among us, then you will tread a perilous path that shall not be easily walked. You must also accept that your actions for this era shall make no true impact, for even though we will charge you to confront the Ancients in battle their deaths are of no meaning. They are beings of pure consciousness and despite their corporeal forms that must adhere to the rules of the prime, these forms will be only temporarily vanquished until the time dawns that the Crusaders are able to [permanently bind them] to this world.");
		elseif(e.message:findi("permanently bind")) then
			e.self:Say("This is a process that we will not disclose, for the complexity and importance of it cannot possibly be comprehended by even your most wise priests or renowned scholars. All that you will know is that your efforts, should you bind yourself wholly and without compromise to this conviction, may be one of countless keys to secure the existence of all upon this world and ward the apocalyptic consequences that lurk upon a horizon of failure. The balance is delicate and we are unsure to which side the scales are tipped -- a shroud of blindness that we must break if we are to prevail. Time is not a luxury, but we do know that the [task] we will set before you and your kind will be one of great sacrifice and unpredictable results, but we have no choice but to depend upon the fates of chance to meet our efforts graciously should they deem it their will to favor us.");
		elseif(e.message:findi("set before me")) then
			e.self:Say("You and your kind must venture into the tomb that has become the Ancient's stronghold. If you and your kind are strong enough, you will find the locations of the Ancients themselves and engage them in battle. The destruction of their manifestations will yield a corporeal item that enabled them to affect and react upon the prime -- an item that is forged in chance upon the moment of their return to the primal world. However, these remnants are fragile and must be handled by those whose own attachment to the world is mirrored in the importance of that piece that binds them else the item shall become impure when bound to the essence of one whose essence is not compatible. Each of the Crusaders seeks to gain a specific remnant of the Ancients' forms and as the pieces require one of like spiritual structure to handle, the Crusaders have been likewise [divided] in their duties.");	
		elseif(e.message:findi("divided")) then
			e.self:Say("In the years that have passed in our training, we have adapted the foundational elements of the spiritual structures of this world. I have manifested within the fabric of my being the essence of mindful purity, tranquility and discipline in conjunction with the understanding and binding to the spiritual world that encases the prime. Those who follow paths of mirrored devotion will be crucial in returning to me the corporeal remnants of each Ancient -- specifically, their primal fangs. The fang is one of our most feared of weapons, but only if the wielder chooses it to be an instrument of battle for otherwise, it is a necessity to our existence for it is the part that allows us to imbibe sustenance. If you are one whose existence is pledged to [discipline of the mind and body] upon the prime or walk a path of the same accord that is paved through the realm of spirits, than you may extract these fangs from each of the four Ancients without destroying their purity.");
		elseif(e.message:findi("mind and body")) then
			e.self:Say("Then venture to the former tomb of Kerafyrm and seek the Ancients. If the fates find it within their will to grace you with victory, search for their primal fangs, but be warned -- the object that binds their power to the prime is one of chaotic choice and the fang may not reside within their remnants upon each of their destruction. Only when and if you have obtained the fang from each of the four Ancients and returned them all to me shall you have upheld your pledge and honored your convictions to us.");
		elseif(e.message:findi("disregard")) then
			e.self:Say("Your kind has forged a venomous claw of impenetrable darkness and destruction to threaten our very existence. It is you who have unleashed this horror upon the world and it shall be you who will [aid in its undoing], or be regarded as an already extinct species who has yet to realize the truth of their demise. The Crusaders of Veeshan are not as our brethren and do not regard you of the second generation as creatures to whom we shall impart our faith and trust. We speak to you now only because your existence has become more parallel to the meaning of ours in this new era. It is your hand that brought about this threat and ultimately, it shall be your hand that either stays it, or has led to the destruction of all upon this world. If you are to undo what you have blindly and ignorantly wrought upon us all, then you shall do so under the command of the Claws of Veeshan -- not beside as our allies. You shall choose your own path and we will react accordingly -- nothing less and nothing more.");
		elseif(e.message:findi("undoing")) then
			e.self:Say("This task will not be one of immediate reward, nor shall you see results of a tangible effect. The threat that we engage is one that cannot be extinguished through one success -- we must make strides, and those strides shall come slowly as we begin to fathom the true depths of the terror we face. Your duties unto us shall be only the first steps in preparation for this understanding, and you must accept that your actions will be of little repute when the whole scale is revealed and challenged. The Crusaders do all that we can, but for us to [enter the stronghold] of our nemeses would be futile and be a stride taken blindly into an endless pit from which we will never recover, thus is why we shall command you in the infancy of our struggle.");
		elseif(e.message:findi("stronghold")) then
			e.self:Say("You must not merely engage the enemy in battle for the sake of battle alone. We stand upon a battlefield not only of steel and evocation, but it is a plane of dire consideration, mindful tactics and reasoning and the understanding that we are dangerously outmatch with this shroud of ignorance over our eyes. To lift this veil, you must return the very essence of the coerced and constructed minions of Kerafyrm and his Ancients, but you must be sure that your own spiritual bindings to this realm are [mirrored] to that of the essence you wish to retrieve, else they shall become corrupt and their natures destroyed.");
		elseif(e.message:findi("mirrored")) then
			e.self:Say("All beings draw their power from the forces that surround the primal at a constant and balanced chaos. As these beings mature in power, their ties to these forces become strong and intertwined with the powers. Every adept of the second generation will be touched by only one of these forces wherein all of Veeshan's brood is exempt from such limitations, for we are beings whose existence far exceed the limited complexity of your own fragile being. Each of the Crusaders is bound to one of the primal elemental forces and in our passing years of learning, we have taken a path of an influential power to forge an unbreakable circle. I am a being of the tranquility that surrounds the unification of both mind and body and walk the path that crosses both the prime and spirit realms. If [you walk this path], then you shall aid me. However, if you are not of these roads, than seek one of the other Crusaders who have touched the same forces.");
		elseif(e.message:findi("path")) then
			e.self:Say("Venture into the stronghold of the Ancients and seek the Wyvern Fanatic. Once a soldier of the Claws of Veeshan dedicated to the preservation of the tomb, this powerful creature has become corrupted by the return of the Ancients. As this creature is one of mortal birth and is tied wholly to the prime, its heart resides as the core of its essence that has become corrupt and is now fuelled by Kerafyrm's own power, rather than the uncontrollable forces of chaos and influence. Return to me this creature's heart, but know that only the hands of one who walks the path that dictates discipline between mind and body or from the realm of natural spirits may handle this item without obstructing Kerafyrm's taint upon it. However, that single item will not be sufficient to fulfill this duty and you must acquire an [additional specimen] that holds the mark of Kerafyrm's will.'");	
		elseif(e.message:findi("additional specimen")) then
			e.self:Say("Dragon kin of mortal birth were appointed to the post of soldier within the tomb, but the warders knew that this would not be enough. Due to the raging front engaged with the giants of Kael, the warders created stone constructs and imparted unto them a small fiber of their essence. Along with many of the mortal born soldiers of the tomb, these stone constructs were corrupted by the Ancients but as these creatures are of pure arcane and mystical creation, their essence is more easily destroyed with their physical forms. The Crusaders of Veeshan command that in your willingness to aid the battle against this dark threat, that you engage the vigilant gargoyle custodians and when you are able to extract the Opalescent core of their being, return it with the wyvern's heart to me. Only then shall your efforts be considered by the Crusaders of Veeshan and the true extent of your devotion and loyalty to the Claws of Veeshan be recognized.");
		end
	else --Not Ally
		e.self:Say("I have nothing to speak about to the likes of you");
	end
end

function event_trade(e)
	local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 9335, item2 = 9337, item3 = 9336, item4 = 9338}, true)) then
		e.self:Say("What you have accomplished cannot be claimed without deception by many. Know that all sacrifices that you and those who have undoubtedly aided you have made in fulfilling this awesome feat shall not go without notice. The Crusaders of Veeshan can express neither the prominent magnitude nor the honor that you have upheld in maintaining your convictions to the Claws of Veeshan. This earring is not one forged of primal metals, but it is ever changing chromatic essence -- the very essence of the first chromatic nobles deposited by Veeshan's great claw. Take it not as a gift nor as restitution for your deeds, but take it as a token of acknowledgement and a symbol of the significance your actions have gained within the boundless realm of our crusade.");
		e.other:QuestReward(e.self, 0, 0, 0, 0, 30391, 150000); --Sarthis's Chromatic Hoop
		--Need faction adjustment
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 9299, item2 = 9302}, true)) then
		e.self:Say("You have done well " .. e.other:GetName() .." and Grendish of the Crusaders is pleased by your success and honorable actions that have bound you to this duty. The Crusaders of Veeshan recognize your efforts and we shall honor our word of just recognition to be delivered in effect of your deeds. These are the Slippers of the Ages, an ancient item forged by the scales of our chromatic elders of the first brood during the elder years of the Age of Scale. It shall serve you well and will act as the token of the Crusader's acknowledgement of your individual efforts to aid us.");
		e.other:QuestReward(e.self, 0, 0, 0, 0, 30396, 150000); --Chromatic Slippers of Ages
	end
	item_lib.return_items(event.self, event.other, event.trade);
end