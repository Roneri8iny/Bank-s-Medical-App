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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div id="multiple-column-form">
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
                                                                data-reference="parent" AutoPostBack="true" OnSelectedIndexChanged="Departments_SelectedIndexChanged">
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
                                                            <asp:Repeater ID="SlotsRpt" runat="server">
                                                                <ItemTemplate>
                                                                    <span class="list-group-item">
                                                                        <asp:Label ID="DoctorName" runat="server" Text='<%# Eval("DoctorName", "{0}") %>' CssClass="mb-1" Style="font-size: 20px; color: #25396f; font-weight: bold; display: block;"></asp:Label>
                                                                        <asp:Label ID="Price" runat="server" Text='<%# Eval("DoctorPrice", "Price: {0}") %>' CssClass="mb-1" Style="display: block;"></asp:Label>
                                                                        <asp:Label ID="Date" runat="server" Text="Pick a Date: "></asp:Label>
                                                                        <asp:TextBox ID="Calender" runat="server" TextMode="Date">
                                                                            <asp:TextBox.SelectedDate>
                                                                                <asp:CalendarDate Day="1" Month="1" Year="2024"></asp:CalendarDate>
                                                                            </asp:TextBox.SelectedDate>
                                                                        </asp:TextBox>
                                                                        <asp:Label ID="Day" runat="server" Text='<%# Eval("AppointmentDay", "Day: {0}") %>' CssClass="mb-1" Style="display: block;"></asp:Label>
                                                                        <asp:Label ID="StartTime" runat="server" Text='<%# Eval("StartTime", "Start Time: {0}") %>' CssClass="mb-1" Style="display: block;"></asp:Label>
                                                                        <asp:Label ID="EndTime" runat="server" Text='<%# Eval("Endtime", "End Time: {0}") %>' CssClass="mb-1" Style="display: block;"></asp:Label>
                                                                        <div class="d-flex w-100 justify-content-end">
                                                                            <asp:Button ID="RequestButton" OnClick="AppRequestButton_Click" runat="server" Text="Request" CssClass="btn btn-primary rounded-pill" />
                                                                        </div>
                                                            <div class="alert alert-success" runat="server" id="success_div" visible="false">
                                                                <asp:Label ID="lbl_success" runat="server"></asp:Label>
                                                            </div>
                                                                        <div class="alert alert-danger" runat="server" id="error_div" visible="false">
                                                                            <asp:Label ID="lbl_error" runat="server"></asp:Label>

                                                                        </div>
                                                                    </span>
                                                                </ItemTemplate>
                                                            </asp:Repeater>


                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                                <asp:Panel ID="AvailableLabsPanel" runat="server" Visible="false">
                                                    <!--Available Labs-->
                                                    <div class="form-group">
                                                        <p>
                                                            Available Labs
                                                        </p>
                                                        <div class="list-group" id="">
                                                            <span class="list-group-item">
                                                                <asp:Label ID="LabHotline" runat="server" Text="" Style="display: block;"></asp:Label>
                                                                <asp:Label ID="LabAddress" runat="server" Text="" Style="display: block;"></asp:Label>
                                                                <asp:Label ID="LabEmail" runat="server" Text="" Style="display: block;"></asp:Label>
                                                                <div class="d-flex w-100 justify-content-end">
                                                                    <asp:Button ID="ViewButton" OnClick="ViewButton_Click" runat="server" Text="View" CssClass="btn btn-primary rounded-pill" />
                                                                </div>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                                <asp:Panel ID="RequestedLabReportsPanel" runat="server" Visible="false">
                                                    <div class="form-group">
                                                        <p>
                                                            Requested Lab Reports
                                                        </p>
                                                        <div class="list-group" id="">
                                                            <asp:Repeater ID="LabReportsRpt" runat="server">
                                                                <ItemTemplate>
                                                                    <span class="list-group-item">
                                                                        <asp:Label ID="DoctorName" runat="server" Text='<%# Eval("DoctorName", "{0}") %>' Style="display: block;"></asp:Label>
                                                                        <asp:Label ID="AppointmentDay" runat="server" Text='<%# Eval("AppointmentDay", "Appointment Day: {0}") %>' Style="display: block;"></asp:Label>
                                                                        <asp:TextBox ID="Calender" runat="server" TextMode="Date">
                                                                            <asp:TextBox.SelectedDate>
                                                                                <asp:CalendarDate Day="1" Month="1" Year="2024"></asp:CalendarDate>
                                                                            </asp:TextBox.SelectedDate>
                                                                        </asp:TextBox>
                                                                        <asp:Label ID="Diagnosis" runat="server" Text='<%# Eval("Diagnosis", "Diagnosis: {0}") %>' Style="display: block;"></asp:Label>

                                                                        <asp:Label ID="LabReportDetails" runat="server" Text='<%# Eval("LabReportDetails", "Test Name: {0}") %>' Style="display: block;"></asp:Label>
                                                                        <div class="d-flex w-100 justify-content-end">
                                                                            <asp:Button ID="Button1" OnClick="AppRequestButton_Click" runat="server" Text="Request" CssClass="btn btn-primary rounded-pill" />

                                                                        </div>
                                                                        <div class="alert alert-success" runat="server" id="success_div" visible="false">
                                                                <asp:Label ID="lbl_success" runat="server"></asp:Label>
                                                            </div>
                                                                        <div class="alert alert-danger" runat="server" id="error_div" visible="false">
                                                                            <asp:Label ID="lbl_error" runat="server"></asp:Label>

                                                                        </div>
                                                                    </span>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
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
            </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>
