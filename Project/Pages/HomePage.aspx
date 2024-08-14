<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Employee.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="Pages_HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" runat="Server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
        </ol>
    </nav>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <section id="multiple-column-form">
        <div class="row match-height">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Personal Info</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form">
                                <div class="form-group">
                                    <asp:Image ID="EmpImage" runat="server" ImageUrl="../assets/images/samples/architecture1.jpg" Width="200px" Style="border-radius: 15px;"/>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <asp:Label ID="EmpName" runat="server" Text="Name" style="font-size: 25px;"></asp:Label><br />
                                            <asp:TextBox ID="Name" runat="server" Text="Jane Eyre" Enabled="false" style="font-size: 20px; width: 70%;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <asp:Label ID="EmpID" runat="server" Text="Medical ID" style="font-size: 25px;"></asp:Label><br />
                                            <asp:TextBox ID="ID" runat="server" Text="123456789" Enabled="false" style="font-size: 20px; width: 70%;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <asp:Label ID="EmpEmail" runat="server" Text="Email" style="font-size: 25px;"></asp:Label><br />
                                            <asp:TextBox ID="Email" runat="server" Text="JaneEyre123@gmail.com" Enabled="false" style="font-size: 20px; width: 70%;"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>

