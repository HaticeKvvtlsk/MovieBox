using BLL.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieBoxUI
{
    public partial class Oyuncular : System.Web.UI.Page
    {
        OyuncuRepository oyuncuRepo = new OyuncuRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            OyunculariGetir();
        }

        private void OyunculariGetir()
        {
            GridView1.DataSource = oyuncuRepo.GetAll();
            DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            OyunculariGetir();

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            OyunculariGetir();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            Label id = (Label)GridView1.Rows[e.RowIndex].FindControl("lblOyuncuId") as Label;
            string ad = (row.FindControl("txtOyuncuAdi") as TextBox).Text;
            string soyad = (row.FindControl("txtOyuncuSoyadi") as TextBox).Text;
            var dtarih = (row.FindControl("txtDogumTarihi") as TextBox).Text;
            var cins = (row.FindControl("txtCinsiyet") as TextBox).Text;
            string ulkesi = (row.FindControl("txtUlkesi") as TextBox).Text;
            string OyuncuOdulleri = (row.FindControl("txtOyuncuOdulleri") as TextBox).Text;
            string isdeleted = (row.FindControl("txtisDeleted") as TextBox).Text;

            var secilen = oyuncuRepo.GetById(Convert.ToInt32(id.Text));
            secilen.OyuncuAdi = ad;
            secilen.OyuncuSoyadi = soyad;
            secilen.DogumTarihi = Convert.ToDateTime(dtarih);
            secilen.Cinsiyet = cins;
            secilen.Ulkesi = ulkesi;
            secilen.OyuncuOdulleri = OyuncuOdulleri;
            secilen.isDeleted = Convert.ToBoolean(isdeleted);
            oyuncuRepo.update(secilen);


            GridView1.EditIndex = -1;
            OyunculariGetir();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = (Label)GridView1.Rows[e.RowIndex].FindControl("lblOyuncuId") as Label;
            oyuncuRepo.delete(Convert.ToInt32(id.Text));
            OyunculariGetir();
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            string oyuncuAdi = txtOyuncuAdi.Text;
            string oyuncuSoyadi = txtOyuncuSoyadi.Text;
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
            string oyuncuUlkesi = txtUlkesi.Text;
            string OyuncuOdul = txtOyuncuOdullleri.Text;



            oyuncuRepo.insert(new DAL.Oyuncular
            {
                OyuncuAdi = oyuncuAdi,
                OyuncuSoyadi = oyuncuSoyadi,
                DogumTarihi = dtarih,
                Cinsiyet = Cins,
                Ulkesi = oyuncuUlkesi,
                OyuncuOdulleri = OyuncuOdul,
                isDeleted = false


            });

            OyunculariGetir();
        }
    }
}