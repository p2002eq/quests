function event_death_complete(e)
	eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 7, 150, "A nimbus of light floods throughs the crypt in one magnificent wave as an earth shattering howl is heard. The bringer of plagues, lord of all disease and decay, Bertoxxulous has been defeated. Suddenly an urgent whisper fills your head simply saying, 'The Torch of Lxanvom shall burn bright again. Freedom is now ours, for that we thank you.'");
	eq.signal(200024,8);
	eq.spawn2(218068,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(),e.self:GetHeading());
end

function event_signal(e)
	eq.depop();
end
