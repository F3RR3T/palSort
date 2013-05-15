palSort
=======

Sort pal event files, grouping by once-only events &amp; repeating events.

Introduction:
------------

pal is a command line calendar app for linux that displays a mini calendar (for the next few weeks) and
marks days that have events associated with them.

Events are recorded in one or more plain text files with a .pal extension. These files can be edited 
manually or using interactive mode in pal. 

Problem:
-------
Events added in pal are appended to the bottom of the event file. After a while it becomes hard to find events
when manually editing the .pal file. Furthermore, recuring events and once-only events become jumbled. The time
codes make simple line sorting impractical.


Solution:
--------

A script to group events into recurring and once only, sorting once only events
by date, with a marker (such as an empty line or a  comment) to distinguish between past and future events.

Implementation:
--------------

Either shell script or perl.

Notes
-----
This is my first github (and git) repo, so tackling a fairly easy problem seems like a good way to ease into git[hub].

I am also quite rusty in perl and an almost n00b on shell scripting.

