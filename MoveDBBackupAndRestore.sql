--

use Tools

--some useful sql
select database_id
from sys.databases
where name = 'Tools'
--

select * 
from sys.database_files
where name = 'Tools'

backup database Tools
to disk = '\\us1-airwfs-m01\us1-airsql-p015\Tools.bak'
with compression


--restore headeronly
--from disk = '\\raider4\reportingbackup\staples_old_20110503.bak'

--restore filelistonly
--from disk = '\\raider4\reportingbackup\staples_old_20110503.bak'


--
restore database Tools
from disk = 'e:\backup\Tools.bak'
with move 'Tools' to 'e:\sqldata\Tools_data.mdf',
move 'Tools_log' to 'e:\sqllog\Tools_log.ldf'
--done