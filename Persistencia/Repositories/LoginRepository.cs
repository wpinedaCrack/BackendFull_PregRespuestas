using Backend.Domain.IRepositories;
using Backend.Domain.Models;
using Backend.Persistencia.Context;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Backend.Persistencia.Repositories
{
    public class LoginRepository : ILoginRepository
    {
        private readonly AplicationDbContext _context;
        public LoginRepository(AplicationDbContext context)
        {
            _context = context;
        }

        public async Task<Usuario> ValidateUser(Usuario usuario)
        {
            var user = await _context.Usuario.Where(x => x.NombreUsuario == usuario.NombreUsuario
                                                && x.Password == usuario.Password).FirstOrDefaultAsync();
            return user;
        }
    }
}
