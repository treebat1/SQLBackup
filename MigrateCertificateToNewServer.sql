--SOURCE SERVER

select db_name(database_id) DBName
, case encryption_state 
when 1 then 'unencrypted'
when 3 then 'encrypted'
end AS EncryptionStatus
, create_date, regenerate_date, modify_date, set_date, opened_date, key_algorithm
, key_length, encryptor_thumbprint, percent_complete
from sys.dm_database_encryption_keys


use master;
GO
select * FROM [master].[sys].[certificates]

select * from sys.symmetric_keys

backup master key to file = 'D:\TDE\MasterKey'  
encryption by password = ''  



BACKUP CERTIFICATE TDE_Cert
TO FILE = 'd:\TDE\TDE_Certificate'  
WITH PRIVATE KEY   
(  
    FILE = 'd:\TDE\TDE_Certificate_PrivateKeyFile',  
    ENCRYPTION BY PASSWORD = 'xxxxxx'  --Stored in Secret Server
);  
GO  


/*
BACKUP CERTIFICATE TDE_Cert  
TO FILE = 'd:\TDE\TestSQLServerCert2'  
    WITH PRIVATE KEY ( DECRYPTION BY PASSWORD = '' ,  
    FILE = 'd:\TDE\TestSQLServerCertPrivateKeyFile2' ,   
    ENCRYPTION BY PASSWORD = ';  
GO  

Msg 15147, Level 16, State 1, Line 27
No decryption password should be provided because the private key of this certificate is encrypted by a master key.
*/

-------------------------------------------------------------------------

--DESTINATION SERVER

use master;
GO
select * FROM [master].[sys].[certificates]

select * from sys.symmetric_keys

-- Restore database master key on the destination instance of SQL Server.   
USE master
go
RESTORE MASTER KEY   
    FROM FILE = 'D:\TDE\MasterKey'   
    DECRYPTION BY PASSWORD = ''
	Encryption by password = 'xxxxxxxxxx';-- 'Stored in Secret Server'

select * from sys.symmetric_keys

use master
go
OPEN MASTER KEY DECRYPTION BY PASSWORD = 'xxxxxxxxxx';-- 'Stored in Secret Server'   

use master
go
CREATE CERTIFICATE TDE_Cert 
FROM FILE = 'd:\TDE\TDE_Certificate'  
WITH PRIVATE KEY   
(  
    FILE = 'd:\TDE\TDE_Certificate_PrivateKeyFile',
    DECRYPTION BY PASSWORD = 'xxxxxx'  --Stored in Secret Server 
);  
GO  


use master;
GO
select * FROM [master].[sys].[certificates]
