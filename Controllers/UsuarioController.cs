using Backend.Domain.IServices;
using Backend.Domain.Models;
using Backend.DTO;
using Backend.Utils;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace Backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        private readonly IUsuarioService _usuarioService;
        public UsuarioController(IUsuarioService usuarioService)
        {
            _usuarioService = usuarioService;
        }
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Usuario usuario)
        {
            try
            {                
                var validateExistence = await _usuarioService.ValidateExistence(usuario);
                if (validateExistence)
                {
                    return BadRequest(new { message = "El usuario " + usuario.NombreUsuario + " ya existe!" });
                }
                usuario.Password = Encriptar.EncriptarPassword(usuario.Password);
              
                await _usuarioService.SaveUser(usuario);

                return Ok(new { message = "Usuario registrado con exito!" });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // localhost:xxx/api/Usuario/CambiarPassword
        [Route("CambiarPassowrd")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [HttpPut]
        public async Task<IActionResult> CambiarPassword([FromBody] CambiarPasswordDTO cambiarPassword)
        {
            try
            {
                var identity = HttpContext.User.Identity as ClaimsIdentity;
                //int idUsuario = 1;
                int idUsuario = JwtConfigurator.GetTokenIdUsuario(identity);

                //else
                //{
                //usuario.Password = Encriptar.EncriptarPassword(cambiarPassword.nuevaPassword);
                //    await _usuarioService.UpdatePassword(usuario);             

                string passworldEncriptado = Encriptar.EncriptarPassword(cambiarPassword.passwordAnterior);
                var usuario = await _usuarioService.ValidatePassword(idUsuario, passworldEncriptado);

                if (usuario == null)
                {
                    return BadRequest(new  { message = "El passworl es incorrecto." });
                }

                usuario.Password = Encriptar.EncriptarPassword(cambiarPassword.nuevaPassword);
                
                await _usuarioService.UpdatePassword(usuario);

                return Ok(new { message = "La password fue actualizada con exito!" });                
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

    }
}
