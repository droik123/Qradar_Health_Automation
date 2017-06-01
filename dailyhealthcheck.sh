#/bin/bash
if [[ $(/opt/qradar/ha/bin/ha_getstate.sh) = active ]]; then
date >healthcheck.out
hostname >> healthcheck.out
printf "\n*****HA State***** \n" >> healthcheck.out
/opt/qradar/ha/bin/ha_getstate.sh >>healthcheck.out
printf "\n*****Memory Check***** \n" >> healthcheck.out
free -m >>healthcheck.out
printf "\n******Disk Usage Check***** \n\n" >> healthcheck.out
df -kh >>healthcheck.out
printf "\n*****Processor Check***** \n\n" >> healthcheck.out
top -n 1 -b |head -25 >> healthcheck.out
printf "\n*****Backup Check***** \n\n" >>healthcheck.out
ls -lt /store/backup |head -5 >>healthcheck.out
printf "\n*****User Check***** \n\n" >>healthcheck.out
ls -l /store/users  >>healthcheck.out
cp healthcheck.out "healthcheck.out.$(date +%Y%m%d)" && rm -rf healthcheck.out
mail -s "$(hostname) Daily System Check $(date +%Y%m%d)" youremail@male.cim < healthcheck.out.$(date +%Y%m%d)


else if [[ $(/opt/qradar/ha/bin/ha_getstate.sh) = standby ]]; then
date >healthcheck.out
hostname >> healthcheck.out
printf "\n*****HA State***** \n" >> healthcheck.out
/opt/qradar/ha/bin/ha_getstate.sh >>healthcheck.out
printf "\n*****Memory Check***** \n" >> healthcheck.out
free -m >>healthcheck.out
printf "\n******Disk Usage Check***** \n\n" >> healthcheck.out
df -kh >>healthcheck.out
printf "\n*****Processor Check***** \n\n" >> healthcheck.out
top -n 1 -b |head -25 >> healthcheck.out
cp healthcheck.out "healthcheck.out.$(date +%Y%m%d)" && rm -rf healthcheck.out
mail -s "$(hostname) Daily System Check $(date +%Y%m%d)" youremail@male.cim < healthcheck.out.$(date +%Y%m%d)

fi
fi
