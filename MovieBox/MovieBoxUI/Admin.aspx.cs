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
        YonetmenRepository yonRepo = new YonetmenRepository();
      
        KategoriRepository kategoriRepo = new KategoriRepository();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack) return;

            FilmleriGetir();
            YonetmenListe();
            KategoriListe();
        }

        private void KategoriListe()
        {
            DropDownList2.DataSource = kategoriRepo.GetAll();
            DropDownList2.DataTextField = "KategoriAdi";
            DropDownList2.DataValueField = "KategoriId";
            DropDownList2.DataBind();
        }

        private void YonetmenListe()
        {
            DropDownList1.DataSource = yonRepo.GetAll().Select(a => new
            {
                YonetmenId = a.YonetmenId,
                Yonetmen = a.YonetmenAdi + " " + a.YonetmenSoyadi,
                YonetmenDTarih = a.DogumTarihi,
                YonetmenCinsiyet = a.DogumTarihi
            });
            DropDownList1.DataTextField = "Yonetmen";
            DropDownList1.DataValueField = "YonetmenId";
            DropDownList1.DataBind();
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



        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            string FilmAdi = txtFilmAdi.Text;
            DateTime vizyonTarihi = Convert.ToDateTime(txtVizyonTarihi.Text);
            decimal FilmSuresi = Convert.ToDecimal(txtFilmSüresi.Text);
            string Konu = txtFilmKonusu.Text;
            string FilmOdul = txtodul.Text;
            string YasSiniri = txtYasSiniri.Text;
            string Ulke = txtulke.Text;
            string resim = FileUpload1.FileName;
            string video = txtVideo.Text;
            decimal FragmanSuresi = Convert.ToDecimal(txtFragmanSuresi.Text);
            string Fragmanvideo = txtFragmanVideo.Text;
            var Yonetmen = DropDownList1.SelectedValue;
            var Kategori = DropDownList2.SelectedValue;



            filmrepo.insert(new DAL.Filmler
            {
                FilmAdi = FilmAdi,
                VizyonTarihi = vizyonTarihi,
                FilmSuresi = Convert.ToInt32(FilmSuresi),
                Konusu = Konu,
                FilmOdul = FilmOdul,
                YasSiniri = Convert.ToInt32(YasSiniri),
                Ulkesi = Ulke,
                FilmResim = resim,
                Video = video,
                FragmanSuresi = FragmanSuresi,
                FragmanVideo = Fragmanvideo,
                isDeleted = false,
                YonetmenId = Convert.ToInt32(Yonetmen),
                KategoriId = Convert.ToInt32(Kategori)

            });

            FilmleriGetir();

        }
    }

}