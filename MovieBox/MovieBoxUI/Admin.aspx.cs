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
            //GridView row = GridView1.Rows[e.RowIndex];

            //Label id = (Label)GridView1.Rows[e.RowIndex].FindControl("lblFilmId") as Label;
            //string FilmAdi = (row.FindControl("txtFilmAdi") as TextBox).Text;
            //string 
        }
    }
}