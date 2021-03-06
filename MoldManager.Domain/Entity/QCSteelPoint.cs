﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TechnikSys.MoldManager.Domain.Entity
{
    public class QCSteelPoint
    {
        public 	int	QCSteelPointID	{ get; set; }
        public 	int	OldID	{ get; set; }
        public 	string	PartName	{ get; set; }
        public 	int	Rev	{ get; set; }
        public 	string	Csys	{ get; set; }
        public 	string	MoldName	{ get; set; }
        public 	string	FullPartName	{ get; set; }
        public 	string	XYZName	{ get; set; }
        public 	int	Clearance	{ get; set; }
        public 	int	Status	{ get; set; }
        public 	string	PartName3D	{ get; set; }
        public 	DateTime CreateDate	{ get; set; }
        public 	string	CreateComputer	{ get; set; }
        public 	string	CreateBy	{ get; set; }
        public 	string	DeleteBy	{ get; set; }
        public 	DateTime DeleteDate	{ get; set; }
        public 	bool	Enabled	{ get; set; }
    }
}
