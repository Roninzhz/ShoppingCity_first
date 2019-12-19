using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
namespace ShoppingCity
{
    public partial class GoodsInfo : System.Web.UI.Page
    {
        int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uName"] == null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('请先登录');location.href='Login.aspx';</script>");
            }
            if (Request["gdID"] != null)
            {
                id = int.Parse(Request["gdID"].ToString());
                if (!IsPostBack)
                {
                    dispGoodInfo();
                }
            }
        }

        public void dispGoodInfo()
        {
            string str = ConfigurationManager.ConnectionStrings["SMDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(str))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("upGetGoodsById", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter pm = new SqlParameter("@gdID", id);
                cmd.Parameters.Add(pm);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblID.Text = dr["gdID"].ToString();
                    lblgdName.Text = dr["gdName"].ToString();
                    lblgdCity.Text = dr["gdCity"].ToString();
                    lblFeight.Text = dr["gdFeight"].ToString();
                    lblPrice.Text = dr["gdPrice"].ToString();
                    lblSaleQty.Text = dr["gdSaleQty"].ToString();
                    lblAddTime.Text = dr["gdAddTime"].ToString();
                    ImgGood.ImageUrl = "images/goods/" + dr["gdImage"].ToString();
                }
            }
        }
        protected void ImageButton1_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            if (Session["uID"] != null)
            {
                int gdID = Convert.ToInt32(lblID.Text);
                string str = ConfigurationManager.ConnectionStrings["SMDB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(str))
                {
                    conn.Open();
                    SqlCommand comm = new SqlCommand("upAddGoodsToCar", conn);
                    comm.CommandType = CommandType.StoredProcedure;
                    SqlParameter[] ps =
                    {
                        new SqlParameter("@scID",Session["scID"]),
                        new SqlParameter("@gdID",gdID),
                        new SqlParameter("@num",1)
                    };
                    comm.Parameters.AddRange(ps);
                    if (comm.ExecuteNonQuery() > 0)
                    {
                        Response.Write("<script>alert('添加成功');location.href='ShoppingCarManage.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('添加失败');</script>");
                    }
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('请先登录');location.href='Login.aspx';</script>");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtbnContent.Text == "")
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('内容不能为空');</script>");
                return;
            }
            else
            {
                pingjiaDataContext pi = new pingjiaDataContext();
                GoodEvaluate goodE = new GoodEvaluate();
                goodE.gdID = Convert.ToInt32(lblID.Text);
                goodE.uID = Convert.ToInt32(Session["uID"]);
                goodE.geContent = txtbnContent.Text.Trim();
                goodE.geAddTime = System.DateTime.Now;
                pi.GoodEvaluate.InsertOnSubmit(goodE);
                pi.SubmitChanges();
                Response.Redirect("GoodsInfo.aspx?gdid=" + Request["gdid"]);
            }
        }
    }
}