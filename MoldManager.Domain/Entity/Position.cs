﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TechnikSys.MoldManager.Domain.Entity
{
    public class Position
    {
        public int PositionID { get; set; }
        public string  Name { get; set; }
        public bool Enabled { get; set; }
    }
}
