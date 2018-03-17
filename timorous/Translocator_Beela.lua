
local helper = require('translocators');

function event_say(e)
    helper.hail_text(e, 'Firiona Vie', {zone=84, x=1402, y=-4318, z=-104.5, heading=10});
end
