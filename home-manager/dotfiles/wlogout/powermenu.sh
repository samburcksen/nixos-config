#!/usr/bin/env fish

# Opens wlogout only if its not currently running
if not pgrep wlogout
    command wlogout
end
