
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
    public class CuestionarioRepository: ICuestionarioRepository
    {
        private readonly AplicationDbContext _context;
        public CuestionarioRepository(AplicationDbContext context)
        {
            _context = context;
        }
        public async Task CreateCuestionario(Cuestionario cuestionario)
        {
            _context.Add(cuestionario);
            await _context.SaveChangesAsync();
        }
        public async Task<List<Cuestionario>> GetListCuestionarioByUser(int idUsuario)
        {
            var listCuestionario = await _context.Cuestionario.Where(x => x.Activo == 1
                                                    && x.UsuarioId == idUsuario).ToListAsync();
            return listCuestionario;
        }
        public async Task<Cuestionario> GetCuestionario(int idCuestionario)
        {
            var cuestionario = await _context.Cuestionario.Where(x => x.Id == idCuestionario
                                                                 && x.Activo == 1)
                                                                 .Include(x=> x.listPreguntas)
                                                                 .ThenInclude(x=>x.listRespuestas)
                                                                 .FirstOrDefaultAsync();
            return cuestionario;
        }

        public async Task<Cuestionario> BuscarCuestionario(int idCuestionario, int idUsuario)
        {
            var custionario = await _context.Cuestionario.Where(x => x.Id == idCuestionario && x.Activo == 1 
                                                          && x.UsuarioId == idUsuario).FirstOrDefaultAsync();
            return custionario;
        }
        public async Task EliminarCuestionario(Cuestionario cuestionario)
        {
            cuestionario.Activo = 0;
            _context.Entry(cuestionario).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task<List<Cuestionario>> GetListCuestionarios()
        {
            var listCuestionarios = await _context.Cuestionario.Where(x => x.Activo == 1)
                                                                .Select(o => new Cuestionario
                                                                {
                                                                    Id = o.Id,
                                                                    Nombre = o.Nombre,
                                                                    Descripcion = o.Descripcion,
                                                                    FechaCreacion = o.FechaCreacion,
                                                                    Usuario = new Usuario { NombreUsuario = o.Usuario.NombreUsuario }
                                                                }).ToListAsync();
            return listCuestionarios;
        }
    }
}
