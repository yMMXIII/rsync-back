# rsyncstate-backup
Backup folder state using rsync / Check folder changes.
Backup folder contents using rsync to backup file / Restore some files from backup file.

Часто бывает необходимо выяснить, было ли модифицировано содержимое папки или нет. Для этого нужно как-то сохранить состояние папки и позже проверить, были ли изменения в содержимом папки. Утилита rsync может использоваться и для этого. Это своего рода «Швейцарский армейский нож». Также мы рассмотрим возможность бэкапа папки в отдельный файл и быстрое восстановление из этого бэкапа.

Пример сохранения состояния папки:

$ rsyncstate-save.sh /tmp/Django-2.2.2
$ touch /tmp/Django-2.2.2/LICENSE
$ rsyncstate-check.sh /tmp/Django-2.2.2
Changed: LICENSE

Пример бэкапа и восстановления:

$ rsyncstate-zbackup.sh /tmp/Django-2.2.2
$ rm /tmp/Django-2.2.2/LICENSE
$ rsyncstate-restore.sh /tmp/Django-2.2.2
Setting the --compress (-z) option to match the batchfile.
LICENSE
