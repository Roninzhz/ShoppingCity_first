using System;

namespace ShoppingCity
{
    public partial class MessageReply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uID"] == null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('请先登录！');location.href='Login.aspx'</script");
            }

            if (Session["id"] == null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('请选择留言主题！');location.href='MessageManage.aspx'</script");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            BBSDataContext lq = new BBSDataContext();
            BBSAnswer ba = new BBSAnswer();
            ba.uID = Convert.ToInt16(Session["uID"]);
            ba.bnID = Convert.ToInt16(Request["id"]);
            ba.baContent = txtbaContent.Text;
            ba.baAddTime = System.DateTime.Now;
            lq.BBSAnswer.InsertOnSubmit(ba);
            lq.SubmitChanges();
            Response.Redirect("MessageReply.aspx?id=" + Request["id"]);
        }
    }
}