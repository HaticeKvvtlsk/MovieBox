<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="MovieBoxUI.Login1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="login-container">
        <div action="" class="form-login">
            <ul class="login-nav">
                <li class="login-nav__item active">
                    <a href="Giris.aspx">Sign In</a>
                </li>
                <li class="login-nav__item">
                    <a href="Register.aspx">Sign Up</a>
                </li>
            </ul>
            
            <label for="email" class="login__label">
                E-Mail :
            </label>
            <input id="email" class="login__input" type="email"  name="email" value=""/>
            <label for="pswd" class="login__label">
                Password
            </label>
            <input id="pswd" class="login__input" type="password" name="pswd" />
            <label for="login-sign-up" class="login__label--checkbox"  name="pswd" >
                <input id="login-sign-up" type="checkbox" class="login__input--checkbox" />
                Keep me Signed in
            </label>
                        <asp:Button ID="Giris" class="login__submit" runat="server" Text="Sign in" OnClick="Giris_Click" />
           

        </div>
        <a href="#" class="login__forgot">Forgot Password?</a>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
