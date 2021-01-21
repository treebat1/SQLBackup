SELECT SUM(s.compressed_backup_size) TotalCompressedBackupSize
FROM msdb.dbo.backupset S
WHERE s.backup_set_id = (SELECT max(sbs.backup_set_id)
								FROM msdb..backupset sbs
								WHERE sbs.database_name = s.database_name and sbs.type = 'D')
and s.backup_size <= 100000000000 --100 GB

/*
Server Name	TotalCompressedBackupSize
RaiderSQL15\I15	70479873
RaiderSQL14\I14	28495965
RaiderSQL16\I16	32240324
RaiderSQL9\I9	92349267
RaiderSQL10\I10	395,858,211,462
Raider12\I14	410,704,700,800
Raider11\I12	269,942,793,474
RaiderSQL7\I7	505,858,093,418
*/
--About 1.7 TB




SELECT SUM(compressed_backup_size) TotalCompressedBackupSize
FROM msdb.dbo.backupset S
JOIN msdb.dbo.backupmediafamily M ON M.media_set_id=S.media_set_id
WHERE backup_set_id = ( SELECT max(sbs.backup_set_id)
                    FROM msdb..backupset sbs
                    JOIN msdb..backupmediafamily M ON M.media_set_id=sbs.media_set_id
                    WHERE sbs.database_name = s.database_name and s.type = 'D')


SELECT compressed_backup_size
FROM msdb.dbo.backupset S
JOIN msdb.dbo.backupmediafamily M ON M.media_set_id=S.media_set_id
WHERE backup_set_id = ( SELECT max(backup_set_id)
                    FROM msdb..backupset S
                    JOIN msdb..backupmediafamily M ON M.media_set_id=S.media_set_id
                    WHERE S.database_name = 'HomeDepot' and s.type = 'D')