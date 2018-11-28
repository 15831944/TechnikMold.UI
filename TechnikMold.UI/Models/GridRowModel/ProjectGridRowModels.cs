﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TechnikSys.MoldManager.Domain.Entity;


namespace MoldManager.WebUI.Models.GridRowModel
{
    public class ProjectGridRowModels
    {
        public ProjectGridRowModel[] ProjectRows;

        public ProjectGridRowModels(Project Project, IQueryable<ProjectPhase> ProjectPhase, List<ProjectRole> Flitter, List<Phase> Phases, int attQty,string _mainProJName)
        {
            ProjectRows = new ProjectGridRowModel[3];
            string _cell2 = BuildCell2(Project, Flitter, attQty);
            for (int i = 0; i < 3; i++)
            {
                ProjectRows[i] = new ProjectGridRowModel(Phases.Count, i + 1);
                ProjectRows[i].cell[0] = Project.ProjectID.ToString();
                ProjectRows[i].cell[1] = Project.ProjectNumber + "<br>"+ _mainProJName + "<br>" + Project.CustomerName;
                if ((Project.ProjectStatus < 0) && (Project.ParentID == 0))
                {
                    ProjectRows[i].cell[1] = "<p style='background-color:#ff0000'>" + ProjectRows[i].cell[1] + "</p>";
                }
                ProjectRows[i].cell[2] = _cell2;
            }

            int _phaseSeq = 0;

            foreach (Phase _phase in Phases)
            {
                DateTime _dateval;
                int _datediff = 0;
                int _datediffAc = 0;
                ProjectPhase _prjPhase = ProjectPhase.Where(p => p.PhaseID == _phase.PhaseID).FirstOrDefault();
                if (_prjPhase != null)
                {
                    _dateval = CheckZero(_prjPhase.PlanCFinish) ? _prjPhase.PlanFinish : _prjPhase.PlanCFinish;
                    _datediff = (_dateval - DateTime.Now).Days;

                    ProjectRows[0].cell[_phaseSeq + 4] = CheckZero(_prjPhase.PlanFinish) ? "" : _prjPhase.PlanFinish.ToString("yy/MM/dd");
                    ProjectRows[1].cell[_phaseSeq + 4] = CheckZero(_prjPhase.PlanCFinish) ? "" : _prjPhase.PlanCFinish.ToString("yy/MM/dd");
                    ProjectRows[2].cell[_phaseSeq + 4] = CheckZero(_prjPhase.ActualFinish) ? "" : _prjPhase.ActualFinish.ToString("yy/MM/dd");
                    if (CheckZero(_prjPhase.ActualFinish))
                    {
                        if ((_datediff >= 0) && (_datediff < 3))
                        {
                            //"<p style='background-color:#00ff00;'>" + cell[_phaseSeq + 4] + "</p>";
                            ProjectRows[0].cell[_phaseSeq + 4] = "<p style='background: linear-gradient(rgba(255,127,36,1), rgba(255,127,36,0.1) 50% ,rgba(255,127,36,1)   );'>" + ProjectRows[0].cell[_phaseSeq + 4] + "</p>";
                            if (!CheckZero(_prjPhase.PlanCFinish))
                                ProjectRows[1].cell[_phaseSeq + 4] = "<p style='background: linear-gradient(rgba(255,127,36,1), rgba(255,127,36,0.1) 50% ,rgba(255,127,36,1)   );'>" + ProjectRows[1].cell[_phaseSeq + 4] + "</p>";
                            //ProjectRows[2].cell[_phaseSeq + 4] = "<p style='background: linear-gradient(rgba(51,153,0,1), rgba(0,255,0,0.1) 50% ,rgba(51,153,0,1)   );'>" + ProjectRows[2].cell[_phaseSeq + 4] + "</p>";
                        }
                        else if (_datediff < 0)
                        {
                            //"<p style='background-color:#ff0000'>" + cell[_phaseSeq + 4] + "</p>";
                            ProjectRows[0].cell[_phaseSeq + 4] = "<p style='background: linear-gradient(rgba(255,0,0,1), rgba(255,0,0,0.1) 50% ,rgba(255,0,0,1)   );'>" + ProjectRows[0].cell[_phaseSeq + 4] + "</p>";
                            if (!CheckZero(_prjPhase.PlanCFinish))
                                ProjectRows[1].cell[_phaseSeq + 4] = "<p style='background: linear-gradient(rgba(255,0,0,1), rgba(255,0,0,0.1) 50% ,rgba(255,0,0,1)   );'>" + ProjectRows[1].cell[_phaseSeq + 4] + "</p>";
                            //ProjectRows[2].cell[_phaseSeq + 4] = "<p style='background: linear-gradient(rgba(255,0,0,1), rgba(255,0,0,0.1) 50% ,rgba(255,0,0,1)   );'>" + ProjectRows[2].cell[_phaseSeq + 4] + "</p>";
                        }
                    }
                    else
                    {
                        _datediffAc = (_dateval - _prjPhase.ActualFinish).Days;
                        if (_datediffAc >= 0)
                        {
                            ProjectRows[2].cell[_phaseSeq + 4] = "<p style='background: linear-gradient(rgba(51,153,0,1), rgba(0,255,0,0.1) 50% ,rgba(51,153,0,1)   );'>" + ProjectRows[2].cell[_phaseSeq + 4] + "</p>";
                        }
                        else
                        {
                            ProjectRows[2].cell[_phaseSeq + 4] = "<p style='background: linear-gradient(rgba(255,0,0,1), rgba(255,0,0,0.1) 50% ,rgba(255,0,0,1)   );'>" + ProjectRows[2].cell[_phaseSeq + 4] + "</p>";
                        }
                    }
                }
                else
                {
                    ProjectRows[0].cell[_phaseSeq + 4] = "";
                    ProjectRows[1].cell[_phaseSeq + 4] = "";
                    ProjectRows[2].cell[_phaseSeq + 4] = "";
                }
                _phaseSeq++;

            }

            for (int i = 0; i < 3; i++)
            {
                ProjectRows[i].cell[ProjectRows[i].cell.Length - 1] = Project.Memo;
            }


        }

