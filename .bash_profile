### BEGIN PHYSNET BLOCK ###
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

#Add home bin dir to path, if it exists
if [ -d $HOME/bin ]; then
    export PATH=$PATH:$HOME/bin
fi
### END PHYSNET BLOCK ###


ulimit -f 5000000000
##source /local/cms/sw/cmsset_CMSSW5X.sh
HISTSIZE=20000
alias vh='vim ~/.bash_history'
alias et='exit'
alias la='ls -A'
alias rt='root -l'
alias cdj='cd /local/cms/user/turkewitz' 
alias cdh='cd /local/cms/user/turkewitz/HSCP/CMSSW_5_3_8_HSCP/src/HSCP/Analysis/bin' 
alias cdg='cd /local/cms/user/turkewitz/HSCP/CMSSW_4_2_8_HSCP/src/HSCP2011/ToyMC/bin/' 
alias cds='cd /local/cms/user/turkewitz/HSCP/CMSSW_5_3_6_patch1_HSCP/src/SUSYBSMAnalysis/HSCP/test/ICHEP_Analysis' 
alias cdy='cd /local/cms/user/turkewitz/HSCP/CMSSW_5_3_8_HSCP_Timing/src/SUSYBSMAnalysis/HSCP/test/BuildHSCParticles/Data' 
alias cern='ssh -Y jared@lxplus.cern.ch'
alias kinitF='/usr/kerberos/bin/kinit -A -f jaredt@FNAL.GOV'
alias fnal='ssh -Y jaredt@cmslpc-sl5.fnal.gov'
alias source4='source /local/cms/sw/cmsset_CMSSW4X.sh'
alias source5='source /local/cms/sw/cmsset_CMSSW5X.sh'
alias sourcec='source /local/grid/cmssoft/cms/cmsset_default.sh'
alias sourcer='source /local/cms/user/turkewitz/root/bin/thisroot.sh'
alias sb='echo "scramv1 b --jobs 4 USER_CXXFLAGS="-g""; scramv1 b --jobs 4 USER_CXXFLAGS="-g"'
