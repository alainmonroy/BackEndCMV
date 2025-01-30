using System.ComponentModel.DataAnnotations.Schema;

namespace ApiCMV.Models
{
    public class ClienteCuentas
    {
        public int Id_Cliente { get; set; }
        public string Nombre { get; set; }
        public string TipoCuenta { get; set; }
        public string RFC   { get; set; }
        public string CURP { get; set; }
        public DateTime Registro { get; set; }
        public decimal Saldo { get; set; }
        public DateTime Contratacion { get; set; }
        public DateTime UltimoMovimiento { get; set; }
    }
}
