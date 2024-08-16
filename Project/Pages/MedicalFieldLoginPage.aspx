<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MedicalFieldLogin.master" AutoEventWireup="true" CodeFile="MedicalFieldLoginPage.aspx.cs" Inherits="Pages_MedicalFieldLoginPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Content for the head section, if any, can go here. -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="Server">
    <div id="auth">

        <div class="row h-100">
            <div class="col-lg-5 col-12">
                <div id="auth-left">
                    <div class="auth-logo">
                        <!-- Logo for the medical field login page -->
                        <a href="HomePage.aspx">
                            <asp:Image ID="Logo" runat="server" ImageUrl="../assets/images/logo/logo.png" />
                        </a>
                    </div>
                    <!-- Main title for the login page -->
                    <asp:Label ID="Login" runat="server" Text="Log in." CssClass="auth-title" Style="font-weight: 700; line-height: 1.2; color: #25396f; display: block;"></asp:Label>
                    <!-- Subtitle with instructions for logging in -->
                    <asp:Label ID="Label1" runat="server" Text="Log in with your data that you entered during registration." CssClass="auth-subtitle mb-5" Style="display: block;"></asp:Label>

                    <div>
                        <!-- Dropdown for selecting the account type -->
                        <div class="form-group position-relative mb-4">
                            <div class="btn-group dropdown me-1 mb-1">
                                <asp:Label ID="AccountTypeLabel" runat="server" Text="Account Type" CssClass="btn btn-primary"></asp:Label>
                                <asp:DropDownList ID="AccountType" runat="server" CssClass="btn btn-primary dropdown-toggle dropdown-toggle-split"
                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                    data-reference="parent">
                                    <asp:ListItem Text="---" Value="---"></asp:ListItem>
                                    <asp:ListItem Text="Employee" Value="Employee"></asp:ListItem>
                                    <asp:ListItem Text="Doctor" Value="Doctor"></asp:ListItem>
                                    <asp:ListItem Text="Lab Doctor" Value="Lab Doctor"></asp:ListItem>
                                    <asp:ListItem Text="Middle Man" Value="Middle Man"></asp:ListItem>
                                    <asp:ListItem Text="Medical Field" Value="Medical Field"></asp:ListItem>
                                    <asp:ListItem Text="Finance" Value="Finance"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <!-- Username input field -->
                        <div class="form-group position-relative has-icon-left mb-4">
                            <asp:TextBox ID="Username" runat="server" CssClass="form-control form-control-xl" Placeholder="Username"></asp:TextBox>
                            <div class="form-control-icon">
                                <i class="bi bi-person"></i>
                            </div>
                        </div>
                        <!-- Password input field -->
                        <div class="form-group position-relative has-icon-left mb-4">
                            <asp:TextBox ID="Password" runat="server" CssClass="form-control form-control-xl" Placeholder="Password" TextMode="Password"></asp:TextBox>
                            <div class="form-control-icon">
                                <i class="bi bi-shield-lock"></i>
                            </div>
                        </div>
                        <!-- Login button -->
                        <asp:Button ID="LoginButton" OnClick="LoginButton_Click" runat="server" Text="Log in" CssClass="btn btn-primary btn-block btn-lg shadow-lg mt-5" />
                    </div>

                    <div class="card-body">
                        <!-- Success message -->
                        <div class="alert alert-success" runat="server" id="success_div" visible="false">
                            <asp:Label ID="lbl_success" runat="server"></asp:Label>
                        </div>
                        <!-- Error message -->
                        <div class="alert alert-danger" runat="server" id="error_div" visible="false">
                            <asp:Label ID="lbl_error" runat="server"></asp:Label>
                        </div>
                    </div>
                    <!-- Forgot password link -->
                    <div class="text-center mt-5 text-lg fs-4">
                        <asp:HyperLink runat="server" NavigateUrl="#" CssClass="font-bold">Forgot password?</asp:HyperLink>
                    </div>
                </div>
            </div>
            <div class="col-lg-7 d-none d-lg-block">
                <div id="auth-right">
                    <!-- Additional content or imagery for the right side of the login page could go here -->
                </div>
            </div>
        </div>

    </div>
</asp:Content>
