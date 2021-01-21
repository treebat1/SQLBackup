--View History of Differential                 
SELECT s.database_name
, s.backup_start_date
, s.backup_finish_date
FROM msdb.dbo.backupset S
join sys.databases d 
on d.name = s.database_name
WHERE s.Type = 'I'
and s.database_name = 'tumi'
order by s.database_name, s.backup_finish_date desc

                   