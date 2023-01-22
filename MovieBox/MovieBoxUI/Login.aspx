<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MovieBoxUI.Login1" %>
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
            <label for="login-input-user" class="login__label">
                Username
            </label>
            <input id="login-input-user" class="login__input" type="text" />
            <label for="login-input-password" class="login__label">
                Password
            </label>
            <input id="login-input-password" class="login__input" type="password" />
            <label for="login-sign-up" class="login__label--checkbox">
                <input id="login-sign-up" type="checkbox" class="login__input--checkbox" />
                Keep me Signed in
            </label>
            <button class="login__submit" disabled>Sign in</button>

        </div>
        <a href="#" class="login__forgot">Forgot Password?</a>
    </div>

</asp:Content>
