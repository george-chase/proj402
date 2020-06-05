REM  This cmd file was written by George Chase, June 2020 to configure a Windows 2016 Server
REM  for use by students. It adds several unprivileged users, creates an hr share and shares it to
REM  the group everyone with FULL control (dangerous).  There is also a sensitive file in the share.
REM  The group "everyone" has been added to the Remote Desktop Users group for ease of remote access.
REM
REM
@echo off
net user gjetson Sprockets2020 /add
net user jjetson Sprockets2020 /add
net user jjetsonjr Sprockets2020 /add
net user bixby Sprockets2020 /add
net user jhornsby Sprockets2020 /add
net user alovelace Aturing1942 /add
mkdir c:\hr
net share hr=c:\hr /GRANT:everyone,FULL
echo Bill Bixby Termination >> c:\hr\bbixby.txt
echo " " >> c:\hr\bbixby.txt
echo Due to ongoing restructuring, Mr. Bixby's position has been eliminated. >> c:\hr\bbixby.txt
echo Bill Bixby will be terminated in 30 days with a standard package. >> c:\hr\bbixby.txt
net localgroup "Remote Desktop Users" everyone /add
