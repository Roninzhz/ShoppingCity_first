using System;

namespace ShoppingCity
{
    public partial class MessageManage : System.Web.UI.Page
    {
        //主题不能为空,内容不能为空
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uName"] == null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('请先登录');location.href='Login.aspx';</script>");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            BBSDataContext lq = new BBSDataContext();
            BBSNote note = new BBSNote();
            note.bnSubject = txtbnSubject.Text;
            note.bnContent = txtbnContent.Text;
            note.bnID = Convert.ToInt16(Session["uID"].ToString());
            note.bnAddTime = System.DateTime.Now;
            lq.BBSNote.InsertOnSubmit(note);
            lq.SubmitChanges();
            Response.Redirect("MessageManage.aspx");
        }
    }
}