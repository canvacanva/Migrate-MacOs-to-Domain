# Migrate-MacOs-to-Domain

### Join Domain
Copy all files in a USB key or root drive.

Change with desidered Mac machine name
```
sudo su
sh 1_join_ad.sh MBP-Canva
```

### Create temp admin for migration
user: migration
passw: migration
```
sudo su
sh 2_temp_migration_account.sh
```
Reboot and login with migration account

### Copy all documents (NOT PREFERENCES!!!!)
```
sudo su
sh 2_MigrateLocalUserToADDomainAcct.command
```

or create only account without copy data:
```
sudo su
sh 2_MigrateLocalUserToADDomainAcct-NODATA.command
```

### Disable Migration account
```
sudo su
sh 3_join_ad_last_step.sh
```
tesing for few days, then delete local account (migration etc.)
