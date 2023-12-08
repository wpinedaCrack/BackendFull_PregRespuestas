using Backend.Domain.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Backend.Persistencia.Context
{
    public class AplicationDbContext: DbContext
    {
        public DbSet<Usuario> Usuario { get; set; }        
        public DbSet<Pregunta> Pregunta { get; set; }
        public DbSet<Cuestionario> Cuestionario { get; set; }
        public DbSet<Respuesta> Respuesta { get; set; }

        public DbSet<RespuestaCuestionario> RespuestaCuestionario { get; set; }
        public DbSet<RespuestaCuestionarioDetalle> RespuestaCuestionarioDetalle { get; set; }

        public AplicationDbContext(DbContextOptions<AplicationDbContext> options) : base(options)
        { }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //modelBuilder.Entity<RespuestaCuestionarioDetalle>()
            //.HasKey(ur => new { ur.Id });//LLave Primaria

            //modelBuilder.Entity<RespuestaCuestionarioDetalle>()
            //    .HasOne(ur => ur.RespuestaCuestionario)
            //    .WithMany(u => u.)
            //    .HasForeignKey(ur => ur.);// 1 comercio tiene muchos servicios

            //modelBuilder.Entity<RespuestaCuestionarioDetalle>()
            //.HasKey(ec => new { ec.Id });

            base.OnModelCreating(modelBuilder);
        }
    }
}
