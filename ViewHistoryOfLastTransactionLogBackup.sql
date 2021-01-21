
                    
--All Logs              
SELECT type, backup_start_date, backup_finish_date
FROM msdb..backupset S
JOIN msdb..backupmediafamily M ON M.media_set_id=S.media_set_id
WHERE S.database_name = 'Staples' 
and 
Type = 'L'
order by backup_start_date desc


SELECT physical_device_name
FROM msdb.dbo.backupset S
JOIN msdb.dbo.backupmediafamily M ON M.media_set_id=S.media_set_id
WHERE S.database_name = 'Staples'
AND database_backup_lsn = (SELECT max(first_lsn)
							FROM msdb.dbo.backupset S2
							JOIN msdb.dbo.backupmediafamily M2 ON M2.media_set_id=S2.media_set_id
							WHERE S2.database_name = S.database_name and Type = 'D')
ORDER BY backup_set_id
