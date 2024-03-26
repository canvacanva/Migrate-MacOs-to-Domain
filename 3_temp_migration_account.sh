#!/bin/bash

# Create account for migration
LOCAL_ADMIN_FULLNAME="migration"     # The local admin user's full name
LOCAL_ADMIN_SHORTNAME="migration"     # The local admin user's shortname
LOCAL_ADMIN_PASSWORD="migration"      # The local admin user's password

sysadminctl -addUser $LOCAL_ADMIN_SHORTNAME -fullName "$LOCAL_ADMIN_FULLNAME" -password "$LOCAL_ADMIN_PASSWORD"  -admin
dscl . create /Users/$LOCAL_ADMIN_SHORTNAME IsHidden 1  # Hides the account (10.10 and above)
mv /Users/$LOCAL_ADMIN_SHORTNAME /var/$LOCAL_ADMIN_SHORTNAME # Moves the admin home folder to /var
dscl . -create /Users/$LOCAL_ADMIN_SHORTNAME NFSHomeDirectory /var/$LOCAL_ADMIN_SHORTNAME # Create new home dir attribute
dscl . -delete "/SharePoints/$LOCAL_ADMIN_FULLNAME's Public Folder" # Removes the public folder sharepoint for the local admin
sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWFULLNAME -bool TRUE

echo "#######################################"
echo "Riavvia il mac ed accedi come migration, password migration"
echo "#######################################"
read -p "Premi enter per continuare"
reboot
