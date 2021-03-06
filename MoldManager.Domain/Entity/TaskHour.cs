﻿/*
 * Create By:lechun1
 * 
 * Description: data of task hour record
 * 
 */



using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TechnikSys.MoldManager.Domain.Entity
{
    public class TaskHour
    {
        public int TaskHourID { get; set; }
        public int TaskID { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime FinishTime { get; set; }
        public int RecordType { get; set; }
        /// <summary>
        /// 任务类型
        /// </summary>
        public int TaskType { get; set; }
        /// <summary>
        /// 时长(min)
        /// </summary>
        public decimal Time { get; set; }
        /// <summary>
        /// 有效
        /// </summary>
        public bool Enabled { get; set; }
        /// <summary>
        /// 备注(默认记录任务开始/结束 操作者 操作时间)
        /// </summary>
        public string Memo { get; set; }
        public string MoldNumber { get; set; }
        public string MachineCode { get; set; }
        /// <summary>
        /// 0 开始 100完成 -99取消
        /// </summary>
        public int State { get; set; }
        /// <summary>
        /// 开始加工 操作者
        /// </summary>
        public string Operater { get; set; }
        /// <summary>
        /// 加工零件数量
        /// </summary>
        public int Qty { get; set; }
        public decimal Cost { get; set; }
        /// <summary>
        /// 子任务标记(电极标签列表)
        /// </summary>
        public string SemiTaskFlag { get; set; }
    }
}
