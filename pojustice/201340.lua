----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Zakis Var Sl`tad (201340)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("twitches his tail and glares at ".. e.other:GetName() .. " with an eye seemingly full of disdain, though surprisingly, you do not feel as if the emotion is directed solely at you. The look seems to be a constant upon this one's face -- a mask of torment, hate, and regret. In a barely audible hiss, the Iksar prisoner speaks, 'Perhaps you find amusement in the suffering of others? Very well, listen to the [" .. eq.say_link("tale") .. "]. It has been long since I have had the pleasure of seeing fear -- borne of my own acts -- blaze in the eyes of another.");
    elseif(e.message:findi("tale")) then
		e.self:Say("The tale I shall impart to you is one surrounding my presence here. It holds the elements that detail why the Tribunal found me beyond mortal judgment and took it upon themselves to handle my punishment. Some of us here are traitors to their people, while some are [" .. eq.say_link("You are a villain",false,"villains") .. "] so unimaginably cruel, callous, and wicked that not even their own malevolent deity could reave their spirit into their eternal domain.' The iksar gives a crooked grin, bearing a row of tiny, razor-sharp teeth in his almost frightful grimace, 'Guess which letter I bear upon my breast in this place.");
    elseif(e.message:findi("you are a villain")) then	
		e.self:Emote("gives a drawn, whispered hiss in acknowledgement, 'Very good, " .. e.other:GetName() .. ". You flatter me with such a statement. It is comforting to know that even disenchantment and a virtual death of the spirit my true nature is still true to the whole of its form. Yes, a villain I was and a villain I will eternally be. I do not know shame or regret for my acts, for they fulfilled my own needs in their performance. Tell me, Airamas, do you know the name '[" .. eq.say_link("I know the name Kurn",false,"Kurn") .. "]'?'");
    elseif(e.message:findi("I know the name kurn")) then	
		e.self:Say("Amateur,' the iksar abruptly hisses the word, his eyes lighting with a sense of self-pride that you formerly did not believe to exist in this place of woe. 'Indeed, Kurn was appointed by Venril Sathir himself, and he was my mentor, but he limited himself most greatly for he was a servant. I, though a pupil and subservient in demeanor to the imperial torturer, held a true allegiance to but one thing -- pain. I had discovered an ancient text in Sathir's own libraries dated back to the era of the Shissar's reign. The tome detailed the Shissar's early knowledge of anatomy, torture, and bio-experimentation. I was fascinated and stole the tome from the library. In secret, I studied the text and performed the same experiments that the Shissar performed in the early years of their developing culture. I found that I quickly began to surpass my mentor and when the production of his tower was complete, he became [" .. eq.say_link("suspicious") .. "] of my actions.'");
    elseif(e.message:findi("suspicious")) then	
		e.self:Say("I had failed to attend two meetings he arranged where he would continue to teach me his debased ways of pain. The first failure to concede to his demand of my presence resulted in my torture at his hands for the duration of a fortnight. The second, a mere three days after my release, was to be my death. He knew I had surpassed him and he hated me for it. He couldn't understand why one of his pupils had exceeded so far beyond his own capabilities as a master of the art of pain. Kurn sent a small group of his students and golem creations to the subterranean compound that was constructed not too far off from his tower as my own personal quarters. He never saw them again and it wouldn't be until the attentions of Sathir himself were piqued that they would they discover my true power.  [" .. eq.say_link("Golikath") .. "]");	--quest text gap here per ZAM.  Included saylink to continue
   elseif(e.message:findi("Golikath")) then
		e.self:Say("As I wandered the outskirts of the Dreadlands, not too far from where I had made my residency, I happened upon the remnants of a battle to have taken place between the forces of Karnor's and the forest giants. One of the soldiers, Golikath, I found to still be alive. I mended his wounds and nursed him back to health. He thought me a patriotic citizen and gave promise that I would be honored by the empire for what I had done. He was a captain who served one of Sathir's appointed generals. How like me he was in his station -- a servant of one of Sathir's many subjects. After ten days, he requested that I take him to the castle so that he might report back to his superiors. I responded to his request by forging from him my greatest creation of pain and mastery of the ancient Shissar art. The procedure took nearly five months to complete. He would be branded an abomination to those who would slay him but to me, he was a beloved masterpiece.");
		e.self:Say("Do you believe yourself with the stomach for me to [" .. eq.say_link("carry on") .. "]?");
   elseif(e.message:findi("carry on")) then
		e.self:Emote("gives another throaty, whispered hiss in amusement, 'How delightful you are, " .. e.other:GetName() .. " and how intrigued I am! It disappoints me so that I am helpless here, rent only to a creature of memory of my former greatness. In any case, where was I? Oh yes -- Golikath. I had re-arranged his biology so that he was a walking piece of art. I made him a superior being -- beyond the achievements of both Ik and the Shissarian empires. His legs were lengthened and inverted so that he might bound greater distances and run at speeds previously impossible of our ground-laden species. His tail brandished now a spear-like shard of bone. His teeth were elongated, sharpened, and hollowed so that the venomous glands that I implanted could be of true use. When he was complete, I had managed to preserve his will and inner-self so that in spirit, he was still the loyal soldier of Sathir.'");		
		e.self:Say("Unfortunately, he [" .. eq.say_link("how did he escape",false,"escaped") .. "] before I could proceed to study my new creation and tune as needed.");
   elseif(e.message:findi("escape")) then
		e.self:Say("My hamlet was attacked by a group of giants that discovered it by sheer chance and accident. Golikath's shackles were broken in the fray as my constructs and I attempted to ward the giants off. He escaped in the chaos. Furious, I took after him, abandoning my home and leaving it for the giants to consume as they had willed. Golikath would confront and defeat me in battle two days later. He was a powerful and perfect being and how proud of him I was then. Incapacitated, he drug me to Karnor's where he abandoned my near-death self. The soldiers of the castle took me in and began to restore my health. It was when a general of the castle, a servant of Sathir, recognized me as the villain to the Empire I had been branded that my [" .. eq.say_link("fate") .. "] would begin.");
   elseif(e.message:findi("fate")) then
		e.self:Say("I was brought before Sathir and though he told me in secret that he admired my work and was disappointed that I must be destroyed, he could hold no tolerance for those who defied him and the will of the empire. He would inform me that Golikath had been incinerated, as had the remnants of my residence, discovered with Golikath's aid. Kraven, one of Sathir's personal students and a master necromancer, was responsible for Golikath's destruction. I was then given a traitor's death -- one that would take several days of torture and then a combined release of fire and stone. Sathir had cursed my spirit so that it would arrive here, in a place of eternal judgment and suffering. Of course, this is merely a purgatory for I am condemned to be reaved from all of existence in due time.");
	end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end
