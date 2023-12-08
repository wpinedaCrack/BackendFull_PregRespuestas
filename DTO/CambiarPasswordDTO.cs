using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Backend.DTO
{
    public class CambiarPasswordDTO
    {
        public string passwordAnterior { get; set; }
        public string nuevaPassword { get; set; }
    }
}
