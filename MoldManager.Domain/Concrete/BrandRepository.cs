﻿/*
 * Create By:lechun1
 * 
 * Description:
 * 
 */



using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechnikSys.MoldManager.Domain.Abstract;
using TechnikSys.MoldManager.Domain.Entity;

namespace TechnikSys.MoldManager.Domain.Concrete
{
    public class BrandRepository:IBrandRepository
    {
        private EFDbContext _context = new EFDbContext();
        public IQueryable<Brand> Brands
        {
            get 
            {
                return _context.Brands;
            }
        }

        public int Save(Brand Brand)
        {
            if (Brand.BrandID == 0)
            {
                _context.Brands.Add(Brand);
            }
            else
            {
                Brand _dbEntry = _context.Brands.Find(Brand.BrandID);
                if (_dbEntry != null)
                {
                    _dbEntry.Name = Brand.Name;
                    _dbEntry.Enabled = Brand.Enabled;
                    _dbEntry.Type = Brand.Type;
                }
            }
            _context.SaveChanges();
            return Brand.BrandID;
        }

        public Brand QueryByID(int id)
        {
            Brand _dbEntry = _context.Brands.Where(b => b.BrandID.Equals(id)).Where(b => b.Enabled == true).FirstOrDefault();
            return _dbEntry;
        }

        public IQueryable<Brand> QueryByName(string Name)
        {
            IQueryable<Brand> _dbEntry = _context.Brands.Where(b => b.Name.Contains(Name)).Where(b=>b.Enabled==true);
            return _dbEntry;
        }

        public IQueryable<Brand> QueryAll()
        {
            IQueryable<Brand> _dbEntry = _context.Brands.Where(b => b.Enabled == true);
            return _dbEntry;
        }
        /// <summary>
        /// 根据类型获取品牌
        /// </summary>
        /// <param name="_type">模具材料;生产耗材</param>
        /// <returns></returns>
        public IQueryable<Brand> QueryByType(string _type)
        {
            IQueryable<Brand> _dbEntry = _context.Brands.Where(b => b.Type.Contains(_type)).Where(b => b.Enabled == true);
            return _dbEntry;
        }

        public int Delete(int BrandID)
        {
            Brand _dbEntry = _context.Brands.Find(BrandID);
            _dbEntry.Enabled = false;
            _context.SaveChanges();
            return BrandID;
        }


        //public Brand QueryByID(int BrandID)
        //{
        //    return _context.Brands.Find(BrandID);
        //}
    }
}
