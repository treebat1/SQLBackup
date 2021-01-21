--View History of Last Full and Differential                 
SELECT s.database_name, case s.type when 'D' then 'Full' when 'I' then 'Differential' end BackupType
, max(s.backup_start_date) latest_start_date
, max(s.backup_finish_date) latest_end_date --, s.*
FROM msdb.dbo.backupset S
join sys.databases d 
on d.name = s.database_name
WHERE s.Type in ('I')
group by s.database_name, s.type
order by s.database_name, max(s.backup_finish_date) desc
