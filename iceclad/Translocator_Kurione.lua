local helper = require('translocators');

function event_say(e)
    helper.hail_text(e, 'North Ro', {zone=34, x=-845, y=782, z=-1.80, heading=200});
end
