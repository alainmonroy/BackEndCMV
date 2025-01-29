CREATE TABLE TBL_CMV_CLIENTE_CUENTA (
    Id_Cliente_Cuenta int IDENTITY PRIMARY KEY,
    Id_Cliente int,
    Id_Cuenta int,
    Saldo_Actual money,
    Fecha_Contratacion datetime,
    Fecha_Ultimo_Movimiento datetime,
    CONSTRAINT FK_Id_Cliente FOREIGN KEY (Id_Cliente) REFERENCES TBL_CMV_CLIENTE (Id_Cliente),
    CONSTRAINT FK_Id_Cuenta FOREIGN KEY (Id_Cuenta) REFERENCES CAT_CMV_TIPO_CUENTA (Id_Cuenta)
)

INSERT INTO TBL_CMV_CLIENTE_CUENTA 
    (Id_Cliente, 
    Id_Cuenta, 
    Saldo_Actual, 
    Fecha_Contratacion, 
    Fecha_Ultimo_Movimiento)
VALUES
    (1, 3, 850.40, '2024-04-18 13:12:24.000', '2025-01-10 15:20:40.000'),
    (2, 2, 2039.20, '2023-10-11 11:30:34.000', '2024-12-11 20:08:30.000'),
    (3, 1, 903.40, '2024-11-21 14:20:50.000', '2025-01-20 18:10:14.000');

