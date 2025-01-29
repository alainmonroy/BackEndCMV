IF EXISTS (SELECT * 
		  FROM sys.objects 
		  WHERE type = 'P' 
		  AND name = 'InsertarClienteCMV')
BEGIN
    DROP PROCEDURE InsertarClienteCMV
END
GO

CREATE PROCEDURE InsertarClienteCMV
	@Nombre varchar(40) = NULL,
	@ApellidoP varchar(30) = NULL,
	@ApellidoM varchar(30) = NULL,
	@RFC varchar(13) = NULL,
	@CURP varchar(18) = NULL
   
AS
BEGIN
	INSERT INTO TBL_CMV_CLIENTE(
			Nombre , 
			Apellido_Paterno,
			Apellido_Materno,
			RFC,
			CURP,
			Fecha_Alta
			)
        VALUES (
			@Nombre,
			@ApellidoP,
			@ApellidoM,
			@RFC,
			@CURP,
			GETDATE()
		)
END
