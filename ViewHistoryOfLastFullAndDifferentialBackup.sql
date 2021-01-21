use msdb
go


--View History of Last Full and Differential                 
SELECT s.database_name, case s.type when 'D' then 'Full' when 'I' then 'Differential' end BackupType
, max(s.backup_start_date) latest_start_date
, max(s.backup_finish_date) latest_end_date --, s.*
FROM msdb.dbo.backupset S
join sys.databases d 
on d.name = s.database_name
WHERE s.Type in ('I','D')
group by s.database_name, s.type
order by s.database_name, max(s.backup_finish_date) desc


--SELECT type, backup_start_date, backup_finish_date, first_lsn, last_lsn, database_backup_lsn, *
--FROM msdb.dbo.backupset S
--JOIN msdb.dbo.backupmediafamily M ON M.media_set_id=S.media_set_id
--WHERE S.database_name = 'lacoste' and Type = 'D'
--order by s.last_lsn desc


--SELECT type, backup_start_date, backup_finish_date, first_lsn, last_lsn, database_backup_lsn, *
--FROM msdb.dbo.backupset S
--JOIN msdb.dbo.backupmediafamily M ON M.media_set_id=S.media_set_id
--WHERE backup_set_id = ( SELECT max(backup_set_id)
--                    FROM msdb..backupset S
--                    JOIN msdb..backupmediafamily M ON M.media_set_id=S.media_set_id
--                    WHERE S.database_name = 'lacoste' and Type = 'I')

--SELECT type, backup_start_date, backup_finish_date, first_lsn, last_lsn, database_backup_lsn, *
--FROM msdb.dbo.backupset S
--JOIN msdb.dbo.backupmediafamily M ON M.media_set_id=S.media_set_id
--WHERE S.database_name = 'lacoste' and Type = 'L'
--order by s.last_lsn desc


--SELECT type, backup_start_date, backup_finish_date, first_lsn, last_lsn, database_backup_lsn, *
--FROM msdb.dbo.backupset S
--JOIN msdb.dbo.backupmediafamily M ON M.media_set_id=S.media_set_id
--WHERE S.database_name = 'lacoste' --and Type = 'L'
--order by s.last_lsn desc
                   