<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Doctor.master" AutoEventWireup="true" CodeFile="EmployeeHistory.aspx.cs" Inherits="Pages_EmployeeHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Employee Medical History</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <section id="multiple-column-form">
        <div class="row match-height">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Employee's Medical History</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <div class="list-group">
                                <asp:Repeater ID="rpt_pastAppointments" runat="server">
                                    <ItemTemplate>
                                        <span class="list-group-item">
                                            <asp:Label ID="lbl_appointment" runat="server" Text='<%# Eval("AppointmentID", "Appointment ID: {0}") %>' CssClass="mb-1" Style="font-size: 20px; color: #25396f; font-weight: bold; display: block;"></asp:Label>

                                            <asp:Label ID="lbl_doctorName" runat="server" Text='<%# Eval("DoctorName", "Doctor: {0}") %>' CssClass="mb-1" Style="display: block;"></asp:Label>
                                            <asp:Label ID="lbl_department" runat="server" Text='<%# Eval("DepartmentName", "Department: {0}") %>' CssClass="mb-1" Style="display: block;"></asp:Label>
                                            <asp:Label ID="lbl_status" runat="server" Text='<%# Eval("ApStatus", "Appointment Status: {0}") %>' CssClass="mb-1" Style="display: block;"></asp:Label>
                                            <asp:Label ID="lbl_diagnosis" runat="server" Text='<%# Eval("Diagnosis", "Diagnosis: {0}") %>' CssClass="mb-1" Style="display: block;"></asp:Label>
                                            <asp:Label ID="lbl_sickLeaves" runat="server" Text='<%# Eval("sickLeaveCount", "Sick Leave Days: {0}") %>' CssClass="mb-1" Style="display: block;"></asp:Label>
                                        </span>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Previous Lab Reports</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <div class="list-group">
                                <asp:Repeater ID="TestRepeater" runat="server" OnItemCommand="TestRepeater_ItemCommand">
                                    <ItemTemplate>
                                        <span class="list-group-item">
                                            <asp:Label ID="lbl_labReport" runat="server" Text='<%# Eval("ReportDate", "Report Date: {0}") %>' CssClass="mb-1" Style="font-size: 20px; color: #25396f; font-weight: bold; display: block;"></asp:Label>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("LabName", "Lab Name: {0}") %>' CssClass="mb-1" Style="display: block;"></asp:Label>
                                            <div class="buttons">
                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="ViewDetails" CommandArgument='<%# Eval("ReportID") %>' Text="View Details" CssClass="btn btn-primary rounded-pill" />
                                            </div>
                                            

                                        </span>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Previous Prescriptions</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <div class="list-group">
                                <asp:Repeater ID="PrescriptionRepeater" runat="server" OnItemCommand="PrescriptionRepeater_ItemCommand">
                                    <ItemTemplate>
                                        <span class="list-group-item">
                                            <asp:Label ID="lbl_prescription" runat="server" Text='<%# Eval("PrescriptionID", "Prescription ID: {0}") %>' CssClass="mb-1" Style="font-size: 20px; color: #25396f; font-weight: bold; display: block;"></asp:Label>

                                            
                                            <asp:Label ID="lbl_doctor" runat="server" Text='<%# Eval("DoctorName", "Doctor Name: {0}") %>' CssClass="mb-1" Style="display: block;"></asp:Label>
                                            <asp:Label ID="lbl_department" runat="server" Text='<%# Eval("Department", "Department: {0}") %>' CssClass="mb-1" Style="display: block;"></asp:Label>
                                            <div class="buttons">
                                                <asp:LinkButton ID="btnViewDetails" runat="server" CommandName="ViewDetails" CommandArgument='<%# Eval("PrescriptionID") %>' Text="View Details" CssClass="btn btn-primary rounded-pill" />
                                            </div>
                                        </span>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Script" Runat="Server">
</asp:Content>

