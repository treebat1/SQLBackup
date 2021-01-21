--View History of Full, Differential and Log           
SELECT s.database_name, case s.type when 'D' then 'Full' when 'I' then 'Differential' when 'L' then 'Log' end BackupType
, max(s.backup_start_date) latest_start_date
, max(s.backup_finish_date) latest_end_date
, left(m.physical_device_name, 40)
FROM msdb.dbo.backupset S
join sys.databases d 
on d.name = s.database_name
JOIN msdb.dbo.backupmediafamily M 
ON M.media_set_id=S.media_set_id
where s.backup_finish_date > '2/1/2018'
and s.database_name = 'RevZilla'
group by s.database_name, s.type, left(m.physical_device_name, 40)
--order by max(s.backup_finish_date), s.database_name
order by s.database_name
                   
--select db_name(database_id), *
--from sys.database_recovery_status

--select db_name(database_id), *
--from sys.master_files
--where db_name(database_id) = 'uniqloeu'