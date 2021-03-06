﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TechnikSys.MoldManager.Domain.Entity;
using MoldManager.WebUI.Models.GridRowModel;
using MoldManager.WebUI.Models.Helpers;
using TechnikSys.MoldManager.Domain.Abstract;


namespace MoldManager.WebUI.Models.GridViewModel
{
    public class WHPOListGridViewModel
    {
        public List<WHPOListGridRowModel> rows;
        public int Page;
        public int Total;
        public int Records;

        public WHPOListGridViewModel(IEnumerable<PurchaseOrder> Orders, List<User> Users,ISupplierRepository _supplierRepository)
        {
            rows = new List<WHPOListGridRowModel>();
            string _userName;
            string _status;
            string _supplierName;
            foreach (PurchaseOrder _order in Orders)
            {
                try
                {
                    _userName = Users.Where(u => u.UserID == _order.Responsible).Select(u => u.FullName).FirstOrDefault();
                }
                catch
                {
                    _userName = "";
                }

                _status = Enum.GetName(typeof(PurchaseOrderStatus), _order.State);
                _status = _status == "发布" ? "待收货" : _status;
                _supplierName = (_supplierRepository.QueryByID(_order.SupplierID)??new Supplier()).Name;
                rows.Add(new WHPOListGridRowModel(_order, _userName, _status, _supplierName));
            }
            Page = 1;
            Total = Orders.Count();
            Records = Orders.Count(); ;
        }
    }
}