using Datos.Clases;
using Modelo.clases;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Modelo.clases
{
    public static class TicketController
    {
        public static string Create(Ticket ticket)//create 
        {
            if (ticket.Cliente == null)
                return "Error: Cliente no puede ser nulo";

            ClienteEntity clienteEntity;

            // Conversión EXPLÍCITA a tipos específicos
            if (ticket.Cliente is Empresa empresa)
            {
                clienteEntity = new EmpresaEntity
                {
                    Id = empresa.Id,
                    Nombre = empresa.Nombre,
                    Rut = empresa.Rut,
                    Telefono = empresa.Telefono,
                    Email = empresa.Email,
                    RazonSocial = empresa.RazonSocial
                };
            }
            else if (ticket.Cliente is PersonaNatural persona)
            {
                clienteEntity = new PersonaNaturalEntity
                {
                    Id = persona.Id,
                    Nombre = persona.Nombre,
                    Rut = persona.Rut,
                    Telefono = persona.Telefono,
                    Email = persona.Email
                };
            }
            else
            {
                // Manejo del tipo base (Cliente)
                clienteEntity = new ClienteEntity
                {
                    Id = ticket.Cliente.Id,
                    Nombre = ticket.Cliente.Nombre,
                    Rut = ticket.Cliente.Rut,
                    Telefono = ticket.Cliente.Telefono,
                    Email = ticket.Cliente.Email
                };
            }

            var ticketEntity = new TicketEntity
            {
                Cliente = clienteEntity,
                Producto = ticket.Producto,
                Descripción = ticket.Descripción,
                Estado = ticket.Estado
            };

            TicketEntityCollection.ListadoTickets.Add(ticketEntity);
            return "Ticket creado exitosamente.";
        }

        public static Ticket Read(string id) //read
        {
            // Usar List.Find() para buscar por ID
            var ticketEntity = TicketEntityCollection.ListadoTickets.Find(t => t.Id == id);

            if (ticketEntity == null) return null;

            // Transformar ClienteEntity al tipo correcto del modelo
            Cliente clienteModel = null;

            if (ticketEntity.Cliente is EmpresaEntity empresaEntity)
            {
                clienteModel = new Empresa
                {
                    Id = empresaEntity.Id,
                    Nombre = empresaEntity.Nombre,
                    Rut = empresaEntity.Rut,
                    Telefono = empresaEntity.Telefono,
                    Email = empresaEntity.Email,
                    RazonSocial = empresaEntity.RazonSocial
                };
            }
            else if (ticketEntity.Cliente is PersonaNaturalEntity personaEntity)
            {
                clienteModel = new PersonaNatural
                {
                    Id = personaEntity.Id,
                    Nombre = personaEntity.Nombre,
                    Rut = personaEntity.Rut,
                    Telefono = personaEntity.Telefono,
                    Email = personaEntity.Email
                };
            }
            else if (ticketEntity.Cliente != null)
            {
                clienteModel = new Cliente
                {
                    Id = ticketEntity.Cliente.Id,
                    Nombre = ticketEntity.Cliente.Nombre,
                    Rut = ticketEntity.Cliente.Rut,
                    Telefono = ticketEntity.Cliente.Telefono,
                    Email = ticketEntity.Cliente.Email
                };
            }

            // Crear objeto Ticket del modelo
            return new Ticket
            {
                Id = ticketEntity.Id,
                Cliente = clienteModel,
                Producto = ticketEntity.Producto,
                Descripción = ticketEntity.Descripción,
                Estado = ticketEntity.Estado
            };
        }

        public static string Update(string id, string producto, string descripcion,
                            string estado, string telefono, string email)
        {
            // Buscar el ticket por ID usando List.Find()
            var ticketEntity = TicketEntityCollection.ListadoTickets.Find(t => t.Id == id);

            if (ticketEntity == null)
                return "Error: Ticket no encontrado";

            // Actualizar propiedades del ticket
            ticketEntity.Producto = producto;
            ticketEntity.Descripción = descripcion;
            ticketEntity.Estado = estado;

            // Actualizar propiedades del cliente asociado
            if (ticketEntity.Cliente != null)
            {
                ticketEntity.Cliente.Telefono = telefono;
                ticketEntity.Cliente.Email = email;
            }

            return "Ticket actualizado exitosamente";
        }

        public static string Delete(string id)
        {
            // Buscar el ticket por ID usando List.Find()
            var ticketEntity = TicketEntityCollection.ListadoTickets.Find(t => t.Id == id);

            if (ticketEntity == null)
                return "Error: Ticket no encontrado";

            // Eliminar el ticket encontrado usando List.Remove()
            bool eliminado = TicketEntityCollection.ListadoTickets.Remove(ticketEntity);

            return eliminado
                ? "Ticket eliminado exitosamente"
                : "Error: No se pudo eliminar el ticket";
        }

        public static List<Ticket> ReadAll()
        {
            // Crear lista para almacenar los tickets convertidos
            List<Ticket> ticketsModelo = new List<Ticket>();

            // Recorrer todos los tickets en la capa de datos
            foreach (var ticketEntity in TicketEntityCollection.ListadoTickets)
            {
                // Convertir cada TicketEntity a Ticket del modelo
                ticketsModelo.Add(ConvertirTicketAModelo(ticketEntity));
            }

            return ticketsModelo;
        }

        private static Ticket ConvertirTicketAModelo(TicketEntity entity)
        {
            // Convertir ClienteEntity al tipo correcto del modelo
            Cliente clienteModel = null;

            if (entity.Cliente is EmpresaEntity empresaEntity)
            {
                clienteModel = new Empresa
                {
                    Id = empresaEntity.Id,
                    Nombre = empresaEntity.Nombre,
                    Rut = empresaEntity.Rut,
                    Telefono = empresaEntity.Telefono,
                    Email = empresaEntity.Email,
                    RazonSocial = empresaEntity.RazonSocial
                };
            }
            else if (entity.Cliente is PersonaNaturalEntity personaEntity)
            {
                clienteModel = new PersonaNatural
                {
                    Id = personaEntity.Id,
                    Nombre = personaEntity.Nombre,
                    Rut = personaEntity.Rut,
                    Telefono = personaEntity.Telefono,
                    Email = personaEntity.Email
                };
            }
            else if (entity.Cliente != null)
            {
                clienteModel = new Cliente
                {
                    Id = entity.Cliente.Id,
                    Nombre = entity.Cliente.Nombre,
                    Rut = entity.Cliente.Rut,
                    Telefono = entity.Cliente.Telefono,
                    Email = entity.Cliente.Email
                };
            }

            // Crear y retornar objeto Ticket del modelo
            return new Ticket
            {
                Id = entity.Id,
                Cliente = clienteModel,
                Producto = entity.Producto,
                Descripción = entity.Descripción,
                Estado = entity.Estado
            };
        }

        public static List<Ticket> Search(string filtro)
        {
            // Si el filtro está vacío, retornar todos los tickets
            if (string.IsNullOrWhiteSpace(filtro))
                return ReadAll();

            // Crear lista para almacenar los resultados
            List<Ticket> resultados = new List<Ticket>();

            // Convertir el filtro a minúsculas para búsqueda insensible a mayúsculas
            string filtroLower = filtro.ToLower();

            // Buscar en todos los tickets
            foreach (var ticketEntity in TicketEntityCollection.ListadoTickets)
            {
                // Verificar coincidencias en los campos especificados
                bool coincideNombre = ticketEntity.Cliente?.Nombre?.ToLower().Contains(filtroLower) ?? false;
                bool coincideRut = ticketEntity.Cliente?.Rut?.ToLower().Contains(filtroLower) ?? false;
                bool coincideEstado = ticketEntity.Estado?.ToLower().Contains(filtroLower) ?? false;

                // Si coincide en al menos un campo, agregar a resultados
                if (coincideNombre || coincideRut || coincideEstado)
                {
                    resultados.Add(ConvertirTicketAModelo(ticketEntity));
                }
            }

            return resultados;
        }

        // Método auxiliar para conversión ENTITY -> MODELO

    }
}