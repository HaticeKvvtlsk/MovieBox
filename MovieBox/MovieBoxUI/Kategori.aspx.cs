using BLL.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieBoxUI
{
    public partial class Kategori : System.Web.UI.Page
    {
        KategoriRepository kategoriRepo = new KategoriRepository();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack) return;
            KategorileriGetir();
        }

        private void KategorileriGetir()
        {
            GridView1.DataSource = kategoriRepo.GetAll();
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            KategorileriGetir();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            KategorileriGetir();

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];


            Label id = (Label)GridView1.Rows[e.RowIndex].FindControl("lblYonetmenId") as Label;
            string KategoriAd = (row.FindControl("txtKategoriAdi") as TextBox).Text;

            var secilen = kategoriRepo.GetById(Convert.ToInt32(id.Text));
            secilen.KategoriAdi = KategoriAd;
            kategoriRepo.update(secilen);


            GridView1.EditIndex = -1;
            KategorileriGetir();
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            string kategoriAdi = txtKategoriAdi.Text;

            kategoriRepo.insert(new DAL.Kategoriler
            {
                KategoriAdi = kategoriAdi

            });

            KategorileriGetir();
        }
    }
}