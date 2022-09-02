set monitorList to {"3840 x 1080", null, "3440 x 1440", "1920 x 1080"} # Set monitor resolutions. List format, add as you need
# Found by running 'system_profiler SPDisplaysDataType |grep Resolution' in the terminal

set monitorCount to (do shell script "system_profiler SPDisplaysDataType |grep Resolution | wc -l")
set monitorArray to paragraphs of (do shell script "system_profiler SPDisplaysDataType |grep Resolution")

set defineMonitor to {}

repeat with i from 1 to monitorCount
    repeat with j from 1 to count of monitorList
        if (get item i of monitorArray contains item j of monitorList)
            set defineMonitor to defineMonitor & {i, item j of monitorList}
        end if
    end repeat
end repeat

log defineMonitor

# EXAMPLE WINDOW:

#    tell application "System Events"
#        tell application process "Microsoft Outlook"   # Change window name
#            tell window 1                              # Set number of windows. First = 1, Second = 2, ...
#                set position to {-3840, -1000}         # Set position of window.
                                                        # Left monitor = -x | Right monitor = (laptop resolution) + x
                                                        # Monitor height offset matters. If monitors are higher than laptop
                                                        #   'y' goes into the negatives
#                set size to {1250, 1080}               # Set window size
#            end tell
#        end tell
#    end tell

# Home - Wide monitor
if get item 2 of defineMonitor = "3840 x 1080"

    tell application "System Events"
        tell application process "Microsoft Outlook"
            tell window 1
                set position to {-3840, -100}
                set size to {1250, 1080}
            end tell
        end tell
    end tell

    tell application "System Events"
        tell application process "Google Chrome"
            tell window 1
                set position to {-2590, -100}
                set size to {1520, 1080}
            end tell
        end tell
    end tell

    tell application "System Events"
        tell application process "Google Chrome"
            tell window 2
                set position to {0, 0}
                set size to {1520, 1080}
            end tell
        end tell
    end tell

    tell application "System Events"
        tell application process "Notes"
            tell window 1
                set position to {-1070, 467}
                set size to {1070, 517}
            end tell
        end tell
    end tell

    tell application "System Events"
        tell application process "Slack"
            tell window 1
                set position to {-1070, -100}
                set size to {1070, 540}
            end tell
        end tell
    end tell

    display dialog "Wide monitor - Home ran" # Change to notify you which if block just ran

end if
# - - - - - - - - - -

# Work - Two monitors
if (get item 2 of defineMonitor = "1920 x 1080") and (get item 4 of defineMonitor = "3440 x 1440")

    tell application "System Events"
        tell application process "Microsoft Outlook"
            tell window 1
                set position to {2472, -600}
                set size to {960, 1080}
            end tell
        end tell
    end tell

    tell application "System Events"
        tell application process "Google Chrome"
            tell window 1
                set position to {0, 0}
                set size to {1520, 1080}
            end tell
        end tell
    end tell

    tell application "System Events"
        tell application process "Google Chrome"
            tell window 2
                set position to {-2871, -1000}
                set size to {1520, 1440}
            end tell
        end tell
    end tell

    tell application "System Events"
        tell application process "Notes"
            tell window 1
                set position to {-1351, -1000}
                set size to {1350, 1440}
            end tell
        end tell
    end tell

    tell application "System Events"
        tell application process "Slack"
            tell window 1
                set position to {1510, -600}
                set size to {962, 1080}
            end tell
        end tell
    end tell

    display dialog "Two monitor - Work ran" # Change to notify you which if block just ran

end if
# - - - - - - - - - -
