﻿SET NOCOUNT ON
GO

SELECT
	DB_NAME() AS DbName,
	SCHEMA_NAME(so.schema_id) AS SchemaName,
	so.name,
	dps.*
FROM
	sys.dm_db_partition_stats dps
	INNER JOIN
	sys.objects so
	ON
	so.object_id = dps.object_id
	AND
	SCHEMA_NAME(so.schema_id) <> 'sys'
WHERE index_id IN(0, 1)
ORDER BY so.name
OPTION (RECOMPILE)
