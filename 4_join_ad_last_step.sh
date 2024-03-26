#!/bin/bash
dscl . -append /Users/migration AuthenticationAuthority ";DisabledUser;"

echo "Riavvia il mac ed accedi con il tuo utente di AD"
echo "#######################################"
read -p "Premi enter per continuare"
reboot
