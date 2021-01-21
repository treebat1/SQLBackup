--View History of Full and Differential                 
SELECT s.database_name, case s.type when 'D' then 'Full' when 'I' then 'Differential' end BackupType
, s.backup_start_date 
, s.backup_finish_date
, *
FROM msdb.dbo.backupset S
WHERE s.Type in ('I','D')
and s.database_name like ('TestDBForBackup01')
--and s.backup_finish_date >= '6/25/2017'
order by s.database_name, s.backup_start_date desc

