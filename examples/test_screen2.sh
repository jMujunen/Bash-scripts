#!/bin/sh

# Creates another shell in the same window, while the original shell is still running. Output of both shells is displayed and user input is sent to the new /bin/sh.

!stty 19200           # Set the speed of the window's tty. If your stty command operates on stdout

" " |less

        #This  adds  a  pager  to the window output. The special character `|' is needed to give the user control over the pager although it gets its input from the window's #process. This works, because less listens on
        #stderr (a behavior that screen would not expect without the `|') when its stdin is not a tty.  Less versions newer than 177 fail miserably here; good old pg still #works.

!:sed -n s/.*Error.*/\007/p

        #Sends window output to both, the user and the sed command. The sed inserts an additional bell character (oct. 007) to the window output seen by screen.  This will #cause "Bell in window  x"  messages,  whenever
        #the string "Error" appears in the window.
