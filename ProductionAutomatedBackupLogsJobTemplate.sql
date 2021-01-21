DECLARE @name VARCHAR(100) -- database name  
declare @description varchar(102) --description for backup
DECLARE @path VARCHAR(256) -- path for backup files  
DECLARE @fileName VARCHAR(256) -- filename for backup  
DECLARE @fileDate VARCHAR(20) -- used for file name 
declare @fileTime varchar(20) -- used for file time
declare @i int --counter for while loop
declare @maxIdid int  --for while loop

SET @path = '\\raider5\Raider5LogBackup'

SELECT @fileDate = CONVERT(VARCHAR(20),GETDATE(),112) 
select @fileTime = replace(convert(time(0),GETDATE(),100),':','')

create table #tempDBName
(idid int not null identity(1,1)
, DBName varchar(100))

insert into #tempDBName
(DBName)
SELECT distinct(d.name)
FROM sys.master_files mf
join sys.databases d on d.database_id = mf.database_id
where mf.state = 0  -- only online
and recovery_model_desc = 'full'
order by d.name

select @maxIdid = MAX(idid) from #tempDBName

set @i = 1

WHILE @i <= @maxIdid   
BEGIN   
	select @name = DBName from #tempDBName where idid = @i
    SET @fileName = @path + '\' + @name + '_' + @fileDate + '_' + @fileTime + '_Log.BAK'
    set @description = @name + '_Log'
	IF exists (select 1 from master.dbo.sysdatabases where name = @name)  --make sure the db is still there
		BEGIN		
				--select @fileName
       			backup log @name to disk = @fileName 
       			with description = @description, compression
		END
	set @i = @i + 1
END   

drop table #tempDBName