<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Employee.master" AutoEventWireup="true" CodeFile="EmployeeMedicineRequest.aspx.cs" Inherits="Pages_MedicineRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" runat="Server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Medicine Request</li>
        </ol>
    </nav>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <section id="multiple-column-form">
        <div class="row match-height">
            <div class="col-12">
                <div class="card">
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form">
                                <div class="row">
                                    <div>
                                        <div class="form-group">
                                            <p>Monthly Prescriptions</p>
                                            <!--Monthly Prescriptions List-->
                                            <div class="list-group">
                                                <asp:Repeater ID="PrescriptionsRpt" runat="server" OnItemCommand="PrescriptionsRpt_ItemCommand">
                                                    <ItemTemplate>
                                                        <span class="list-group-item">
                                                            <span style="display: block">

                                                                <asp:Label ID="ApDeptLbl" runat="server" Text="Department: " Style="font-size: 18px; color: #333; font-weight: bold;"></asp:Label>
                                                                <asp:Label ID="ApDept" runat="server" Text='<%# Eval("ApDepartment", "{0}") %>' CssClass="mb-1"></asp:Label>
                                                            </span>
                                                            <span style="display: block">
                                                                <asp:Label ID="ApDateLbl" runat="server" Text="Appointment Date: " Style="font-size: 18px; color: #333; font-weight: bold;"></asp:Label>
                                                                <asp:Label ID="ApDate" runat="server" Text='<%# Eval("ApDate", "{0}") %>' CssClass="mb-1"></asp:Label>
                                                            </span>
                                                            <asp:Label ID="DoctorName" runat="server" Text='<%# Eval("DoctorName", "{0}") %>' CssClass="mb-1" Style="display: block; font-size: 18px; color: #333; font-weight: bold;"></asp:Label>

                                                            <asp:Repeater ID="MedicinesRpt" runat="server" DataSource='<%# Eval("Medicines") %>'>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="MedicineLbl" runat="server" Text="Medicine: " Style="font-size: 18px; color: #333; font-weight: bold;"></asp:Label>
                                                                    `       
                                                                    <asp:Label ID="Medicine" runat="server" Text='<%# Eval("Medicine", "{0}") %>' CssClass="mb-1"></asp:Label>

                                                                    <asp:Label ID="FrequencyLbl" runat="server" Text=", Frequency: " Style="font-size: 18px; color: #333; font-weight: bold;"></asp:Label>
                                                                    <asp:Label ID="Frequency" runat="server" Text='<%# Eval("Frequency", "{0}") %>' CssClass="mb-1"></asp:Label>

                                                                    <asp:Label ID="QuantityLbl" runat="server" Text=", Quantity: " Style="font-size: 18px; color: #333; font-weight: bold;"></asp:Label>
                                                                    <asp:Label ID="Quantity" runat="server" Text='<%# Eval("Quantity", "{0}") %>' CssClass="mb-1"></asp:Label>

                                                                    <asp:Label ID="NotesLbl" runat="server" Text=", Notes: " Style="font-size: 18px; color: #333; font-weight: bold;"></asp:Label>
                                                                    <asp:Label ID="ApDate" runat="server" Text='<%# Eval("Notes", "{0}") %>' CssClass="mb-1"></asp:Label>


                                                                </ItemTemplate>
                                                            </asp:Repeater>

                                                            <span style="display: block">
                                                                <asp:Label ID="LstRenewalDateLbl" runat="server" Text="Last Renewal Date: " Style="font-size: 18px; color: #333; font-weight: bold;"></asp:Label>
                                                                <asp:Label ID="LstRenewalDate" runat="server" Text='<%# Eval("LastRenewalDate", "{0}") %>' CssClass="mb-1"></asp:Label>
                                                            </span>

                                                            <div class="d-flex w-100 justify-content-end">
                                                                <asp:LinkButton ID="RenewButton" runat="server"
                                                                    CommandName="RenewPrescription"
                                                                    CommandArgument='<%# Eval("PreID") %>'
                                                                    CssClass="btn btn-primary rounded-pill">
                                                            Renew
                                                        </asp:LinkButton>
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

