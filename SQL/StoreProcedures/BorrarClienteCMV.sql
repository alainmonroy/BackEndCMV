IF EXISTS (SELECT * 
		  FROM sys.objects 
		  WHERE type = 'P' 
		  AND name = 'BorrarClienteCMV')
BEGIN
    DROP PROCEDURE BorrarClienteCMV
END
GO

CREATE PROCEDURE BorrarClienteCMV
	@IdCliente int = NULL
   
AS
BEGIN
	DELETE FROM TBL_CMV_CLIENTE
        WHERE Id_Cliente = @IdCliente
END