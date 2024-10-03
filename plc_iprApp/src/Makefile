TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = plc_ipr
# plc_ipr.dbd will be created and installed
DBD += plc_ipr.dbd

# plc_ipr.dbd will be made up from these files:
plc_ipr_DBD += base.dbd
plc_ipr_DBD += ether_ip.dbd

# Include dbd files from all support applications:
#plc_ipr_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#plc_ipr_LIBS += xxx
plc_ipr_LIBS += ether_ip

# plc_ipr_registerRecordDeviceDriver.cpp derives from plc_ipr.dbd
plc_ipr_SRCS += plc_ipr_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
plc_ipr_SRCS_DEFAULT += plc_iprMain.cpp
plc_ipr_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#plc_ipr_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
plc_ipr_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

