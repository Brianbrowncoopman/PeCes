using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos.Clases
{
    public class PersonaNaturalEntity : ClienteEntity
    {

        public override string Informacion()
        {
            return base.Informacion() + $", Tipo: Persona Natural";
        }
    }
}
