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

#    tell application "System Events"
#
#       try                                                         # Put within 'try' block so that errors are handled
#                                                                   # Group individiual applications together within a single 'try' block
#
#           tell window 1 of application process "Google Chrome"    # Set window number (1, 2, 3, ...) and then application name
#               set position to {0, 0}                              # Set position of window.
#                                                                   # Left monitor = -x | Right monitor = (laptop resolution) + x
#                                                                   # Monitor height offset matters. If monitors are higher than laptop
#                                                                   #   'y' goes into the negatives
#               set size to {1520, 1080}                            # Set window size
#           end tell
#
#           tell window 2 of application process "Google Chrome"    # Repeat if running multiple windows of the same application
#               set position to {-2871, -1000}
#               set size to {1520, 1440}
#           end tell
#
#       end try                                                     # End 'try block
#
#
#   end tell


# Home - Wide monitor
if get item 2 of defineMonitor = "3840 x 1080"

    tell application "System Events"

        try
            tell window 1 of application process "Microsoft Outlook"
                set position to {-3840, -100}
                set size to {1250, 1080}
            end tell
        end try

        try
            tell window 1 of application process "Google Chrome"
                set position to {-2590, -100}
                set size to {1520, 1080}
            end tell

            tell window 2 of application process "Google Chrome"
                set position to {0, 0}
                set size to {1520, 1080}
            end tell
        end try

        try
            tell window 1 of application process "Notes"
                set position to {-1070, 467}
                set size to {1070, 517}
            end tell
        end try

        try
            tell window 1 of application process "Slack"
                set position to {-1070, -100}
                set size to {1070, 540}
            end tell
        end try

    end tell

    display dialog "Wide monitor - Home ran" # Change to notify you which if block just ran

end if
# - - - - - - - - - -

# Work - Two monitors
if (get item 2 of defineMonitor = "1920 x 1080") and (get item 4 of defineMonitor = "3440 x 1440")

    tell application "System Events"

        try
            tell window 1 of application process "Google Chrome"
                set position to {0, 0}
                set size to {1520, 1080}
            end tell

            tell window 2 of application process "Google Chrome"
                set position to {-2871, -1000}
                set size to {1520, 1440}
            end tell
        end try

        try
            tell window 1 of application process "Notes"
                set position to {-1351, -1000}
                set size to {1350, 1440}
            end tell
        end try

        try
            tell window 1 of application process "Slack"
                set position to {1510, -600}
                set size to {962, 1080}
            end tell
        end try

        try
            tell window 1 of application process "Microsoft Outlook"
                set position to {2472, -600}
                set size to {960, 1080}
            end tell
        end try

    end tell

    display dialog "Two monitor - Work ran" # Change to notify you which if block just ran

end if
# - - - - - - - - - -
