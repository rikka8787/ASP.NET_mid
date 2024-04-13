using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace testKKK
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            clientDetailView.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            clientDetailView.Visible = false;
            entry0.Visible = false;
            if(1 == clientDetailView.DataItemCount)
            {
                Session["name"] = clientDetailView.Rows[0].Cells[1].Text;
                Session["money"] = clientDetailView.Rows[1].Cells[1].Text;
                Session["phone"] = clientDetailView.Rows[2].Cells[1].Text;
                entry0.Visible = true;
            }
            else
            {
                Session["name"] = null;
                Session["money"] = null;
                Session["phone"] = null;
                clientDetailView.Visible = true;
            }
        }
    }
}