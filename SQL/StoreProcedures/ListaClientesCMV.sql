IF EXISTS (SELECT * 
		  FROM sys.objects 
		  WHERE type = 'P' 
		  AND name = 'ListaClientesCMV')
BEGIN
    DROP PROCEDURE ListaClientesCMV
END
GO

CREATE PROCEDURE ListaClientesCMV
   
AS
BEGIN
	SELECT
		Id_Cliente,
		Nombre,
		Apellido_Paterno,
		Apellido_Materno,
		RFC,
		CURP,
		Fecha_Alta
    FROM TBL_CMV_CLIENTE WITH (NOLOCK)
END