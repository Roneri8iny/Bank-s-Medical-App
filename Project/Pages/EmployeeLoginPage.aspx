﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EmployeeLogin.master" AutoEventWireup="true" CodeFile="EmployeeLoginPage.aspx.cs" Inherits="Pages_EmployeeLoginPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="Server">
    <div id="auth">

        <div class="row h-100">
            <div class="col-lg-5 col-12">
                <div id="auth-left">
                    <div class="auth-logo">
                        <a href="HomePage.aspx">
                            <asp:Image ID="Logo" runat="server" ImageUrl="../assets/images/logo/logo.png" /></a>
                    </div>
                    <asp:Label ID="Login" runat="server" Text="Log in." CssClass="auth-title" Style="font-weight: 700; line-height: 1.2; color: #25396f; display: block;"></asp:Label>
                    <asp:Label ID="Label1" runat="server" Text="Log in with your data that you entered during registration." CssClass="auth-subtitle mb-5" Style="display: block;"></asp:Label>

                    <div>

                        <div class="form-group position-relative has-icon-left mb-4">
                            <asp:TextBox ID="Username" runat="server" CssClass="form-control form-control-xl" Placeholder="Username"></asp:TextBox>
                            <div class="form-control-icon">
                                <i class="bi bi-person"></i>
                            </div>
                        </div>
                        <div class="form-group position-relative has-icon-left mb-4">
                            <asp:TextBox ID="Password" runat="server" CssClass="form-control form-control-xl" Placeholder="Password"></asp:TextBox>

                            <div class="form-control-icon">
                                <i class="bi bi-shield-lock"></i>
                            </div>
                        </div>
                        <asp:Button ID="LoginButton" OnClick="LoginButton_Click" runat="server" Text="Log in" CssClass="btn btn-primary btn-block btn-lg shadow-lg mt-5" />
                    </div>

                    <div class="card-body">
                        <div class="alert alert-success" runat="server" id="success_div" visible="false">
                            <asp:Label ID="lbl_success" runat="server"></asp:Label>
                        </div>
                        <div class="alert alert-danger" runat="server" id="error_div" visible="false">
                            <asp:Label ID="lbl_error" runat="server"></asp:Label>

                        </div>
                    </div>

                </div>
            </div>
            <div class="col-lg-7 d-none d-lg-block">
                <div id="auth-right">
                </div>
            </div>
        </div>

    </div>
</asp:Content>

