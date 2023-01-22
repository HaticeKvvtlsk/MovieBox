using BLL.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieBoxUI
{
    public partial class Kullanicilar : System.Web.UI.Page
    {
        KullaniciRepository kullaniciRepo = new KullaniciRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            KullaniciGetir();
        }

        private void KullaniciGetir()
        {
            GridView1.DataSource = kullaniciRepo.GetAll().Select(a => new
            {
                a.KullaniciId,
                a.KullaniciAdi,
                a.KullaniciSoyadi,
                a.Sifre,
                //a.Roller.RolAdi,
                a.RolId,
                a.TCKN,
                a.KullaniciMail,
                a.DogumTarihi,
                a.Cinsiyet,
                a.isDeleted,
            }).ToList();
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            Label id = (Label)GridView1.Rows[e.RowIndex].FindControl("lblKullaniciId") as Label;
            kullaniciRepo.delete(Convert.ToInt32(id.Text));
            KullaniciGetir();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            KullaniciGetir();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            KullaniciGetir();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];


            Label id = (Label)GridView1.Rows[e.RowIndex].FindControl("lblKullaniciId") as Label; string ad = (row.FindControl("txtKullaniciAdi") as TextBox).Text;
            string soyad = (row.FindControl("txtKullaniciSoyadi") as TextBox).Text;
            var sifre = (row.FindControl("txtSifre") as TextBox).Text;
            var rol = (row.FindControl("txtRolId") as TextBox).Text;
            var tc = (row.FindControl("txtTCKN") as TextBox).Text;
            var mail = (row.FindControl("txtMail") as TextBox).Text;
            var dtarih = (row.FindControl("txtDogumTarihi") as TextBox).Text;
            var cins = (row.FindControl("txtCinsiyet") as TextBox).Text;
            string isdeleted = (row.FindControl("txtisDeleted") as TextBox).Text;

            var secilen = kullaniciRepo.GetById(Convert.ToInt32(id.Text));
            secilen.KullaniciAdi = ad;
            secilen.KullaniciSoyadi = soyad;
            secilen.Sifre = sifre;
            secilen.RolId = Convert.ToInt32(rol);
            secilen.TCKN = tc;
            secilen.KullaniciMail = mail;
            secilen.DogumTarihi = Convert.ToDateTime(dtarih);
            secilen.Cinsiyet = cins;
            secilen.isDeleted = Convert.ToBoolean(isdeleted);
            kullaniciRepo.update(secilen);


            GridView1.EditIndex = -1;
            KullaniciGetir();
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            string kullaniciadi = txtAd.Text;
            string kullanicisoyadi = txtSoyadi.Text;
            string sifre = txtSifre.Text;
            int rol = Convert.ToInt32(dlRol.SelectedValue);
            string tc = txttc.Text;
            string mail = txtMail.Text;
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


            kullaniciRepo.insert(new DAL.Kullanicilar
            {
                KullaniciAdi = kullaniciadi,
                KullaniciSoyadi = kullanicisoyadi,
                Sifre = sifre,
                RolId = rol,
                TCKN = tc,
                KullaniciMail = mail,
                DogumTarihi = dtarih,
                Cinsiyet = Cins,
                isDeleted = false

            });

            KullaniciGetir();
        }


    }
}