<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Middleman.master" AutoEventWireup="true" CodeFile="Createaccmf.aspx.cs" Inherits="Pages_Createaccmf" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* Custom styling for the dropdown to match the template's color scheme */
        .custom-dropdown {
            background-color: #f8f9fa;
            color: #333;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
            padding: 0.375rem 1.75rem 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            width: 100%;
            background-image: url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16"%3E%3Cpath d="M7.247 11.14 3.451 5.658C3.15 5.178 3.505 4.5 4.204 4.5h7.592c.7 0 1.054.678.754 1.158l-3.796 5.482a.5.5 0 0 1-.814 0z"/%3E%3C/svg%3E');
            background-repeat: no-repeat;
            background-position: right 0.75rem center;
            background-size: 16px 12px;
        }

        .custom-dropdown:focus {
            border-color: #80bdff;
            outline: 0;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }

        /* Positioning the button at the bottom left */
        .card-body {
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .form-control {
            margin-bottom: 1rem;
        }

        .btn-container {
            margin-top: auto;
            text-align: left;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" Runat="Server">
    <h2>Middleman</h2>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <div class="card">
        <h4 class="card-title">Create Medical Field Account</h4>
        <div class="card-content">
            <div class="card-body">
                <asp:ScriptManager ID="ScriptManager1" runat="server" />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="CreateAccountPanel" runat="server">
                            <!-- Username -->
                            <asp:TextBox ID="UsernameTextBox" CssClass="form-control" runat="server" 
                                         PlaceHolder="Enter Username" Name="username" />
                            <asp:RequiredFieldValidator ID="UsernameRequired" ControlToValidate="UsernameTextBox" 
                                ErrorMessage="Username is required." runat="server" ForeColor="Red" />
                            
                            <!-- Password -->
                            <asp:TextBox ID="PasswordTextBox" CssClass="form-control" TextMode="Password" runat="server" 
                                         PlaceHolder="Enter Password" Name="password" />
                            <asp:RequiredFieldValidator ID="PasswordRequired" ControlToValidate="PasswordTextBox" 
                                ErrorMessage="Password is required." runat="server" ForeColor="Red" />
                            
                            <!-- Email -->
                            <asp:TextBox ID="EmailTextBox" CssClass="form-control" runat="server" 
                                         PlaceHolder="Enter Email" Name="email" />
                            <asp:RequiredFieldValidator ID="EmailRequired" ControlToValidate="EmailTextBox" 
                                ErrorMessage="Email is required." runat="server" ForeColor="Red" />
                            <asp:RegularExpressionValidator ID="EmailRegex" ControlToValidate="EmailTextBox" 
                                ErrorMessage="Invalid email format." runat="server" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" />
                            
                            <!-- Medical Field -->
                            <asp:DropDownList ID="MedicalFieldDropDown" CssClass="custom-dropdown" runat="server" 
                                              Name="medicalField">
                                <asp:ListItem Value="Hospital">Hospital</asp:ListItem>
                                <asp:ListItem Value="Specialty Clinic">Specialty Clinic</asp:ListItem>
                                <asp:ListItem Value="Lab">Lab</asp:ListItem>
                                <asp:ListItem Value="Pharmacy">Pharmacy</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="MedicalFieldRequired" ControlToValidate="MedicalFieldDropDown" 
                                ErrorMessage="Medical Field is required." runat="server" ForeColor="Red" />
                            
                            <!-- Hotline -->
                            <asp:TextBox ID="HotlineTextBox" CssClass="form-control" runat="server" 
                                         PlaceHolder="Enter Hotline" Name="hotline" />
                            <asp:RequiredFieldValidator ID="HotlineRequired" ControlToValidate="HotlineTextBox" 
                                ErrorMessage="Hotline is required." runat="server" ForeColor="Red" />
                            
                            <!-- Address -->
                            <asp:TextBox ID="AddressTextBox" CssClass="form-control" TextMode="MultiLine" Rows="3" 
                                         runat="server" PlaceHolder="Enter Address" Name="address" />
                            <asp:RequiredFieldValidator ID="AddressRequired" ControlToValidate="AddressTextBox" 
                                ErrorMessage="Address is required." runat="server" ForeColor="Red" />
                            
                            <!-- Create Account Button -->
                            <div class="btn-container">
                                <asp:Button ID="CreateAccountButton" Text="Create Account" CssClass="btn btn-success" 
                                    OnClick="CreateAccountButton_Click" runat="server" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Script" Runat="Server">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</asp:Content>
