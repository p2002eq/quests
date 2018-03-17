local helper = require('translocators');

function event_say(e)
    helper.hail_text(e, 'East Freeport', {zone=10, x=-1033, y=-12, z=-50, heading=142});
end
