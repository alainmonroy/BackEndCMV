﻿namespace ApiCMV.Models
{
    public class EditarCliente
    {
        public int Id_Cliente { get; set; }
        public string Nombre { get; set; }
        public string Apellido_Paterno { get; set; }
        public string Apellido_Materno { get; set; }
        public string RFC { get; set; }
        public string CURP { get; set; }
        public string NombreCuenta  { get; set; }
        public decimal Saldo { get; set; }
    }
}
