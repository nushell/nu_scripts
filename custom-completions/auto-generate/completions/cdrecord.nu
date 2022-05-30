# Display version
extern "cdrecord" [

	...args
]

# Set the misc debug value to #
extern "cdrecord debug={1,2,3,4,5}" [

	...args
]

# Increment the misc debug level by one
extern "cdrecord 1 2 3 4 5" [

	...args
]

# Minimum drive buffer fill ratio for the ATAPI wait mode
extern "cdrecord minbuf={25,35,45,55,65,75,85,95}" [

	...args
]

# Set the speed factor of the writing process to #
extern "cdrecord speed={0,150,172,1385}" [

	...args
]

# Blank a CD-RW and exit or blank a CD-RW before writing
extern "cdrecord blank={help,all,fast,track,unreserve,trtail,unclose,session}" [

	...args
]

# Set the FIFO (ring buffer) size to #
extern "cdrecord fs=" [

	...args
]

# Set the maximum transfer size for a single SCSI command to #
extern "cdrecord ts=" [

	...args
]

# Sets the SCSI target for the CD/DVD-Recorder
extern "cdrecord dev=" [

	...args
]

# Set the grace time before starting to write to ># seconds
extern "cdrecord gracetime=" [

	...args
]

# Set the default SCSI command timeout value to # seconds
extern "cdrecord timeout=" [

	...args
]

# Allows the user to manually select a driver for the device
extern "cdrecord driver={help,mmc_cd,mmc_cd_dvd,mmc_cdr,mmc_cdr_sony,mmc_dvd,mmc_dvdplus,mmc_dvdplusr,mmc_dvdplusrw,cw_7501,kodak_pcd_600,philips_cdd521,philips_cdd521_old,philips_cdd522,philips_dumb,pioneer_dws114x,plasmon_rf4100,ricoh_ro1060c,ricoh_ro1420c,scsi2_cd,sony_cdu924,teac_cdr50,tyuden_ew50,yamaha_cdr100,cdr_simul,dvd_simul}" [

	...args
]

# Set driver specific options
extern "cdrecord driveropts=" [

	...args
]

# Set default pre-gap size for all tracks except track nr 1
extern "cdrecord defpregap=" [

	...args
]

# Set the packet size to #, forces fixed packet mode
extern "cdrecord pktsize=" [

	...args
]

# Set the Media Catalog Number of the CD
extern "cdrecord mcn=" [

	...args
]

# Write CD-Text based on info found in the binary file filename
extern "cdrecord textfile=" [

	...args
]

# Take all recording related info from a CDRWIN compliant CUE sheet file
extern "cdrecord cuefile=" [

	...args
]

# Set the International Standard Recording Number for the next track
extern "cdrecord isrc=" [

	...args
]

# Sets an index list for the next track
extern "cdrecord index=" [

	...args
]

# Set the amount of data to be appended as padding to the next track
extern "cdrecord padsize=" [

	...args
]

# Set the pre-gap size for the next track
extern "cdrecord pregap=" [

	...args
]

# Specify valid amount of data on raw disk for next track's master image
extern "cdrecord tsize=" [

	...args
]