using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos.Clases
{
    public class ClienteEntity
    {
        public string Id { get; set; } = Guid.NewGuid().ToString();

        public string Nombre { get; set; }

        public string Rut { get; set; }

        public string Telefono { get; set; }

        public string Email { get; set; }

        public virtual string Informacion()
        {            
            return $"Id: {Id},Nombre: {Nombre}, RUT: {Rut}, Teléfono: {Telefono}, Email: {Email}";
        }  

    }
}
