# palRoster.R
#   Written by SJP 	Sat 18 May 2013 09:50:32 EST 
#	A teleworking roster for the linux terminal calender app, 'pal'		
#
# This R script writes a pal file that shows which weeks will be WAFTO (Working Away From The Office).
# It assumes weekly blocks of time.
#
#	pal: 
#	R: 	sudo apt-get install r-base
#		(no R experience required; just copy this while file and paste it into the R command prompt)
#		No R output is produced, cd to ~/.pal to see if your .pal file was created.
#
# Settings for this script:
# 	Alter the values of 'wafto' and 'office' in the 'weeks' list to suit your own circumstances.
# 	Edit the date argument in 'startMon'. This is not error checked. i.e. make sure it is a 
#	Monday if your week starts on a Monday.
#
# Usage in pal:
#	add 'telework.pal' to your pal.conf file (if you used the default palFile value in he settings area below).
#	or create a new telework.conf file with these settings:
#		file telework.pal
#		# show how fixed dates like summer hols fit in with roster
#		file my_special_dates.pal
# 		week_start_monday
#		show_weeknum
#		no_columns
#		# suppress listing of events below the calendar.
#		default_range 0
#	(see pal.conf for assistance with these settings)
#	Call pal like this (if you want to see the next 50 weeks):
#
#		pal -f telework.conf -c 50
#
#	Or send it to a text file for your colleagues/bosses' reference:
#
#		pal -f telework.conf -c 50 --nocolor > wafto.txt

#====== Settings =================
palDir <- '~/.pal/'			# Default location. Alter if necesaary.
palFile <- 'telework.pal'
weeks <- list(wafto = 3, office = 3)	# number of weeks WAFTO and at office [change the numbers if req.]
#					#	But DON'T change the order of wafto/office
forecast <- 52				# go this many weeks into the future
startMon <- as.Date('2013-06-03')	# Start the calendar at this date
#====== End of Settings ==========
weekCount <- 0				# counter (don't change this)

# yyyymmdd date format
yyyymmdd <- function(thisDate = Sys.Date()){
  return(format(thisDate, '%Y%m%d'))
}

sink()	# insurance against erroneously opening files; don't worry about the R warning.
sink(paste(palDir, palFile, sep=''))

cat("#\tWorking Away From The Office roster calendar\n#\n")
cat(paste('#', date(), 'by SJP\n#\n', sep='\t'))
cat('#\tCreated by palRoster.R\n#\n\n')
cat('() WAFTO\n\n')

while (weekCount <= forecast){
  for( i in 1:sum(unlist(weeks))){
    if (i <= weeks$wafto){
      cat(paste('DAILY:', yyyymmdd(startMon + weekCount*7), ':', yyyymmdd(startMon + weekCount*7+4), '\tWAFTO\n', sep=''))
    }
  weekCount <- weekCount + 1
  }
}
#  If you start getting errors and/or no response at the R prompt, use 'sink()' to force sink.number() back to 0.
sink()
