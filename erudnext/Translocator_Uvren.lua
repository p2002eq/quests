local helper = require('translocators');

function event_say(e)
    helper.hail_text(e, 'Eruds Crossing', {zone=98, x=698, y=-1772, z=3.2, heading=63});
end

