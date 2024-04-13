using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace testKKK
{
    public partial class Store : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            drinkDetailsView.DataBind();
            userLable.Text = Session["name"] + " 歡迎光臨<br>您的餘額還有: " + Session["money"] + " 元";

            if (!IsPostBack)
            {
                drinkPriceLable.Text = "";
                drinkNLable.Text = "";
                drinkImage.ImageUrl = "./pic/未選取.jpg";
                for (int i = 0; i < 50; i++)
                {
                    cupList.Items.Insert(i, new ListItem("" + (i + 1), "" + (i + 1)));
                }
                drinkDropDown.SelectedIndex = 0;
                cupList.SelectedIndex = 0;
                sweetList.SelectedIndex = 0;
                iceList.SelectedIndex = 0;
            }

        }

        private void initial()
        {
            drinkDropDown.SelectedIndex = 0;
            cupList.SelectedIndex = 0;
            sweetList.SelectedIndex = 0;
            iceList.SelectedIndex = 0;
            drinkPriceLable.Text = "";
            drinkNLable.Text = "";
            drinkImage.ImageUrl = "./pic/未選取.jpg";

            orderBT.Text = "前往訂購";
            orderBT.Enabled = true;

            cupLB.Visible = false;
            cupList.Visible = false;
            sweetList.Visible = false;
            iceList.Visible = false;
            addItemBT.Visible = false;
            addItemBT.Enabled = false;
            orderItemGridView.Visible = false;
            totalLB.Visible = false;
            cheakBT.Visible = false;
            cancelBT.Visible = false;
            errorLB.Visible = false;
        }

        protected void drinkDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            drinkImage.ImageUrl = "./pic/" + drinkDropDown.SelectedItem.Text.ToString() + ".jpg";
            if (0 == drinkDropDown.SelectedIndex)
            {
                drinkPriceLable.Text = "";
                drinkNLable.Text = "";
                addItemBT.Enabled = false;
            }
            else
            {
                drinkPriceLable.Text = drinkDetailsView.Rows[0].Cells[1].Text + " 元";
                drinkNLable.Text = "\t庫存: " + drinkDetailsView.Rows[1].Cells[1].Text + " 個";
                addItemBT.Enabled = true;
                drinkPriceLable.ForeColor = System.Drawing.Color.Black;
                drinkNLable.ForeColor = System.Drawing.Color.Black;

                if (Convert.ToInt32(Session["money"]) < Convert.ToInt32(drinkDetailsView.Rows[1].Cells[1].Text))
                {
                    drinkPriceLable.ForeColor = System.Drawing.Color.Red;
                    drinkPriceLable.Text = " 餘額不足";
                    addItemBT.Enabled = false;
                }
                if (Convert.ToInt32(drinkDetailsView.Rows[1].Cells[1].Text) <= 0)
                {
                    drinkNLable.ForeColor = System.Drawing.Color.Red;
                    drinkNLable.Text = " 庫存不足";
                    addItemBT.Enabled = false;
                }
            }
        }

        protected void orderBT_Click(object sender, EventArgs e)
        {
            drinkDataSelect.Insert();

            SqlConnection orderCon = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\clientData1.mdf;Integrated Security=True");
            orderCon.Open();
            SqlCommand orderCmd = new SqlCommand("select top 1 order_id from [orderTable] order by order_id Desc", orderCon);
            SqlDataReader orderDr;
            orderDr = orderCmd.ExecuteReader();
            if (orderDr.Read())
            {
                Session["order_id"] = orderDr["order_id"];
                orderBT.Text = orderDr["order_id"] + "號訂單";
                orderBT.Enabled = false;

                cupLB.Visible = true;
                cupList.Visible = true;
                sweetList.Visible = true;
                iceList.Visible = true;
                addItemBT.Visible = true;
            }
            orderDr.Close();
        }

        protected void resetBT_Click(object sender, EventArgs e)
        {
            SqlConnection orderCon = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\clientData1.mdf;Integrated Security=True");
            orderCon.Open();
            SqlCommand orderResetCmd = new SqlCommand("truncate table orderTable", orderCon);
            orderResetCmd.ExecuteNonQuery();
            SqlCommand orderItemResetCmd = new SqlCommand("truncate table orderItemTable", orderCon);
            orderItemResetCmd.ExecuteNonQuery();
            initial();
        }

        protected void addItemBT_Click(object sender, EventArgs e)
        {
            orderItemDataSource.Insert();
            if (!orderItemGridView.Visible)
            {
                orderItemGridView.Visible = true;
            }
            totalLB.Visible = true;
            cheakBT.Visible = true;
            cancelBT.Visible = true;
        }
        protected void drinkData_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void orderItemGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            errorLB.Text = "";
            errorLB.Visible = false;
            cheakBT.Enabled = true;
            countTotal();
            qtCheak();
            qtCheakGridView.DataBind();
        }
        private void qtCheak()
        {
            int num;
            int qt;
            bool isError = false;
            for (int i = 0; i < qtCheakGridView.Rows.Count; i++)
            {
                if (qtCheakGridView.Rows[i].Cells[1].FindControl("qtNameLB") != null &&
                    qtCheakGridView.Rows[i].Cells[2].FindControl("totalNumLB") != null &&
                    qtCheakGridView.Rows[i].Cells[3].FindControl("cheakQtLB") != null)
                {
                    using (Label qtNameLB = (Label)qtCheakGridView.Rows[i].Cells[1].FindControl("qtNameLB"),
                        totalNumLB = (Label)qtCheakGridView.Rows[i].Cells[2].FindControl("totalNumLB"),
                        cheakQtLB = (Label)qtCheakGridView.Rows[i].Cells[3].FindControl("cheakQtLB"))
                    {
                        num = Convert.ToInt32(totalNumLB.Text);
                        qt = Convert.ToInt32(cheakQtLB.Text);
                        if (num > qt)
                        {
                            errorLB.Text += "<br>" + qtNameLB.Text + "庫存不足(剩下" + qt + "杯)";
                            isError = true;
                        }
                    }
                }
            }
            if (isError)
            {
                cheakBT.Enabled = false;
                errorLB.Visible = true;
            }
        }
        private void countTotal()
        {
            int total = 0;
            string warmMsg = "";
            for (int i = 0; i < orderItemGridView.Rows.Count; i++)
            {
                if (orderItemGridView.Rows[i].Cells[4].FindControl("subTotalLB") != null)
                {
                    total += Convert.ToInt32(((Label)orderItemGridView.Rows[i].Cells[4].FindControl("subTotalLB")).Text);
                }
                cupEditCheak(ref warmMsg, i);
            }
            totalLB.Text = warmMsg + " 總價： " + total + "元";

            Session["total"] = total;

            if (0 == total)
            {
                cheakBT.Enabled = false;
            }
            if (Convert.ToInt32(Session["money"]) < total)
            {
                cheakBT.Enabled = false;
                errorLB.Text += " 餘額不足";
                errorLB.Visible = true;
            }
        }

        private void cupEditCheak(ref string msg, int i)
        {
            if (orderItemGridView.Rows[i].Cells[1].FindControl("itemCupLB") != null)
            {
                using (Label tempCupLB = (Label)orderItemGridView.Rows[i].Cells[1].FindControl("itemCupLB"))
                {
                    if (tempCupLB.Text == "0")
                    {
                        msg = "(錯誤的杯數)";
                        tempCupLB.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        tempCupLB.ForeColor = System.Drawing.Color.Black;
                    }
                }
            }
        }

        protected void orderItemGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (orderItemGridView.Rows.Count == 1)
            {
                totalLB.Visible = false;
                errorLB.Visible = false;
                cheakBT.Enabled = false;
            }
        }

        protected void editCupTB_TextChanged(object sender, EventArgs e)
        {
            foreach (char ch in ((TextBox)sender).Text)
            {
                if (!Char.IsDigit(ch))
                {
                    ((TextBox)sender).Text = "0";
                }
            }
        }

        protected void cheakBT_Click(object sender, EventArgs e)
        {
            Session["money"] = Convert.ToInt32(Session["money"]) - Convert.ToInt32(Session["total"]);
            userLable.Text = Session["name"] + " 歡迎光臨<br>您的餘額還有: " + Session["money"] + " 元";
            clientDataSource.Update();
            updateQt();
            initial();
        }
        private void updateQt()
        {
            int num;
            int qt;
            for (int i = 0; i < qtCheakGridView.Rows.Count; i++)
            {
                if (qtCheakGridView.Rows[i].Cells[0].FindControl("qtIdLB") != null &&
                    qtCheakGridView.Rows[i].Cells[2].FindControl("totalNumLB") != null &&
                    qtCheakGridView.Rows[i].Cells[3].FindControl("cheakQtLB") != null)
                {
                    using (Label qtIdLB = (Label)qtCheakGridView.Rows[i].Cells[0].FindControl("qtIdLB"),
                        totalNumLB = (Label)qtCheakGridView.Rows[i].Cells[2].FindControl("totalNumLB"),
                        cheakQtLB = (Label)qtCheakGridView.Rows[i].Cells[3].FindControl("cheakQtLB"))
                    {
                        num = Convert.ToInt32(totalNumLB.Text);
                        qt = Convert.ToInt32(cheakQtLB.Text);
                        Session["updateQtId"] = Convert.ToInt32(qtIdLB.Text);
                        Session["updateQtNum"] = qt - num;
                        drinkQtDataSource.Update();
                    }
                }
            }
        }

        protected void cancelBT_Click(object sender, EventArgs e)
        {
            drinkDataSelect.Delete();
            cancelOrderDataSource.Delete();
            initial();
        }
    }
}