<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Employee.master" AutoEventWireup="true" CodeFile="EmployeeHomePage.aspx.cs" Inherits="Pages_HomePage" %>

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
                                <!--Profile Picture-->
                                <div class="form-group">
                                    <asp:Image ID="EmpImage" runat="server" ImageUrl="../assets/images/samples/architecture1.jpg" Width="200px" Style="border-radius: 15px;"/>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <!--Personal Data-->
                                        <div class="form-group">
                                            <asp:Label ID="EmpNameLabel" runat="server" Text="Name" style="font-size: 25px;"></asp:Label><br />
                                            <asp:TextBox ID="EmpName" runat="server" Text="" Enabled="false" style="font-size: 20px; width: 70%;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <asp:Label ID="EmpIDLabel" runat="server" Text="Medical ID" style="font-size: 25px;"></asp:Label><br />
                                            <asp:TextBox ID="EmpID" runat="server" Text="" Enabled="false" style="font-size: 20px; width: 70%;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <asp:Label ID="EmpEmailLabel" runat="server" Text="Email" style="font-size: 25px;"></asp:Label><br />
                                            <asp:TextBox ID="EmpEmail" runat="server" Text="" Enabled="false" style="font-size: 20px; width: 70%;"></asp:TextBox>
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

