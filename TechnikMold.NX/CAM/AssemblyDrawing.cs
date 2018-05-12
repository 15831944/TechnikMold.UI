﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechnikSys.MoldManager.Domain.Entity;
using TechnikSys.MoldManager.NX.Common;
using Newtonsoft.Json;

namespace TechnikSys.MoldManager.NX.CAM
{
    public  class AssemblyDrawing
    {
        private WebServer _server;

        public AssemblyDrawing(WebServer Server)
        {
            _server = Server;
        }

        public AssemblyDrawing(string ServerName, string Port)
        {
            _server = new WebServer(ServerName, Port, "Le Chunming", "1qaz@WSX");
        }
        /// <summary>
        /// SELECT *FROM MACH_DrawingServerPath where active=1
        /// </summary>
        /// <returns></returns>
        public  string DrawingServerPath()
        {

            string _url = "/Task/GetSetting?Name=CAMDrawingPath";
            string _path = _server.ReceiveStream(_url);
            return _path;
        }

        /// <summary>
        /// PR_ImportPDFDrawingInfo
        /// </summary>
        /// <param name="DrawName"></param>
        /// <param name="MoldNumber"></param>
        /// <param name="CreateBy"></param>
        public  void SaveDrawingInfo(string DrawName, string MoldNumber, string CreateBy)
        {
            DrawName=DrawName.Replace("+", "%2B");
            string _url = "/Task/SaveCAMDrawing?DrawName=" + DrawName + "&MoldName=" + MoldNumber + "&UserName=" + CreateBy;
            int _result = Convert.ToInt16(_server.ReceiveStream(_url));

        }

        /// <summary>
        /// select *from MACH_CAMDrawing where DrawingName='{0}' and lock=1
        /// </summary>
        /// <param name="DrawName"></param>
        /// <returns></returns>
        public  CAMDrawing GetCAMDrawing(string DrawName)
        {
            DrawName = DrawName.Replace("+", "%2B");
            string _url = "/Task/GetCAMDrawing?DrawName=" + DrawName;
            string _result = _server.ReceiveStream(_url);
            CAMDrawing _camDrawing = JsonConvert.DeserializeObject<CAMDrawing>(_result);
            return _camDrawing;
        }
    }
}