using BLL.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieBoxUI
{
    public partial class Duyuru : System.Web.UI.Page
    {
        DuyuruRepository duyuruRepo = new DuyuruRepository();
        //KullaniciRepository kulRepo = new KullaniciRepository();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack) return;
            DuyurulariGetir();


        }

        private void DuyurulariGetir()
        {
            GridView1.DataSource = duyuruRepo.GetAll();
            DataBind();
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            int kullaniciId = Login1.ID;
            string duyuruIcerik = txtduyuruIcerik.Text;
            DateTime tarih = Convert.ToDateTime(txtTarih.Text);


            duyuruRepo.insert(new DAL.Duyurular
            {
                KullaniciId = kullaniciId,
                duyuruIcerik = duyuruIcerik,
                tarih = tarih,
                isDeleted = false

            });

            DuyurulariGetir();
        }


        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

            GridView1.EditIndex = e.NewEditIndex;
            DuyurulariGetir();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            DuyurulariGetir();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];


            Label id = (Label)GridView1.Rows[e.RowIndex].FindControl("lblDuyuruId") as Label;
            string DuyuruIcerik = (row.FindControl("txticerik") as TextBox).Text;
            var tarih = (row.FindControl("txtTarih") as TextBox).Text;
            string isdeleted = (row.FindControl("txtisDeleted") as TextBox).Text;


            var secilen = duyuruRepo.GetById(Convert.ToInt32(id.Text));
            secilen.duyuruIcerik = DuyuruIcerik;
            secilen.tarih = Convert.ToDateTime(tarih);
            secilen.isDeleted = Convert.ToBoolean(isdeleted);

            duyuruRepo.update(secilen);


            GridView1.EditIndex = -1;
            DuyurulariGetir();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = (Label)GridView1.Rows[e.RowIndex].FindControl("lblDuyuruId") as Label;
            duyuruRepo.delete(Convert.ToInt32(id.Text));
            DuyurulariGetir();
        }
    }
}