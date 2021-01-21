
declare @txt as varchar(1000)

set @txt = ''

SELECT @txt = case when @txt = '' then '''' + d.name + '''' else @txt + ', ''' + d.name + '''' end
from sys.databases d 
left join msdb.dbo.backupset S
on d.name = s.database_name
WHERE s.database_name is null
and d.name not in ('model', 'tempdb')
order by d.name

select @txt

                    
