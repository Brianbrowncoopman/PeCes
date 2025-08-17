using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo.clases
{
    public class Empresa : Cliente
    {
        
        public string RazonSocial { get; set; }
        public override string Informacion()
        {
            return $"Id: {Id},Nombre: {Nombre}, RUT: {Rut},Razon Social: {RazonSocial}, Teléfono: {Telefono}, Email: {Email}";
        }
    }
}
