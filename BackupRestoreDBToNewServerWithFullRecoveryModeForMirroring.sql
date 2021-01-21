--check to make sure have right server for backup/restore

--currently on t11
--moving to t12



backup database TestMirroring to disk = 'H:\mssql\data\backups\TestMirroring.bak'
with init, compression

backup log TestMirroring to disk = 'H:\mssql\data\backups\TestMirroring_Log.bak'
with init, compression




restore database TestMirroring
from disk = 'H:\mssql\data\backups\TestMirroring.bak'
with norecovery
--with move 'Academy' to 'E:\DriveF\SQL Server Data\Academy.mdf'
--, move 'Academy_log' to 'E:\DriveF\SQL Server Data\Academy_log.ldf'

restore log TestMirroring
from disk = 'H:\mssql\data\backups\TestMirroring_Log.bak'
with norecovery


----autofix Resonance
--use Academy
--go
--sp_change_users_login 'Update_One','Resonance','Resonance'

