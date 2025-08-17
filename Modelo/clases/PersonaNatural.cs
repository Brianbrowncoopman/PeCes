using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo.clases
{
    public class PersonaNatural : Cliente
    {
        public override string Informacion()
        {
            return base.Informacion() + $", Tipo: Persona Natural";
        }
    }
}
