using Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos.Clases;

namespace Modelo.clases
{
    public class Ticket
    {
        public string Id { get; set; } 

        public ClienteEntity Cliente { get; set; }

        public string Producto { get; set; }

        public string Descripción { get; set; }

        public string Estado { get; set; }

        public DateTime _createdAt { get; set; } = DateTime.Now;


        public string CreatedAt()
        {
            _createdAt = DateTime.Now;
            return _createdAt.ToString() + " - " + _createdAt.ToString();
        }
    }
}

