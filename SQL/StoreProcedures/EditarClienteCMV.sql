IF EXISTS (SELECT * 
		  FROM sys.objects 
		  WHERE type = 'P' 
		  AND name = 'EditarClienteCMV')
BEGIN
    DROP PROCEDURE EditarClienteCMV
END
GO

CREATE PROCEDURE EditarClienteCMV
	@IdCliente int = NULL,
	@Nombre varchar(40) = NULL,
	@ApellidoP varchar(30) = NULL,
	@ApellidoM varchar(30) = NULL,
	@RFC varchar(13) = NULL,
	@CURP varchar(18) = NULL
   
AS
BEGIN
	UPDATE TBL_CMV_CLIENTE WITH (ROWLOCK)
        SET Nombre = @Nombre, 
			Apellido_Paterno = @ApellidoP, 
			Apellido_Materno = @ApellidoM, 
			RFC = @RFC, 
			CURP = @CURP,
			Fecha_Alta = GETDATE()
        WHERE Id_Cliente =  @IdCliente
END