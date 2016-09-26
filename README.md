# Qradar_Health_Automation

This .sh script has been created to automate the Health Check verification for Qradar.  
The script was created for an HA setup for an All in One Qradar Box.   
The script checks for the Active box and executes commands to find the below attrbiutes

1) HA Status i.e whether the box is running on Active or Standby
2) Memory Check to look into the RAM 
3) Disk Usage
4) Processor Check
5) Backup Check i.e to verify if last nights backup has been done 
6) User check i.e provides the lists of users that are created on the Qradar box. 

Please note this was the criteria that I required for the daily Health Check.  

If there are any requests that you have for further development of the script, please feel free to comment. 

How to use:
Download the file dailyhealthcheck.sh
chmod +x dailyhealthcheck.sh
./dailyhealthcheck.sh

This will create a file called dailyhealthcheck with the date in the filename.  
