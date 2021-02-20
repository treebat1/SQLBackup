
--HomeDepotFullBackupSpecific


use Test
go
select Percent_Complete
, DATEDIFF(minute, start_time, GETDATE()) AS Minutes_Running
, 100 - Percent_Complete AS Percent_Remaining
, (DATEDIFF(minute, start_time, GETDATE())/percent_complete) * (100 - percent_complete) AS Minutes_Left
, ((DATEDIFF(minute, start_time, GETDATE())/percent_complete)/60) * (100 - percent_complete) AS Hours_Left
, (DATEDIFF(minute, start_time, GETDATE())/percent_complete) AS Minutes_Per_Percentage
, ((DATEDIFF(minute, start_time, GETDATE())/percent_complete)/60) AS Hours_Per_Percentage
, (SELECT 100-((CONVERT(DECIMAL(12,2),ROUND(FILEPROPERTY(a.name,'SpaceUsed')/128.000,2))/2097152)*100)
		FROM sys.database_files a 
		LEFT OUTER JOIN sys.data_spaces b
		ON a.data_space_id = b.data_space_id
		where a.name like '%Log') AS HomeDepotLog_FreeSpace
, (SELECT 100-((CONVERT(DECIMAL(12,2),ROUND(FILEPROPERTY(a.name,'SpaceUsed')/128.000,2))/2097152)*100)
		FROM sys.database_files a 
		LEFT OUTER JOIN sys.data_spaces b
		ON a.data_space_id = b.data_space_id
		where a.name like '%Log')-(100-Percent_Complete) AS FreeSpaceComparedToPercentRemaining
, Start_Time
, Command
, db_name(database_id) [Database]
from sys.dm_exec_requests
where command like 'backup database%' 



SELECT FILEPROPERTY(a.name,'SpaceUsed')
FROM sys.database_files a 
LEFT OUTER JOIN sys.data_spaces b
ON a.data_space_id = b.data_space_id
where a.name like '%Log'


