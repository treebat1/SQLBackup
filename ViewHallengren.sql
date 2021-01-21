

select command, commandtype, StartTime, EndTime, errornumber, ErrorMessage
from sys_admin.dbo.CommandLog
where databasename = 'ws_datamart'
and commandtype = 'xp_delete_file'
order by StartTime desc



/*
select command, commandtype, StartTime, EndTime, errornumber, ErrorMessage
from sys_admin.dbo.CommandLog
where databasename = 'ws_datamart'
order by StartTime desc
*/