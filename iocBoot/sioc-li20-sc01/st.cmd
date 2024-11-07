#!../../bin/rhel7-x86_64/oscilloscope
#==============================================================
#
#  Abs:  Startup Script for FACET Scopes
#
#  Name: st.cmd
#
#  Facility:  FACET Oscilloscope Controls
#
#  Auth: 10-Jun-2024, M. Dunning (mdunning)
#==============================================================

# Set environment variables
epicsEnvSet("IOC_NAME", "SIOC:LI20:SC01")
epicsEnvSet("LOCATION", "facet-daemon1")
epicsEnvSet("ENGINEER", "M. Dunning")

# Load common startup script
< ../common/st.cmd.soft

# Initalize hardware
iocshLoad("$(TOP)/iocBoot/common/mdo.cmd", "NODE_NAME=scop-li20-ex04,P=SCOP:LI20:EX04")

# Setup autosave/restore
< iocBoot/common/autoSaveConf.cmd

# Start EPICS
iocInit()

# Turn on caPutLogging:
# Log values only on change to the iocLogServer:
caPutLogInit("${EPICS_CA_PUT_LOG_ADDR}")
caPutLogShow(2)

# Start autosave routines to save our data
< iocBoot/common/autoSaveRun.cmd

# End of file

