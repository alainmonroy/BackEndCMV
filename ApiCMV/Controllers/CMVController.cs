using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ApiCMV.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace ApiCMV.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CMVController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public CMVController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("Lista")]
        public async Task<IActionResult> ListaClientes()
        {
            try
            {
                var clientes = await _context.Clientes
                    .FromSqlRaw("EXEC ListaClientesCMV")
                    .ToListAsync();

                return StatusCode(StatusCodes.Status200OK, new { response = clientes });
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { mensaje = ex.Message });
            }
        }

        [HttpPost]
        [Route("InsertarCliente")]
        public async Task<IActionResult> InsertarCliente([FromBody] InsertarCliente cliente)
        {
            try
            {
                if (cliente == null)
                {
                    return BadRequest(new { mensaje = "Cliente no puede ser nulo." });
                }

                var result = await _context.Database.ExecuteSqlRawAsync(
                    "EXEC InsertaClientesCMV @Nombre, @ApellidoP, @ApellidoM, @RFC, @CURP, @NombreCuenta, @Saldo",
                    new SqlParameter("@Nombre", cliente.Nombre ?? (object)DBNull.Value),
                    new SqlParameter("@ApellidoP", cliente.Apellido_Paterno ?? (object)DBNull.Value),
                    new SqlParameter("@ApellidoM", cliente.Apellido_Materno ?? (object)DBNull.Value),
                    new SqlParameter("@RFC", cliente.RFC ?? (object)DBNull.Value),
                    new SqlParameter("@CURP", cliente.CURP ?? (object)DBNull.Value),
                    new SqlParameter("@NombreCuenta", cliente.NombreCuenta ?? (object)DBNull.Value),
                    new SqlParameter("@Saldo", cliente.Saldo)
                );

                return Ok(new { mensaje = "Cliente insertado correctamente." });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { mensaje = ex.Message });
            }
        }

        [HttpPut]
        [Route("EditarCliente")]
        public async Task<IActionResult> EditarCliente([FromBody] EditarCliente cliente)
        {
            try
            {
                if (cliente == null || cliente.Id_Cliente <= 0)
                {
                    return BadRequest(new { mensaje = "Los datos del cliente no son válidos." });
                }

                var result = await _context.Database.ExecuteSqlRawAsync(
                    "EXEC EditarClienteCMV @IdCliente, @Nombre, @ApellidoP, @ApellidoM, @RFC, @CURP, @NombreCuenta, @Saldo",
                    new SqlParameter("@IdCliente", cliente.Id_Cliente),
                    new SqlParameter("@Nombre", (object)cliente.Nombre ?? DBNull.Value),
                    new SqlParameter("@ApellidoP", (object)cliente.Apellido_Paterno ?? DBNull.Value),
                    new SqlParameter("@ApellidoM", (object)cliente.Apellido_Materno ?? DBNull.Value),
                    new SqlParameter("@RFC", (object)cliente.RFC ?? DBNull.Value),
                    new SqlParameter("@CURP", (object)cliente.CURP ?? DBNull.Value),
                    new SqlParameter("@NombreCuenta", cliente.NombreCuenta ?? (object)DBNull.Value),
                    new SqlParameter("@Saldo", cliente.Saldo)
                );

                return Ok(new { mensaje = "Cliente editado correctamente." });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { mensaje = ex.Message });
            }
        }

        [HttpDelete]
        [Route("BorrarCliente")]
        public async Task<IActionResult> BorrarCliente([FromQuery] int idCliente)
        {
            try
            {
                if (idCliente <= 0)
                {
                    return BadRequest(new { mensaje = "El ID del cliente no es válido." });
                }

                var result = await _context.Database.ExecuteSqlRawAsync(
                    "EXEC BorrarClienteCMV @IdCliente",
                    new SqlParameter("@IdCliente", idCliente)
                );

                return Ok(new { mensaje = "Cliente borrado correctamente." });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { mensaje = ex.Message });
            }
        }

        [HttpGet]
        [Route("ClienteCuentas")]
        public async Task<IActionResult> ClienteCuentas()
        {
            try
            {
                var clientes = await _context.CuentasCliente
                    .FromSqlRaw("EXEC CuentasClientesCMV")
                    .ToListAsync();

                return StatusCode(StatusCodes.Status200OK, new { response = clientes });
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { mensaje = ex.Message });
            }
        }
    }
}
