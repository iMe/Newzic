using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Newzic.Website.Models
{
    public class JornBanModel : Controller
    {
   
        [Required]
        [DataType(DataType.Text)]
        [DisplayName("Email do utilizador")]
        public string Email { get; set; }
        
       // [Required]
        [DataType(DataType.Text)]
        [DisplayName("Ano")]
        public string ano { get; set; }

        //[Required]
        [DataType(DataType.Text)]
        [DisplayName("Mês")]
        public string mes { get; set; }

        //[Required]
        [DataType(DataType.Text)]
        [DisplayName("Dia")]
        public string dia { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [DisplayName("Razão")]
        public string reason { get; set; }
        
        public List<SelectListItem> anoList { get; set; }
        public List<SelectListItem> mesList { get; set; }
        public List<SelectListItem> diaList { get; set; }
        public List<SelectListItem> banTypeList { get; set; }

        public int selectedDia { get; set; }
        public int selectedMes { get; set; }
        public int selectedAno { get; set; }
        public int banType { get; set; }

        public JornBanModel() { }

        public JornBanModel(string email)
        {
            banTypeList = createDropList(new string[2] { "Permanente", "Temporario" });
            this.Email = email;
            string[] meses = new string[12] { "Janeiro", "Fevereiro", "Março", "Abril,", "Maio", "Junho", "Julho", "Agosto", "Setembro,", "Outubro", "Novembro", "Dezembro" };
            diaList = new List<SelectListItem>();
            for (int i = 1; i <= 31; i++)
            {
                SelectListItem item = new SelectListItem();
                item.Text = i.ToString();
                item.Value = i.ToString();
                diaList.Add(item);
            }

            int nowYear = DateTime.Now.Year;
            anoList = new List<SelectListItem>();
            for (int i = nowYear; i <= nowYear + 10; i++)
            {
                SelectListItem item = new SelectListItem();
                item.Text = i.ToString();
                item.Value = i.ToString();
                anoList.Add(item);
            }

            mesList = new List<SelectListItem>();
            int m = 1;
            List<SelectListItem> res = new List<SelectListItem>();
            foreach (string mes in meses)
            {
                SelectListItem item = new SelectListItem();
                item.Text = mes;
                item.Value = m.ToString();
                mesList.Add(item);
                m++;
            }

            diaList = diaList;
            anoList = anoList;
            mesList = mesList;
        }

        public List<SelectListItem> createDropList(string[] list)
        {
            Int32 i = 1;
            List<SelectListItem> res = new List<SelectListItem>();
            foreach (string s in list)
            {

                res.Add(new SelectListItem
                {
                    Text = s,
                    Value = Convert.ToString(i)
                });
                i++;
            }

            return res;
        }
    }
}
