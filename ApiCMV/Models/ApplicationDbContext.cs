using Microsoft.EntityFrameworkCore;

namespace ApiCMV.Models
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

        public DbSet<Cliente> Clientes { get; set; }
        public DbSet<ClienteCuentas> CuentasCliente { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            
            modelBuilder.Entity<Cliente>().HasNoKey();
            modelBuilder.Entity<ClienteCuentas>().HasNoKey();
        }
    }
}
