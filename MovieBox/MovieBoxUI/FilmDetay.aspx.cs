using BLL.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieBoxUI
{
    public partial class FilmDetay : System.Web.UI.Page
    {
        FilmRepository filmRepo = new FilmRepository();
        KategoriRepository kategoriRepo = new KategoriRepository();
        YonetmenRepository yonRepo = new YonetmenRepository();
        OyuncuRepository oyuncuRepo = new OyuncuRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = int.Parse(Request.QueryString["FilmId"]);

                var model = filmRepo.GetById(Convert.ToInt32(id));
                txtFilmID.Text = model.FilmId.ToString();
                txtFilmAdi.Text = model.FilmAdi;


                string vizyonTarihi = model.VizyonTarihi.ToString();
                string FilmSuresi = model.FilmSuresi.ToString();
                string Konu = model.Konusu;
                string FilmOdul = model.FilmOdul;
                string YasSiniri = model.YasSiniri.ToString();
                string Ulke = model.Ulkesi;
                string video = model.Video;
                string FragmanSuresi = model.FragmanSuresi.ToString();
                string Fragmanvideo = model.FragmanVideo;

                txtFilmSüresi.Text = FilmSuresi;
                txtFilmKonusu.Text = Konu;
                txtodul.Text = FilmOdul;
                txtYasSiniri.Text = YasSiniri;
                txtulke.Text = Ulke;
                txtVideo.Text = video;
                txtFragmanSuresi.Text = FragmanSuresi;
                txtFragmanVideo.Text = Fragmanvideo;



                OyuncuListe();
                KategoriListe();
                YonetmenListe();
            };

            //string id = Request.QueryString["FilmId"];
            //var model = filmRepo.GetById(Convert.ToInt32(id));
            //txtFilmID.Text = model.FilmId.ToString();
            //txtFilmAdi.Text = model.FilmAdi;
            ////txtVizyonTarihi.Text = model.VizyonTarihi.ToString();
            ////txtFilmSüresi.Text = model.FilmSuresi.ToString();
            ////txtFilmKonusu.Text = model.Konusu;
            ////txtodul.Text = model.FilmOdul;
            ////txtYasSiniri.Text = model.YasSiniri.ToString();
            ////txtulke.Text = model.Ulkesi;
            ////txtVideo.Text = model.Video;
            ////txtFragmanSuresi.Text = model.FragmanSuresi.ToString();
            ////txtFragmanVideo.Text = model.FragmanVideo;



            OyuncuListe();
            KategoriListe();
            YonetmenListe();

        }



        private void OyuncuListe()
        {
            Oyuncuddl.DataSource = oyuncuRepo.GetAll().Select(a => new
            {
                OyuncuId = a.OyuncuId,
                Oyuncu = a.OyuncuAdi + " " + a.OyuncuSoyadi,
                OyuncuDTarih = a.DogumTarihi,
                OyuncuCinsiyet = a.DogumTarihi,
                Ulke = a.Ulkesi,
                Odul = a.OyuncuOdulleri

            });
            Oyuncuddl.DataTextField = "Oyuncu";
            Oyuncuddl.DataValueField = "OyuncuId";
            Oyuncuddl.DataBind();
            Oyuncuddl.Attributes.Add("multiple", "multiple");

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

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            int id = int.Parse(txtFilmID.Text);


            var secilen = filmRepo.GetById(Convert.ToInt32(id));
            secilen.FilmAdi = txtFilmAdi.Text;
            secilen.VizyonTarihi = Convert.ToDateTime(txtVizyonTarihi.Text);
            secilen.FilmSuresi = Convert.ToInt32(txtFilmSüresi.Text);
            secilen.Konusu = txtFilmKonusu.Text;
            secilen.FilmOdul = txtodul.Text;
            secilen.YasSiniri = Convert.ToInt32(txtYasSiniri.Text);
            secilen.Ulkesi = txtulke.Text;
            secilen.FilmResim = FileUpload1.FileName;
            secilen.Video = txtVideo.Text;
            secilen.FragmanSuresi = Convert.ToDecimal(txtFragmanSuresi.Text);
            secilen.FragmanVideo = txtFragmanVideo.Text;
            secilen.isDeleted = false;
            secilen.YonetmenId = Convert.ToInt32(DropDownList1.SelectedValue);
            secilen.KategoriId = Convert.ToInt32(DropDownList2.SelectedValue);
            filmRepo.update(secilen);
            Response.Redirect("Admin.aspx");
        }

        protected void btnKapat_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx");
        }
    }
}