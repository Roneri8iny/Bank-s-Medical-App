<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Employee.master" AutoEventWireup="true" CodeFile="EmployeeAppointmentRequest.aspx.cs" Inherits="Pages_EmployeeHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageHeader" runat="Server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Appointment Request</li>
        </ol>
    </nav>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="Server">
    <section id="multiple-column-form">
        <div class="row match-height">
            <div class="col-12">
                <div class="card">
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form">
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <div class="btn-group dropdown me-1 mb-1">
                                                <asp:Label ID="Label1" runat="server" Text="Medical Field" CssClass="btn btn-primary"></asp:Label>
                                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="btn btn-primary dropdown-toggle dropdown-toggle-split"
                                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                                    data-reference="parent">
                                                    <asp:ListItem Text="---" Value="---"></asp:ListItem>
                                                    <asp:ListItem Text="Hospital" Value="Hospital"></asp:ListItem>
                                                    <asp:ListItem Text="Clinic" Value="Clinic"></asp:ListItem>
                                                    <asp:ListItem Text="Lab" Value="Lab"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <div class="btn-group dropdown me-1 mb-1">
                                                <asp:Label ID="Label2" runat="server" Text="Departments" CssClass="btn btn-primary"></asp:Label>
                                                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="btn btn-primary dropdown-toggle dropdown-toggle-split"
                                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                                    data-reference="parent">
                                                    <asp:ListItem Text="---" Value="---"></asp:ListItem>
                                                    <asp:ListItem Text="Department 1" Value="Department 1"></asp:ListItem>
                                                    <asp:ListItem Text="Department 2" Value="Department 2"></asp:ListItem>
                                                    <asp:ListItem Text="Department 3" Value="Department 3"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <p>
                                                Available slots
                                            </p>
                                            <div class="list-group">
                                                <span class="list-group-item">
                                                    <asp:Label ID="Label3" runat="server" Text="Doctor X" CssClass="mb-1" Style="font-size: 20px; color: #25396f; font-weight: bold; display: block;"></asp:Label>

                                                    <asp:Label ID="Label4" runat="server" Text="Price: $$" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label5" runat="server" Text="Sun 12:00pm to 2:00 pm" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label6" runat="server" Text="Wed 2:00pm to 4:00 pm" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <div class="d-flex w-100 justify-content-end">
                                                        <asp:Button ID="RequestButton" runat="server" Text="Request" CssClass="btn btn-primary rounded-pill" />
                                                    </div>
                                                </span>
                                                <span class="list-group-item">
                                                    <asp:Label ID="Label7" runat="server" Text="Doctor Y" CssClass="mb-1" Style="font-size: 20px; color: #25396f; font-weight: bold; display: block;"></asp:Label>

                                                    <asp:Label ID="Label8" runat="server" Text="Price: $$" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label9" runat="server" Text="Sun 12:00pm to 2:00 pm" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label10" runat="server" Text="Wed 2:00pm to 4:00 pm" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <div class="d-flex w-100 justify-content-end">
                                                        <asp:Button ID="Button1" runat="server" Text="Request" CssClass="btn btn-primary rounded-pill" />
                                                    </div>
                                                </span>
                                                <span class="list-group-item">
                                                    <asp:Label ID="Label11" runat="server" Text="Doctor Z" CssClass="mb-1" Style="font-size: 20px; color: #25396f; font-weight: bold; display: block;"></asp:Label>

                                                    <asp:Label ID="Label12" runat="server" Text="Price: $$" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label13" runat="server" Text="Sun 12:00pm to 2:00 pm" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label14" runat="server" Text="Wed 2:00pm to 4:00 pm" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <div class="d-flex w-100 justify-content-end">
                                                        <asp:Button ID="Button2" runat="server" Text="Request" CssClass="btn btn-primary rounded-pill" />
                                                    </div>
                                                </span>

                                            </div>
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
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>

