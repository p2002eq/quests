local helper = require('translocators');

function event_say(e)
    helper.hail_text(e, 'Qeynos', {zone=1, x=192, y=12, z=3.2, heading=191});
end

