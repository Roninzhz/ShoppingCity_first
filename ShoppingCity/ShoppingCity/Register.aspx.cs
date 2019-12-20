using System;
using System.Web;

namespace ShoppingCity
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["CheckCode"];
            BBSDataContext lq = new BBSDataContext();
            Users user = new Users();
            user.uName = txtuName.Text;
            user.uPwd = txtuPwd.Text;
            user.uPhone = txtuPhone.Text;
            user.uRegTime = System.DateTime.Now;
            lq.Users.InsertOnSubmit(user);
            lq.SubmitChanges();
            if (cookie.Value == txtCheckCode.Text)
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('注册成功');location.href='Login.aspx';</script>");
            else
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('验证码错误');</script>");
        }
    }
}