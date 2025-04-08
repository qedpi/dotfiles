tell application "System Settings" to activate
delay 1

tell application "System Events"
    tell process "System Settings"
        set frontmost to true
        delay 1

        -- Open "Keyboard"
        try
            click button "Keyboard" of scroll area 1 of group 1 of window 1
        end try
        delay 1

        -- Click "Keyboard Shortcuts…"
        try
            click button "Keyboard Shortcuts…" of group 1 of window 1
        end try
        delay 1

        -- Click "Launchpad & Dock"
        try
            select row 5 of outline 1 of scroll area 1 of splitter group 1 of window 1
        end try
        delay 1

        -- Uncheck "Turn Dock Hiding On/Off"
        try
            repeat with r in rows of outline 1 of scroll area 2 of splitter group 1 of window 1
                if (value of static text 1 of r as string) is equal to "Turn Dock Hiding On/Off" then
                    if value of checkbox 1 of r is 1 then
                        click checkbox 1 of r
                    end if
                end if
            end repeat
        end try
    end tell
end tell
