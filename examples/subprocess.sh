#!/bin/sh
exec /bin/sh
exec ... /bin/sh

!!stty 19200
exec!stty 19200
exec !.. stty 19200

|less
exec !..| less

!:sed -n s/.*Error.*/\007/p
