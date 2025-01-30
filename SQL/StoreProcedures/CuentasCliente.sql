IF EXISTS (SELECT * 
		  FROM sys.objects 
		  WHERE type = 'P' 
		  AND name = 'CuentasClientesCMV')
BEGIN
    DROP PROCEDURE CuentasClientesCMV
END
GO

CREATE PROCEDURE CuentasClientesCMV
AS
BEGIN
	SELECT 
		CTA.Id_Cliente,
		CONCAT(C.Nombre, ' ', C.Apellido_Paterno, ' ', C.Apellido_Materno) as Nombre,
		T.Nombre_Cuenta AS TipoCuenta,
		C.RFC,
		C.CURP,
		C.Fecha_Alta AS Registro,
		CTA.Saldo_Actual AS Saldo,
		CTA.Fecha_Contratacion AS Contratacion,
		CTA.Fecha_Ultimo_Movimiento AS UltimoMovimiento
	FROM TBL_CMV_CLIENTE C WITH(NOLOCK)
	JOIN TBL_CMV_CLIENTE_CUENTA CTA WITH(NOLOCK)
		ON C.Id_Cliente = CTA.Id_Cliente
	JOIN CAT_CMV_TIPO_CUENTA T WITH(NOLOCK)
		ON CTA.Id_Cuenta = T.Id_Cuenta
END