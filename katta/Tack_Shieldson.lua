---- Quest:Beer for the Guards
function event_signal(e)
    if(e.signal == 1) then
        e.self:Say("Oi there, friend!");
    elseif(e.signal == 2) then
        e.self:Say("Yar, Rowle. So whadda ye say, friend? We stand around drinkin' water on duty all day, and that ain't no life fer a dwarf. Now we bin hearin' bout all these new ales and suchnot comin' up from Norrath. Ye think ye might be so kind as to [share a pint] and raise our spirits?");
    elseif(e.signal == 3) then
        e.self:MoveTo(-1559.2,-234.9,-266.7);
        e.self:DoAnim(1);
        e.self:Say("'Shhhhhh!!' He runs over and kicks Rowle in the kneecap and chuckles under his beard in your direction. Speaking under his breath to Rowle, 'Don' be such an idjit, now this lad came all the way from Norrath, why not try some of the fabled ales we'd heard our pappy's talkin' of?'");
        eq.signal(160207,1,1);
    elseif(e.signal == 4) then
        e.self:Say("Ahhh, worthy o' Brell hisself or so they say. Ye know when I was just a pup, back before the exodus, me uncle used te talk about stompin' trolls and then sitting back with a  Boot Beer te celebrate the day's victory. I, ummm, really would be able te get in touch with me heritage were I able to sample some o' that fine stout. Ye'd be a true friend to the Validus Custodus fer helpin' us out friend. My thanks to ye in advance.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19967})) then -- Underfoot Brown
        e.self:Say("gingerly takes the boot from you, handling it as though it were a fine porcelain. With a look of thanks to you he slowly lifts it to his lips and suddenly tips it back to empty it in one gulp, frothing his beard in the process. 'Yar! That's the ticket! Damn fine stuff that is, just like me uncle always said. A service to the Validus Custodus have ye done, my friend... And I'd be happy to assist ye in that service again sometime. HAR!'");
        e.other:Faction(168,5); -- Katta Castellum Citizens
        e.other:Faction(350,5); -- Validus Custodus
        e.other:Faction(206,5); -- Magus Conlegium
        e.other:Faction(228,-5); -- Nathyn Illuminious
        e.other:Faction(55,-5); -- Coterie of the Eternal Night
        e.other:Faction(139,-5); -- Hand of Seru
        e.other:Faction(284,-5); -- Seru
        e.other:Faction(96,-5); -- Eye of Seru
        e.other:Faction(138,-5); -- Hand Legionnaries
        e.other:QuestReward(e.self,0,0,0,0,0,10000); -- Exp
    end
    item_lib.return_items(e.self, e.other, e.trade)
end