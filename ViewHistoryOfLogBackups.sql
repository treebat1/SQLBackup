--View History of Last Log              
SELECT top 1000 s.backup_start_date latest_start_date, s.backup_finish_date latest_end_date, first_lsn, last_lsn, database_name, compressed_backup_size
FROM msdb.dbo.backupset S
WHERE s.Type in ('L')
and s.database_name = 'Template'
order by s.backup_finish_date desc

SELECT s.type, s.backup_start_date latest_start_date, s.backup_finish_date latest_end_date, first_lsn, last_lsn, *
FROM msdb.dbo.backupset S
WHERE --s.Type in ('L','I', 'D')
--AND 
s.Type in ('I')
and s.database_name = 'Template'
order by s.backup_finish_date DESC

SELECT s.type, s.backup_start_date latest_start_date, s.backup_finish_date latest_end_date, first_lsn, last_lsn, *
FROM msdb.dbo.backupset S
WHERE --s.Type in ('L','I', 'D')
--AND 
s.Type in ('D')
and s.database_name = 'Revzilla'
order by s.backup_finish_date desc



SELECT type, backup_start_date, backup_finish_date, m.physical_device_name
FROM msdb.dbo.backupset S
JOIN msdb.dbo.backupmediafamily M ON M.media_set_id=S.media_set_id
WHERE s.database_name = 'Revzilla'
AND M.physical_device_name LIKE '%full%'
ORDER BY backup_start_date desc

                   