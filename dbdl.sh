#/bin/bash
#Put the oracle install .tgz in the scratch directory and it will be 
#copied over to /u01 for install through puppet on the vagrant VM.
#If the file isn't in scratch this script will download it to scratch
###
###file name for the oracle install .tgz###
ORA_VER="11.2.0.3_database.tgz"
###########################################
if [ ! -d /u01 ];
then
  install -d -g root -o root -m 777 /u01
fi
if [ ! -f /vagrant/scratch/$ORA_VER ];
then
  curl -o /vagrant/scratch/$ORA_VER "http://software.apidb.org/oracle/$ORA_VER"
else
  echo "The $ORA_VER file is already scratch"
fi  
install -g root -o root -m 777 /vagrant/scratch/$ORA_VER /u01/$ORA_VER
