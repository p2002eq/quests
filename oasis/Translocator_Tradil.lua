local helper = require('translocators');

function event_say(e)
    helper.hail_text(e, 'Timorous Deep', {zone=96, x=3538, y=6117, z=1.3, heading=110});
end

