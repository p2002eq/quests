local helper = require('translocators');

function event_say(e)
    helper.hail_text(e, 'Iceclad Ocean', {zone=110, x=366, y=5324, z=-18.10, heading=68});
end
