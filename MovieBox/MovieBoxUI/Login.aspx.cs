using BLL.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieBoxUI
{
    public partial class Login1 : System.Web.UI.Page
    {
      

            KullaniciRepository kulRepo = new KullaniciRepository();
     
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;


        }
        protected void Giris_Click(object sender, EventArgs e)
        {
            //input type ile validasyon
            string email2 = Request.Form["email"] != null ? Request.Form["email"].ToString() : "";
            string sifre2 = string.IsNullOrEmpty(Convert.ToString(Request.Form["pswd"])) ? "" : Request.Form["pswd"].ToString();

            var kullanicilar = kulRepo.GetAll().Where(x => x.isDeleted == false);
            if (kullanicilar.Any(x => x.KullaniciMail == Request.Form["email"] && x.Sifre == (Request.Form["pswd"])))
            {
                var kullanici = kulRepo.GetAll().Where(x => x.KullaniciMail == Request.Form["email"]).FirstOrDefault();
                if (kullanici != null)
                {
                    if (kullanici.RolId == 3 || kullanici.RolId == 4)
                    {
                        Session["Admin"] = kullanici.KullaniciMail;
                        Response.Redirect("Admin.aspx");
                    }
                    else if (kullanici.RolId < 3)
                    {
                        Session["User"] = kullanici.KullaniciMail;
                        Response.Redirect("Anasayfa.aspx");
                    }
                    Session.Timeout = 25;
                }

                else
                {
                    Response.Write("Girdiğiniz mail veya şifre yanlış!");
                }

            }    
        }

    }
}