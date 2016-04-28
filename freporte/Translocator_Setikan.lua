local helper = require('translocators');

function event_say(e)
    helper.hail_text(e, 'Ocean of Tears', {zone=93, x=2747, y=3451, z=-159.8, heading=142});
end
