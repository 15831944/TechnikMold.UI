﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechnikSys.MoldManager.Domain.Abstract;
using TechnikSys.MoldManager.Domain.Entity;

namespace TechnikSys.MoldManager.Domain.Concrete
{
    public class SystemConfigRepository:ISystemConfigRepository
    {
        private EFDbContext _context = new EFDbContext();
        public IQueryable<SystemConfig> SystemConfigs
        {
            get { return _context.SystemConfigs; }
        }

        public string GetConfigValue(string Name)
        {
            SystemConfig _config = _context.SystemConfigs.Where(c => c.SettingName == Name).FirstOrDefault();
            try
            {
                #region UNC拼接
                if (_config.Value.IndexOf("\\") >= 0)
                {
                    string uncPanfu = _config.Value.Substring(0, _config.Value.IndexOf("\\"));
                    SystemConfig _configPanfu = _context.SystemConfigs.Where(c => c.SettingName == uncPanfu).FirstOrDefault();
                    if (_configPanfu != null)
                    {
                        string uncPath = _configPanfu.Value + _config.Value.Substring(_config.Value.IndexOf("\\"), _config.Value.Length - _config.Value.IndexOf("\\"));
                        return uncPath;
                    }
                }
                else
                {
                    return _config.Value;
                }                
                #endregion
            }

            catch {  }
            return null;
        }


        public int Save(string Name, string Value)
        {
            SystemConfig _config = _context.SystemConfigs.Where(c => c.SettingName == Name).FirstOrDefault();
            if (_config == null)
            {
                _config = new SystemConfig();
                _config.SettingName = Name;
                _config.Value = Value;
                _context.SystemConfigs.Add(_config);
            }
            else
            {
                _config.Value = Value;
            }
            _context.SaveChanges();
            return _config.SystemConfigID;
        }
        public string GetValueByName(string _configName)
        {
            var _config= _context.SystemConfigs.Where(s => s.SettingName == _configName).FirstOrDefault();
            if(_config!=null)
                return _config.Value;
            return string.Empty;
        }
        public string GetTaskDrawingPath(string type = "CAM")
        {
            string _pathSetting = type == "CAM" ? "CAMDrawingPath" : type == "CAD" ? "CADDrawingPath" : "CAMDrawingPath";
            string _path = "";
            SystemConfig _sysconfig = _context.SystemConfigs.Where(p => p.SettingName == _pathSetting).FirstOrDefault();
            if (_sysconfig != null)
            {
                _path = _sysconfig.Value;
                _path = _path.Substring(2, _path.Length - 2).Replace("\\", "/") + "/";
                return _path;
            }
            else
                return null;
        }
    }
}
