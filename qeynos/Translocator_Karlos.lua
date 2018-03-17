local helper = require('translocators');

function event_say(e)
    helper.hail_text(e, 'Eruds Crossing', {zone=98, x=722, y=-1774, z=3.2, heading=62});
end
