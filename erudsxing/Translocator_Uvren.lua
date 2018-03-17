local helper = require('translocators');

function event_say(e)
    helper.hail_text(e, 'Erudin', {zone=24, x=-338, y=75, z=23.2, heading=255});
end

