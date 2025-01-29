CREATE TABLE TBL_CMV_CLIENTE (
    Id_Cliente int IDENTITY PRIMARY KEY,
    Nombre varchar(40),
    Apellido_Paterno varchar(30),
    Apellido_Materno varchar(30),
    RFC varchar(13),
    CURP varchar(18),
    Fecha_Alta datetime
)

INSERT INTO TBL_CMV_CLIENTE 
    (Nombre, 
    Apellido_Paterno, 
    Apellido_Materno, 
    RFC, 
    CURP, 
    Fecha_Alta)
VALUES
    ('Israel', 'Jimenez', 'Gomez', 'GOIJ990912734', 'GOIJ990912JDNSML05', '2024-06-21'),
    ('Luis', 'Diaz', 'Vera', 'VEDL860212564', 'VEDL860212KQODML06', '2024-10-11'),
    ('Mariana', 'Gonzalez', 'De Leon', 'DLGM970801671', 'DLGM970801WTEIDM04', '2024-02-19');
