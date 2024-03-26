#!/bin/bash

HOST="ad.contoso.local"

DOMAIN="contoso.local"

ADUSERNAME="admin"

ADPASS="password"
 

# Enable SSH

echo "Enabling SSH"

systemsetup -setremotelogin on

launchctl load -w /System/Library/LaunchDaemons/ssh.plist

 

# Find the serial number

SN=$1

echo "New  machine domain Name: $SN"

 

# Set HostName, LocalHostName, and ComputerName to M$SN

echo "Setting computer names to $SN"

scutil --set HostName $SN

scutil --set LocalHostName $SN

scutil --set ComputerName $SN

 

# Add computer to Active Directory

echo "Adding computer to Active Directory"

dsconfigad -preferred $HOST -domain $DOMAIN -u $ADUSERNAME -p $ADPASS 
dsconfigad -mobile enable -mobileconfirm disable
dsconfigad -group "Domain Admins"
dsconfigad -enableSSO
# Disable UNC paths
dsconfigad -localhome enable
dsconfigad -useuncpath disable
