using BLL.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieBoxUI
{
    public partial class Admin1 : System.Web.UI.Page
    {
        FilmRepository filmrepo = new FilmRepository();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack) return;
            FilmleriGetir();
        }

        private void FilmleriGetir()
        {
            GridView1.DataSource = filmrepo.GetAll();
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Sil")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                filmrepo.delete(id);
                FilmleriGetir();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            Label id = (Label)GridView1.Rows[e.RowIndex].FindControl("lblFilmId") as Label;
            filmrepo.delete(Convert.ToInt32(id.Text));
            FilmleriGetir();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            FilmleriGetir();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            FilmleriGetir();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];


            Label id = (Label)GridView1.Rows[e.RowIndex].FindControl("lblFilmId") as Label;
            string ad = (row.FindControl("txtFilmAdi") as TextBox).Text;
            string vizyontarih = (row.FindControl("txtVizyonTarihi") as TextBox).Text;
            var filmSuresi = (row.FindControl("txtFilmSuresi") as TextBox).Text;
            var konusu = (row.FindControl("txtKonusu") as TextBox).Text;
            var filmOdul = (row.FindControl("txtFilmOdul") as TextBox).Text;
            var yasSiniri = (row.FindControl("txtYasSiniri") as TextBox).Text;
            var Ulke = (row.FindControl("txtUlkesi") as TextBox).Text;
            var filmResim = (row.FindControl("txtFilmResim") as TextBox).Text;
            var Video = (row.FindControl("txtVideo") as TextBox).Text;
            var FragmanSuresi = (row.FindControl("txtFragmanSuresi") as TextBox).Text;
            var FragmanVideo = (row.FindControl("txtFragmanVideo") as TextBox).Text;
            string isdeleted = (row.FindControl("txtisDeleted") as TextBox).Text;
            var Yonetmen = (row.FindControl("txtYonetmenId") as TextBox).Text;
            var Kategori = (row.FindControl("txtKategoriId") as TextBox).Text;

            var secilen = filmrepo.GetById(Convert.ToInt32(id.Text));
            secilen.FilmAdi = ad;
            secilen.VizyonTarihi = Convert.ToDateTime(vizyontarih);
            secilen.FilmSuresi = Convert.ToInt32(filmSuresi);
            secilen.Konusu = konusu;
            secilen.FilmOdul = filmOdul;
            secilen.YasSiniri = Convert.ToInt32(yasSiniri);
            secilen.FilmResim = filmResim;
            secilen.Video = Video;
            secilen.FragmanSuresi = Convert.ToDecimal(FragmanSuresi);
            secilen.FragmanVideo = FragmanVideo;
            secilen.isDeleted = Convert.ToBoolean(isdeleted);
            secilen.YonetmenId = Convert.ToInt32(Yonetmen);
            secilen.KategoriId = Convert.ToInt32(Kategori);
            filmrepo.update(secilen);


            GridView1.EditIndex = -1;
            FilmleriGetir();
        }
    }
}