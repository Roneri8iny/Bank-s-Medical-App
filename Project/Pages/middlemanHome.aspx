<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Middleman.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="middlemanHome.aspx.cs" Inherits="Pages_middlemanHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* Custom styling to match the template's color scheme */
        .profile-container {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .profile-title {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .profile-item {
            margin-bottom: 15px;
        }

        .profile-item label {
            font-weight: bold;
            margin-right: 10px;
        }

        .profile-item span {
            color: #333;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" runat="Server">
    <h2>Middleman Profile</h2>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <div class="profile-container">
        <div class="profile-title">Profile Information</div>
        <div class="profile-item">
            <label>Middleman Name:</label>
            <span><asp:Label ID="MMNameLabel" runat="server" /></span>
        </div>
        <div class="profile-item">
            <label>Username:</label>
            <span><asp:Label ID="UsernameLabel" runat="server" /></span>
        </div>
        <div class="profile-item">
            <label>Email:</label>
            <span><asp:Label ID="EmailLabel" runat="server" /></span>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="Server">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</asp:Content>
