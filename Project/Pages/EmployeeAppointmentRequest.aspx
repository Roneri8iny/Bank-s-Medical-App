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
                                                <!--Medical Field Dropdown List-->
                                                <asp:DropDownList ID="MedicalFields" runat="server" CssClass="btn btn-primary dropdown-toggle dropdown-toggle-split"
                                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                                    data-reference="parent" AutoPostBack="true" OnSelectedIndexChanged="MedicalFields_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <asp:Panel ID="DepartmentsPanel" runat="server">
                                            <div class="form-group">
                                                <div class="btn-group dropdown me-1 mb-1">
                                                    <!--Departments Dropdown List-->
                                                    <asp:DropDownList ID="Departments" runat="server" CssClass="btn btn-primary dropdown-toggle dropdown-toggle-split"
                                                        data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                                        data-reference="parent">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <asp:Panel ID="AvailableSlotsPanel" runat="server">
                                            <!--Available Doctors List-->
                                            <div class="form-group">
                                                <p>
                                                    Available slots
                                                </p>
                                                <div class="list-group" id="">
                                                    <span class="list-group-item">
                                                        <asp:Label ID="DoctorName" runat="server" Text="Doctor X" CssClass="mb-1" Style="font-size: 20px; color: #25396f; font-weight: bold; display: block;"></asp:Label>

                                                        <asp:Label ID="Price" runat="server" Text="Price: $$" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                        <asp:Label ID="StartTime" runat="server" Text="Sun 12:00pm to 2:00 pm" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                        <asp:Label ID="EndTime" runat="server" Text="Wed 2:00pm to 4:00 pm" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                        <div class="d-flex w-100 justify-content-end">
                                                            <asp:Button ID="RequestButton" runat="server" Text="Request" CssClass="btn btn-primary rounded-pill" />
                                                        </div>
                                                    </span>

                                                </div>
                                            </div>
                                        </asp:Panel>
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

