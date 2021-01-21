SELECT type, backup_start_date, backup_finish_date, physical_device_name
, s.*
, m.*
, compressed_backup_size/backup_size
FROM msdb.dbo.backupset S
JOIN msdb.dbo.backupmediafamily M ON M.media_set_id=S.media_set_id
WHERE S.database_name = 'TestDBForBackup01' 
and 
Type = 'D' 
--and USER_NAME = ''
order by s.backup_start_date desc

-----Get last full backup:
--SELECT database_name, s.type, backup_start_date, backup_finish_date, s.*, m.*
--FROM msdb.dbo.backupset S
--JOIN msdb.dbo.backupmediafamily M ON M.media_set_id=S.media_set_id
--WHERE s.backup_set_id = (SELECT max(s.backup_set_id)
--							FROM msdb..backupset S
--							JOIN msdb..backupmediafamily M ON M.media_set_id=S.media_set_id
--							WHERE s.Type = 'D')

/*
SELECT s.database_name, s.backup_start_date, s.backup_finish_date , s.*
FROM msdb.dbo.backupset S
join sys.databases d 
on d.name = s.database_name
WHERE s.Type = 'D'
--and s.database_name = ''
order by s.backup_finish_date desc

*/
                    