        private bool CheckZero(DateTime _date)
        {
            DateTime _datezero = new DateTime(1, 1, 1);
            if (_date < DateTime.Parse("2000/01/01"))
            {
                return true;
            }
            if (_date == _datezero)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private string BuildCell2(Project Project, List<ProjectRole> Flitter, int attQty)
        {
            string _cellContent = "";
            if (Project.MoldNumber != "---")
            {
                string _version = Project.Version < 10 ? "0" + Project.Version.ToString() : Project.Version.ToString();
                string _title = "";
                for(var i = 1; i <= Flitter.Count; i++)
                {
                    string _name = "";
                    if (i == 1)
                        _name = "项目经理：";
                    else if(i==2)
                        _name = "技术负责人：";
                    else if(i==3)
                        _name = "钳工：";
                    _title = _title+ _name + Flitter[i - 1].UserName + "&#10;";
                }
                _cellContent = Project.MoldNumber + "(" + _version + ")" + "<br>" + Project.Name + "<br><p title='"+_title+"'>钳工:" + Flitter.Where(p=>p.RoleID==3).FirstOrDefault().UserName+ "</p>";
            }
            else
            {
                _cellContent = Project.MoldNumber;//+ "(" + Project.Version + ")";
            }
            #region region
            //string button = Project.Attachment;
            //if ((Project.Attachment != "")&&(Project.Attachment != null))
            //{            
            //    try
            //    {
            //        button = button.Replace("\\", "\\\\");
            //    }
            //    catch
            //    {

            //    }

            //    string _ext = button.Substring(button.LastIndexOf('.')+1).ToLower();
            //    string _icon = "";
            //    switch (_ext)
            //    {
            //        case "pdf":
            //            _icon = "pdf";
            //            break;
            //        case "ppt":
            //            _icon = "ppt";
            //            break;
            //        case "pptx":
            //            _icon = "ppt";
            //            break;
            //        case "doc":
            //            _icon = "word";
            //            break;
            //        case "docx":
            //            _icon = "word";
            //            break;
            //        case "xls":
            //            _icon = "excel";
            //            break;
            //        case "xlsx":
            //            _icon = "excel";
            //            break;
            //        default:
            //            _icon = "doc";
            //            break;

            //    }
            //    //button = "<br><button class='btn' onclick='location.href=\"/Project/ProjectFile?ProjectID=" + Project.ProjectID + "\"'>附件</button>";
            //    button = "<br><a href='/Project/ProjectFile?ProjectID=" + Project.ProjectID + "'><img src='/Images/"+_icon+".png'></a>";
            //}
            #endregion
            string btnColor;
            if (attQty == 0)
            {
                btnColor = "btn-danger";
            }
            else
            {
                btnColor = "btn-warning";
            }

            string button = "<br><button id='" + Project.ProjectID.ToString() + "' class='attachbtn " + btnColor + "' style='width: 65px; height: 48px;' onclick='ShowProjectFile(" + Project.ProjectID.ToString() + ")'><span class='glyphicon glyphicon-paperclip'></span><br>附件(" + attQty.ToString() + ")</button>";
            if (Project.ProjectStatus == 1)
            {
                _cellContent = "<font color='#ff0000'>" + _cellContent + "</font>" + button;
            }
            else
            {
                _cellContent = _cellContent + button;
                if (Project.MainPhaseChange)
                {
                    _cellContent = "<font color='#ff6a00'>" + _cellContent + "</font>";
                }

            }
            return _cellContent;
        }


    }
}