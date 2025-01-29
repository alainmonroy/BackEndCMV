CREATE TABLE CAT_CMV_TIPO_CUENTA (
    Id_Cuenta int IDENTITY PRIMARY KEY,
    Nombre_Cuenta varchar(50)
)

INSERT INTO CAT_CMV_TIPO_CUENTA (Nombre_Cuenta)
VALUES
('AbicuentaCMV'),
('PersonalCMV'),
('CrediProntoCMV');
