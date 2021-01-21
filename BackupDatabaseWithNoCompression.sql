EXEC sp_ShowDataFileInfo 'TestDBForBackup01' ;
go

/*
Logical_FileName               FileGroup                      Type_ SizeInMB   SpaceUsed  AvailSpace Max_Size   Growth    physical_name
------------------------------ ------------------------------ ----- ---------- ---------- ---------- ---------- --------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
TestDBForBackup01              PRIMARY                        ROWS        100          2         98    100,000    1,000   J:\Data02\TestDBForBackup01.mdf
TestDBForBackup01_log          NULL                           LOG         100          1         99     10,000    1,000   J:\Log\TestDBForBackup01_log.ldf
*/

BACKUP DATABASE TestDBForBackup01 TO DISK = 'J:\Backup01\TestDBForBackup01_BU03.bak' 
WITH NO_COMPRESSION;
go

/*

Processed 304 pages for database 'TestDBForBackup01', file 'TestDBForBackup01' on file 1.
Processed 3 pages for database 'TestDBForBackup01', file 'TestDBForBackup01_log' on file 1.
BACKUP DATABASE successfully processed 307 pages in 5.331 seconds (0.449 MB/sec).

*/

ALTER DATABASE TestDBForBackup01 MODIFY FILE ( NAME = 'TestDBForBackup01', SIZE = 1000MB);
go
--completed

EXEC sp_ShowDataFileInfo 'TestDBForBackup01' ;
go

/*
Logical_FileName               FileGroup                      Type_ SizeInMB   SpaceUsed  AvailSpace Max_Size   Growth    physical_name
------------------------------ ------------------------------ ----- ---------- ---------- ---------- ---------- --------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
TestDBForBackup01              PRIMARY                        ROWS      1,000          2        998    100,000    1,000   J:\Data02\TestDBForBackup01.mdf
TestDBForBackup01_log          NULL                           LOG         100          1         99     10,000    1,000   J:\Log\TestDBForBackup01_log.ldf
*/


BACKUP DATABASE TestDBForBackup01 TO DISK = 'J:\Backup01\TestDBForBackup01_BU04.bak' 
WITH NO_COMPRESSION;
go

/*
Processed 416 pages for database 'TestDBForBackup01', file 'TestDBForBackup01' on file 1.
Processed 2 pages for database 'TestDBForBackup01', file 'TestDBForBackup01_log' on file 1.
BACKUP DATABASE successfully processed 418 pages in 5.373 seconds (0.607 MB/sec).
*/