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


BACKUP CERTIFICATE TDE_Cert
TO FILE = 'd:\TDE\TestSQLServerCert'  
WITH PRIVATE KEY   
(  
    FILE = 'd:\TDE\TestSQLServerCertPrivateKeyFile',  
    ENCRYPTION BY PASSWORD = ''  
);  
GO  



BACKUP CERTIFICATE TDE_Cert  
TO FILE = 'd:\TDE\TestSQLServerCert2'  
    WITH PRIVATE KEY ( DECRYPTION BY PASSWORD = '' ,  
    FILE = 'd:\TDE\TestSQLServerCertPrivateKeyFile2' ,   
    ENCRYPTION BY PASSWORD = ';  
GO  

/*
Msg 15147, Level 16, State 1, Line 27
No decryption password should be provided because the private key of this certificate is encrypted by a master key.
*/
