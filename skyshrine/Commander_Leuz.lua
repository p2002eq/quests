function event_say(e)
  if (e.other:GetFaction(e.self) >= 2) then --warmly or lower
    if (e.message:findi("hail")) then
      e.self:Say("Welcome to Skyshrine. I have noticed a great deal more of your people joining the ranks of the shrine, hoping to assist in pushing back the giants for good. I am here as the commander of the militia set forth by Lord Yelinak himself. With that in mind, it is my duty to assign certain tasks to those who are willing to show their support to the kin, and to the shrine.");  
    elseif(e.message:findi("what task")) then
        e.self:Say("Well, for instance, we have recently acquired information from one of our scouts in the wastelands to the west that there have been storm giants wandering the coastal area nearby. We have not heard from this scout in some time however, and we are beginning to worry about their status. Your task, should you choose to accept it, is to deliver some tools to the scout so that they can communicate back to us with their status, and the status of those giants.");
    elseif(e.message:findi("accept task")) then
      e.self:Say("Good. Please take these tools with haste to the western wastelands and find the scout. Strength be with you, and with the kin.")
      e.other:SummonItem(29683); --Scout Tools
    end
  end
end
--Need to find text for when you are higher than warmly

function event_trade(e)
  local item_lib = require("items");

  if(item_lib.check_turn_in(e.self, e.trade, {item1= 29688})) then
    e.self:Say("Well this artifact will definitely need study. Thank you for this report. Perhaps after we have researched this object more we will have more for you to search for.");
    e.other:Faction(42, 10); --CoV
    e.other:Faction(362, 10); --Yelinak
    e.other:Faction(189, -20); --Kromzek
    e.other:QuestReward(e.self, 0, 0, 0, 0, 0, 10000);
  end

  item_lib.return_items(e.self, e.other, e.trade)

end