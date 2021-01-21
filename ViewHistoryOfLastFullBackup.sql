--SELECT type, backup_start_date, backup_finish_date, physical_device_name
--FROM msdb.dbo.backupset S
--JOIN msdb.dbo.backupmediafamily M ON M.media_set_id=S.media_set_id
--WHERE --S.database_name = 'hst' and 
--Type = 'D' and USER_NAME = 'EC2\adminsv'
--order by s.backup_start_date desc

-----Get last full backup:
--SELECT database_name, s.type, backup_start_date, backup_finish_date, s.*, m.*
--FROM msdb.dbo.backupset S
--JOIN msdb.dbo.backupmediafamily M ON M.media_set_id=S.media_set_id
--WHERE s.backup_set_id = (SELECT max(s.backup_set_id)
--							FROM msdb..backupset S
--							JOIN msdb..backupmediafamily M ON M.media_set_id=S.media_set_id
--							WHERE s.Type = 'D')

SELECT s.database_name, max(s.backup_start_date) latest_start_date, max(s.backup_finish_date) latest_end_date --, s.*
FROM msdb.dbo.backupset S
join sys.databases d 
on d.name = s.database_name
WHERE s.Type = 'D'
group by s.database_name
order by s.database_name
--order by max(s.backup_finish_date)

                    
