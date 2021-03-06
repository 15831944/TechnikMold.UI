﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechnikSys.MoldManager.Domain.Entity;

namespace TechnikSys.MoldManager.Domain.Abstract
{
    public interface IWarehouseRequestItemRepository
    {
        IQueryable<WarehouseRequestItem> WarehouseRequestItems { get; }

        int Save(WarehouseRequestItem WarehouseRequestItem);

        int Receive(int WarehouseRequestItemID, int Quantity);

        IEnumerable<WarehouseRequestItem> QueryByRequestID(int WarehouseRequestID);

        WarehouseRequestItem QueryByName(string PartName, string PartNumber);

        WarehouseRequestItem QueryByID(int WarehouseRequestItemID);
    }
}
