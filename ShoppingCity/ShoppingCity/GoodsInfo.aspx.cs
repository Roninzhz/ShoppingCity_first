using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCity
{
    public partial class GoodsInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlGType_DataBound(object sender, EventArgs e)
        {
            ListItem item = new ListItem("所有类别", "0");
            ddlGType.Items.Insert(0, item);
        }

        protected void btnFind_Click(object sender, EventArgs e)
        {
            sqlGoods.SelectParameters.Clear();
            grdGoods.DataSourceID = null;
            string sqlstr = sqlGoods.SelectCommand;

            switch (rdltSaleQty.SelectedIndex)
            {
                case 0: sqlstr += " where gdSaleQty>=0"; break;
                case 1: sqlstr += " where gdSaleQty<20"; break;
                case 2: sqlstr += " where gdSaleQty between 20 and 49"; break;
                case 3: sqlstr += " where gdSaleQty>50"; break;
            }
            if (txtGName.Text != "")
            {
                sqlstr += " and gdName like '%'+@dgname+'%'";
                Parameter pm = new Parameter("dgname", DbType.String, txtGName.Text);
                sqlGoods.SelectParameters.Add(pm);
            }
            if (ddlGType.SelectedValue != "0")
            {
                sqlstr += " and Goods.tID=@tID";
                Parameter pm = new Parameter("tID", DbType.Int16, ddlGType.SelectedValue);
                sqlGoods.SelectParameters.Add(pm);

            }
            if (txtPriceLow.Text != "" || txtPriceLow.Text != "")
            {
                sqlstr += " and gdPrice>=@low and gdPrice<@high";
                Parameter pm = new Parameter("low", DbType.Int16, txtPriceLow.Text);
                sqlGoods.SelectParameters.Add(pm);
                pm = new Parameter("high", DbType.Int16, txtPriceHigh.Text);
                sqlGoods.SelectParameters.Add(pm);
            }

            sqlGoods.SelectCommand = sqlstr;
            grdGoods.DataSourceID = "sqlGoods";
        }
    }
}