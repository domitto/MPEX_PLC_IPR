#!../../bin/linux-x86_64/plc_ipr

#- You may have to change plc_ipr to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

#--
epicsEnvSet("ENGINEER",  "Pedro Rodriguez")
epicsEnvSet("LOCATION",  "")
epicsEnvSet("WIKI", "")
#-- 
epicsEnvSet("IOCNAME", "mpex-plc-ipr")
epicsEnvSet("IOC", "iocplc-ipr")
#--


## Register all support components
dbLoadDatabase "dbd/plc_ipr.dbd"
plc_ipr_registerRecordDeviceDriver pdbbase

# Initialize EtherIP driver, define PLCs
drvEtherIP_init()

EIP_verbosity(7)
# EIP_timeout(5000)

drvEtherIP_define_PLC("pshcs_ipr", "10.112.2.11", 2)

## Load record instances
#dbLoadTemplate "db/user.substitutions"
dbLoadRecords "db/plc_ipr.db", "PLC=pshcs_ipr"

#asSetFilename("${ASCF}/ics-default.acf")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=epics_services"
