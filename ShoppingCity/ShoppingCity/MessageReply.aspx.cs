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
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtbaContent.Text == "")
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('留言不能为空！');</script>");
                return;
            }
            else
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
}