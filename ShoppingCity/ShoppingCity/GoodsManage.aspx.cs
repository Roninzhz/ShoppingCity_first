using System;

namespace ShoppingCity
{
    public partial class GoodsManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddGood.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("GoodsTypeManage.aspx");
        }

        protected void btnChu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}