using System;
using System.Web;

namespace ShoppingCity
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddluImage_SelectedIndexChanged(object sender, EventArgs e)
        {
            //imguImage.ImageUrl = imguImage.ImageUrl.Substring(0, imguImage.ImageUrl.LastIndexOf("/") + 1) + ddluImage.SelectedValue;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["CheckCode"];
            BBSDataContext lq = new BBSDataContext();
            Users user = new Users();
            user.uName = txtuName.Text;
            user.uPwd = txtuPwd.Text;
            user.uRealName = txtuRealName.Text;
            user.uSex = rbluSex.SelectedValue;
            user.uAge = Convert.ToInt16(txtuAge.Text);
            //for (int i = 0; i < cbluHobby.Items.Count; i++)
            //{
            //    if (cbluHobby.Items[i].Selected)
            //    {
            //        user.uHobby += cbluHobby.Items[i].Value + ",";
            //    }
            //}

            user.uEmail = txtuEmail.Text;
            //user.uQQ = txtuQQ.Text;
            user.uPhone = txtuPhone.Text;
            //user.uImage = imguImage.ImageUrl.Substring(0, imguImage.ImageUrl.LastIndexOf("/") + 1) + ddluImage.SelectedValue;
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