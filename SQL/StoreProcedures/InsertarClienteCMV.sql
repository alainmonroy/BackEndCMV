IF EXISTS (SELECT * 
		  FROM sys.objects 
		  WHERE type = 'P' 
		  AND name = 'InsertaClienteCMV')
BEGIN
    DROP PROCEDURE InsertaClienteCMV
END
GO

CREATE PROCEDURE InsertaClienteCMV
	@Nombre varchar(40) = NULL,
	@ApellidoP varchar(30) = NULL,
	@ApellidoM varchar(30) = NULL,
	@RFC varchar(13) = NULL,
	@CURP varchar(18) = NULL,
	@NombreCuenta varchar(50) = NULL,
	@Saldo money
   
AS
BEGIN
	DECLARE @IdCliente INT, @IdCuenta INT;

    INSERT INTO TBL_CMV_CLIENTE 
		(Nombre, 
		Apellido_Paterno, 
		Apellido_Materno, 
		RFC, 
		CURP, 
		Fecha_Alta)
    VALUES 
		(@Nombre, 
		@ApellidoP, 
		@ApellidoM, 
		@RFC, 
		@CURP, 
		GETDATE());

    SET @IdCliente = SCOPE_IDENTITY();

    SELECT 
		@IdCuenta = Id_Cuenta
    FROM CAT_CMV_TIPO_CUENTA WITH (NOLOCK)
    WHERE Nombre_Cuenta = @NombreCuenta;

    INSERT INTO TBL_CMV_CLIENTE_CUENTA 
		(Id_Cliente, 
		Id_Cuenta, 
		Saldo_Actual, 
		Fecha_Contratacion, 
		Fecha_Ultimo_Movimiento)
    VALUES 
		(@IdCliente, 
		@IdCuenta, 
		@Saldo, 
		GETDATE(), 
		GETDATE())
END
