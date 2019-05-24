# ====================================================================
# Setup some additional environment variables
# ====================================================================
# Setup environment variables

# tag log messages with IOC name
# How to escape the "vioc-dev" as the PERL program
# will try to replace it.
# So, uncomment the following and remove the backslash
epicsEnvSet("EPICS_IOC_LOG_CLIENT_INET","${IOC}")

# Need this path to EPICS BASE so that caRepeater can be started:
# Let's figure out a way to pass this one in via the IOC's
# initial startup.cmd: another job for hookIOC.py :)
# Not needed caRepeater is started up by laci for all IOCs at
# CPU boot up.
epicsEnvSet(PATH,"${EPICS_BASE}/bin/$(ARCH)")

# ========================================================
# Support Large Arrays/Waveforms; Number in Bytes
# Please calculate the size of the largest waveform
# that you support in your IOC.  Do not just copy numbers
# from other apps.  This will only lead to an exhaustion
# of resources and problems with your IOC.
# The default maximum size for a channel access array is
# 16K bytes.
# ========================================================
# Uncomment and set appropriate size for your application:
# 16 MB Some wavefom buffers already exceed 1/2 MB
epicsEnvSet("EPICS_CA_MAX_ARRAY_BYTES", "134217728")

# END: Additional environment variables
# ====================================================================

cd ${TOP}
# ====================================================
## Register all support components
dbLoadDatabase("dbd/oscilloscope.dbd",0,0)
oscilloscope_registerRecordDeviceDriver(pdbbase)
# ====================================================

# =====================================================================
# Channel Access Security:
# This is required if you use caPutLog.
# Set access security file
# Load common LCLS Access Configuration File
< ${ACF_INIT}
epicsThreadSleep(0.3)

< iocBoot/common/autoSaveConf.cmd
< iocBoot/common/iocAdmin.cmd

