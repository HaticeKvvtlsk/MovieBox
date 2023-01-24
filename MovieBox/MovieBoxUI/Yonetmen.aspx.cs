using BLL.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieBoxUI
{
    public partial class Yonetmen : System.Web.UI.Page
    {
        YonetmenRepository yonRepo = new YonetmenRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            YonetmenleriGetir();
        }

        private void YonetmenleriGetir()
        {
            GridView1.DataSource = yonRepo.GetAll();
            GridView1.DataBind();
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            string yonetmenAdi = txtAd.Text;
            string yonetmenSoyadi = txtSoyadi.Text;
            DateTime dtarih = Convert.ToDateTime(txtdate.Text);
            string Cins = "";
            if (cinsE.Checked == true)
            {
                Cins = cinsE.Text;
            }
            else if (cinsK.Checked == true)
            {
                Cins = cinsK.Text;
            }


            yonRepo.insert(new DAL.Yonetmenler
            {
                YonetmenAdi = yonetmenAdi,
                YonetmenSoyadi = yonetmenSoyadi,
                DogumTarihi = dtarih,
                Cinsiyet = Cins
            });

            YonetmenleriGetir();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            YonetmenleriGetir();
        
    }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
        GridView1.EditIndex = e.NewEditIndex;
        YonetmenleriGetir();
    }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];


            Label id = (Label)GridView1.Rows[e.RowIndex].FindControl("lblYonetmenId") as Label; string ad = (row.FindControl("txtYonetmenAdi") as TextBox).Text;
            string soyad = (row.FindControl("txtYonetmenSoyadi") as TextBox).Text;
            var dtarih = (row.FindControl("txtDogumTarihi") as TextBox).Text;
            var cins = (row.FindControl("txtCinsiyet") as TextBox).Text;

            var secilen = yonRepo.GetById(Convert.ToInt32(id.Text));
            secilen.YonetmenAdi = ad;
            secilen.YonetmenSoyadi = soyad;
            secilen.DogumTarihi = Convert.ToDateTime(dtarih);
            secilen.Cinsiyet = cins;
            yonRepo.update(secilen);


            GridView1.EditIndex = -1;
            YonetmenleriGetir();
        }
    }
}