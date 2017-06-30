--Lithiniath (NPC ID# 126208)
--Plane of Mischief 1.0

--NPC Dialog from http://www.angelfire.com/pq/tritonsummers/entry2-7.htm


function event_say(e)
        if(e.message:findi("Hail")) then
                e.self:Emote("lowers his horn towards " .. e.other:GetName() .. ".  The air around you begins to waver as if immense heat was rising from the floor, yet the air feels no different.  You begin to feel heavy and disoriented as you hear a loud whisper begin to speak yet hear no sound at all.  'wHaT sEeK iT Is YoU FrOM LiTHiNiaTh?'");
        end

        if(e.message:findi("ph4t l3wtz")) then
                e.self:Say("Prince Thirneg of the Tunarean Court has amassed a vast supply of phat lewts! Perhaps you should ask him for some!");
        end
		
        if(e.message:findi("phat lewtz")) then
                e.self:Say("Prince Thirneg of the Tunarean Court has amassed a vast supply of phat lewts! Perhaps you should ask him for some!");
        end		

        if(e.message:findi("seek bristlebane")) then
                e.self:Emote("smiles, exposing his yellowed equine teeth and emits a deep rumbling chuckle.  'I wOuLD ADviSe aGaiNST seEKing tHat inDiviDuAl.  Trust me, he is quite mad!!  HahahahHHHaAAahhaAhahahahHhahahaahahaHHHhahah!!'");
        end
end


function event_death_complete(e)
		e.self:Shout("The madness has fled my mind and I am once again whole! Give Gelistial my regards, I must leave this place and try to quell the madness I have inflicted.");
end