local eventStarted = false;


function event_trade(e)
	local item_lib = require("items");
	
	-- Dialogue on turn in, spawns the war mobs then despawn her.
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1093})) and (eventStarted == false) then 
	    e.self:Say("Thank you. I will return to the Dain and inform him that the battle is underway. Please escort Garadain to the battlefield and see that he returns safely. May Brell bless you and bring you victory over these beasts.")
	    e.other:Faction(49, 30); -- +Coldain
		e.other:Faction(67, 30); -- +Dain Frostreaver IV
		e.other:Faction(188, -30); -- -Kromrif
		e.other:Faction(189, -30); -- -Kromzek
		e.other:AddEXP(10000);
	    eq.set_timer("spawn1", 5);
--	    eq.spawn2(116607,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
    end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
    if(e.timer == "spawn1") then
        eq.stop_timer("spawn1");
        eq.depop_all(116165);
    --   Garadain Glacierbane  
    --    eq.spawn2(116084,236,0,-389.6,-2713.6,181,19);
        eq.signal(116084, 1)                                -- let garadain know battle started.
    --   royal wolven guard  
        eq.spawn2(116563,0, 0,790.9,-2497.6,168.6,168); -- 1
        eq.spawn2(116563,0,0,799.8,-2491.6,169.1,168); -- 2
        eq.spawn2(116563,0,0,808.4,-2485.8,169.6,168); -- 3
        eq.spawn2(116563,0,0,817,-2480.1,170.1,168); -- 4
        eq.spawn2(116563,0,0,779.6,-2480.4,168,168); -- 5
        eq.spawn2(116563,0,0,788,-2474.8,168.5,168); -- 6
        eq.spawn2(116563,0,0,796.7,-2469,169,168); -- 7
        eq.spawn2(116563,0,0,805.6,-2463,169.4,168); -- 8
        
    --   priest of brell  
        eq.spawn2(116541,0,0,796.2,-2506.7,168.9,168);
        eq.spawn2(116541,0,0,805.1,-2500.8,169.4,168);
        eq.spawn2(116541,0,0,814,-2494.9,169.9,168);
        eq.spawn2(116541,0,0,822.9,-2489,170.4,168);
        eq.spawn2(116541,0,0,773.4,-2471.7,167.7,168);
        eq.spawn2(116541,0,0,782.2,-2465.9,168.2,168);
        eq.spawn2(116541,0,0,791.2,-2459.8,168.6,168);
        eq.spawn2(116541,0,0,799.7,-2454.2,169.1,168);
        
    -- royal archer
        eq.spawn2(116555,0,0,801.8,-2515.1,169.2,168);
        eq.spawn2(116555,0,0,810.8,-2509.1,169.7,168);
        eq.spawn2(116555,0,0,819.6,-2503.3,170.2,168);
        eq.spawn2(116555,0,0,828.5,-2497.3,170.7,168);
        eq.spawn2(116555,0,0,767.5,-2462.8,167.4,168);
        eq.spawn2(116555,0,0,775.9,-2457.2,167.8,168);
        eq.spawn2(116555,0,0,784.9,-2451.2,168.3,168);
        eq.spawn2(116555,0,0,793.7,-2445.3,169.2,168);
    
    -- paladin of brell
        eq.spawn2(116549,0,0,808.4,-2523.6,169.6,168);
        eq.spawn2(116549,0,0,817.1,-2517.8,170.1,168);
        eq.spawn2(116549,0,0,825.8,-2512,170.5,168);
        eq.spawn2(116549,0,0,834.4,-2506.3,171.0,168);
        eq.spawn2(116549,0,0,761.7,-2453.8,167,168);
        eq.spawn2(116549,0,0,770.6,-2447.8,167.7,168);
        eq.spawn2(116549,0,0,779.4,-2442,168.8,168);
        eq.spawn2(116549,0,0,787.8,-2436.4,169.8,168);

    -- ry'gorr elite
        eq.spawn2(116556,0,0,389.9,-3451.6,146.7,249);
        eq.spawn2(116556,0,0,383.2,-3451.7,146.7,249);
        eq.spawn2(116556,0,0,364.6,-3451.7,146.7,249);
        eq.spawn2(116556,0,0,392,-3476,146.6,249);
        eq.spawn2(116556,0,0,379.5,-3476,146.6,249);
        eq.spawn2(116556,0,0,366.5,-3476,146.6,249);
        eq.spawn2(116556,0,0,450.2,-3449.3,146.7,249);
        eq.spawn2(116556,0,0,463.4,-3448.5,146.7,249);
        eq.spawn2(116556,0,0,475.4,-3447.9,146.7,249);
        eq.spawn2(116556,0,0,451.7,-3475.3,146.6,249);
        eq.spawn2(116556,0,0,453.2,-3473.5,146.7,249);
        eq.spawn2(116556,0,0,476.9,-3473.5,146.7,249);

    -- kromrif soldier
        eq.spawn2(116548,0,0,339.5,-3453.3,146.7,249);
        eq.spawn2(116548,0,0,341,-3478.5,146.7,249);
        eq.spawn2(116548,0,0,313.6,-3454.2,146.8,249);
        eq.spawn2(116548,0,0,315.1,-3479.9,146.7,249);
        eq.spawn2(116548,0,0,500.9,-3446.9,146.8,249);
        eq.spawn2(116548,0,0,502.4,-3471.9,146.7,249);
        eq.spawn2(116548,0,0,526.2,-3445,146.8,249);
        eq.spawn2(116548,0,0,527.7,-3470.6,146.8,249);

    -- kromrif soldier inside fort
        eq.spawn2(116548,0,0,442.6,-3592.8,146.4,255);
        eq.spawn2(116548,0,0,406,-3592.8,146.3,255);

    -- oracle of ry'gorr
        eq.spawn2(116006,0,0,433.3,-3593,146.3,255);

    -- chief ry'gorr, head dropping version
        eq.spawn2(116584,0,0,425.9,-3593.2,146.3,255);

    -- Firbrand the black
        eq.spawn2(116593,0,0,416.2,-3592.8,146.3,255);

    -- ringeightcoord
        --eq.spawn2(116575,0,0,0,0,0,0);
 
 	    eq.depop();     
    end
end