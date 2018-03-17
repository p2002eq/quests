local helper = require('translocators');

function event_say(e)
    helper.hail_text(e, 'Oasis of Marr', {zone=37, x=-846, y=892, z=-1.7, heading=75});
end
