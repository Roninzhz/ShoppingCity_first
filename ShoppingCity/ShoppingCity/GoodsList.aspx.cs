using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCity
{
    public partial class GoodsList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ltCurUser.Text = "当前用户：游客";
            if (Session["uName"] != null)
            {
                ltCurUser.Text = "当前用户：" + Session["uName"];
            }

            if (!IsPostBack)
            {
                DataListBind();
            }
        }

        protected void DataListBind()
        {
            int PageNumber = 1;
            if (ViewState["Page"] != null)
            {
                PageNumber = Convert.ToInt16(ViewState["Page"]);
            }

            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = sqlGoods.Select(DataSourceSelectArguments.Empty);
            pds.AllowPaging = true;
            pds.PageSize = 3;
            if (PageNumber > pds.PageCount)
            {
                PageNumber = 1;
            }

            pds.CurrentPageIndex = PageNumber - 1;
            dlstGoods.DataSourceID = null;
            dlstGoods.DataSource = pds;
            dlstGoods.DataBind();
            lblCurPage.Text = "第" + (pds.CurrentPageIndex + 1).ToString() + "页";
            lblTotalPage.Text = "/共" + pds.PageCount.ToString() + "页";
            ViewState["Page"] = PageNumber;
            lbtnPre.Enabled = true;
            lbtnNext.Enabled = true;
            if (pds.IsFirstPage)
            {
                lbtnPre.Enabled = false;
            }

            if (pds.IsLastPage)
            {
                lbtnNext.Enabled = false;
            }
        }

        protected void LinkBtnClick(object sender, CommandEventArgs e)
        {
            int curPage = Convert.ToInt16(ViewState["Page"]);
            if (e.CommandName == "Pre")
            {
                ViewState["Page"] = curPage - 1;
            }

            if (e.CommandName == "Next")
            {
                ViewState["Page"] = curPage + 1;
            }

            DataListBind();
        }

        protected void dlstGoods_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (Session["uID"] != null && e.CommandName == "addShop")
            {
                int gdID = Convert.ToInt32(dlstGoods.DataKeys[e.Item.ItemIndex]);
                string str = ConfigurationManager.ConnectionStrings["SMDB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(str))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("upAddGoodsToCar", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter[] ps =
                    {
                        new SqlParameter("@scID",Session["scID"]),
                        new SqlParameter("@gdID",gdID),
                        new SqlParameter("@num",1)
                    };
                    cmd.Parameters.AddRange(ps);
                    cmd.ExecuteNonQuery();
                }
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('添加成功');location.href='ShoppingCarManage.aspx';</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('请先登录');location.href='Login.aspx';</script>");
            }
        }
        protected void btnFind_Click(object sender, EventArgs e)
        {
            sqlGoods0.SelectParameters.Clear();
            DataList1.DataSourceID = null;
            string sqlstr = sqlGoods0.SelectCommand;

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
                sqlGoods0.SelectParameters.Add(pm);
            }
            if (ddlGType.SelectedValue != "0")
            {
                sqlstr += " and Goods.tID=@tID";
                Parameter pm = new Parameter("tID", DbType.Int16, ddlGType.SelectedValue);
                sqlGoods0.SelectParameters.Add(pm);

            }
            if (txtPriceLow.Text != "" || txtPriceLow.Text != "")
            {
                sqlstr += " and gdPrice>=@low and gdPrice<@high";
                Parameter pm = new Parameter("low", DbType.Int16, txtPriceLow.Text);
                sqlGoods0.SelectParameters.Add(pm);
                pm = new Parameter("high", DbType.Int16, txtPriceHigh.Text);
                sqlGoods0.SelectParameters.Add(pm);
            }

            sqlGoods0.SelectCommand = sqlstr;
            DataList1.DataSourceID = "sqlGoods0";
            DataList1.Visible = true;
        }

        protected void ddlGType_DataBound(object sender, EventArgs e)
        {
            ListItem item = new ListItem("所有类别", "0");
            ddlGType.Items.Insert(0, item);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("MessageManage.aspx");
        }
    }
}