function event_spawn(e)
  e.self:Say("Weeeeeeeeeeeeeee!");
  make_gibblit(e);
end
--34064 - Avocado
--19165 - Pickled Dragon
--13497 - Candied Spider
--1648 - Brown Gravy
--9751 - Mammoth Fillet in Cream
--5803 - A Sandwich of Foul Smelling Herbs
--8184 - Cheesy Anaconda Casserole
--20096 - Mum's Pie
--13494 - Fruit Pie
--12612 - Beetle Bake
--2469 - Guise
--4164 - Rubi BP
--14730 - pre nerf Cos
function make_gibblit(e)
  local items = {34064, 19165, 13497, 1648, 9751, 5803, 8184, 20096, 13494, 12612, 2469, 4164, 14730, 2469};
  local index = math.random(1, table.getn(items));
  e.self:AddItem(items[index], 1);
end
