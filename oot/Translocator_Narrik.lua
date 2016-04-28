local helper = require('translocators');

function event_say(e)
    helper.hail_text(e, 'Butcherblock Mountains', {zone=68, x=3235, y=1355, z=13, heading=142});
end
