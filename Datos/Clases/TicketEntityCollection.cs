﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos.Clases
{
    public static class TicketEntityCollection 
    {

        
        private static List<TicketEntity> _listadoTickets = new List<TicketEntity>();
        public static  List<TicketEntity> ListadoTickets
        {
            get
            {
                return _listadoTickets;
            }
            set
            {
                 _listadoTickets = value;
            }
        }

        //public static object ListadoTickets { get; set; }
    }

}
