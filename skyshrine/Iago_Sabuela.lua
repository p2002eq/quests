
function event_say(e)
    if (e.message:findi("hail")) then
        e.self:Say("Salutations dragon friend "..e.other:GetName()..". I am Iago Sabuela archeologist, enchanter, and proud member of the [Draconic Loyalist Fellowship]. Please make yourself comfortable and enjoy your visit to Skyshrine.");
    elseif (e.message:findi("Draconic Loyalist Fellowship")) then
        e.self:Say("The Draconic Loyalist Fellowship is people like myself of a non-draconic heritage that have pledged obedience to the dragons and dragon-kin of Skyshrine. We have proven that we can provide valuable services and resources to the dragons and dragon-kin that would otherwise be difficult or impossible for them to obtain. Among the occupations I pursue here in the Skyshrine is the acquisition of lost [draconic artifacts].");
    elseif (e.message:findi("What draconic artifacts?")) then
        e.self:Say("The dragons and their kin have an ancient and complex culture like any intelligent creature in Norrath. I have spent the majority of my years studying the ancient dragon civilizations of Norrath and recovering lost draconic artifacts. There are several artifacts I am currently searching for and could use the assistance of a capable group of adventurers. Are you interested in [hunting for lost artifacts]?");
    elseif (e.message:findi("hunting for lost artifacts")) then
        e.self:Say("Excellent. With the help of the texts provided me by the dragon-kin here in Skyshrine I have narrowed my search down to a few locations where I believe the artifacts I seek may be hiding. Before the artifacts may be recovered however you will need a special container in which to store them in. They are quite old and who knows what condition they may be in. I am missing some materials that are necessary for the insulation of the container thus it would be appreciated if you could provide me with a [crystalline silk mesh] and two [oily goo secretions] I will finish the construction of the artifact container and provide with the information I have obtained of the lost artifacts.");
    elseif (e.message:findi("What crystalline silk mesh")) then
        e.self:Say("An experienced tailor must craft the woven crystalline spider silk mesh in a tailoring kit out of four crystalline silks.");
    elseif (e.message:findi("What oily goo secretions")) then
        e.self:Say("Tar Goos can be found in the Geonid caves in the Wakening Lands. These Goos secrete a sticky, oily substance that makes for an excellent sealant and insulation.");
    elseif (e.message:findi("what platinum dragon scale")) then
        e.self:Say("There are tales among the dragon-kin of a platinum dragon scales marked with mystical runes in the ancient dragon script. Whether this scale was crafted from platinum ore, encased in platinum, or is actually from a lost species of dragon is unknown. The last written accounts mentioning the scale place it in the vicinity of the Cobalt Scar. It is my assumption that the magically adepts sirens of Sirens Grotto may now be in possession of the scale.");
    elseif (e.message:findi("what crystal dragon eye")) then
        e.self:Say("I have uncovered some texts here in the Skyshrine that speak of a crystal carved in the visage of a Dragons eye. The dragon sorcerer, Xervolithax, who was slain by enemies of the Dragons several centuries ago in the Great Divide, crafted this crystal dragon eye. As it was an artifact of some significant undisclosed magical power it believed to now be hidden somewhere in the Labyrinth of the Kromzek Sorcerer, Velketor.");
    elseif (e.message:findi("what golden dragon claw")) then
        e.self:Say("Draconic legends mention a hollow golden dragon claw artifact that would fit over one of the fore-claws of a dragon. This dragon-crafted jewelry was more than a simple adornment. The legends claim that the dragon that wore this claw had the ability to swiftly carve powerful runes into the surface of any object. These runes were apparently some form ancient spellcrafting art and it is said the dragon, Ulvaxazoviak, who for a time possessed the claw would carve runes of protection and power into his own scales. When Ulvaxazoviak's spirit finally fled this realm he was buried in the Dragon Necropolis, which is where I believe the golden dragon claw has rested to this day.");    
    end
end
