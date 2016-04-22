# rsyncstate-backup
Backup folder state using rsync / Check folder changes.
Backup folder contents using rsync to backup file / Restore some files from backup file.

При помощи rsync можно выяснить, было ли модифицировано содержимое папки или нет. Также можно выполнить бэкап папки в отдельный файл и быстро восстановиться из этого бэкапа.

Пример сохранения состояния папки:
```
$ rsyncstate-save.sh /tmp/Django-2.2.2
$ touch /tmp/Django-2.2.2/LICENSE
$ rsyncstate-check.sh /tmp/Django-2.2.2
Changed: LICENSE
```
Пример бэкапа и восстановления:
```
$ rsyncstate-zbackup.sh /tmp/Django-2.2.2
$ rm /tmp/Django-2.2.2/LICENSE
$ rsyncstate-restore.sh /tmp/Django-2.2.2
Setting the --compress (-z) option to match the batchfile.
LICENSE
```
