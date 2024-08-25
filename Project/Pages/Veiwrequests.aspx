<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Finance.master" AutoEventWireup="true" CodeFile="Veiwrequests.aspx.cs" Inherits="Pages_Veiwrequests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastify-js/1.12.0/toastify.min.css" rel="stylesheet" />
    <style>
        .card-content {
            margin: 20px 0;
        }

        .table-responsive {
            margin-bottom: 30px;
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }

        .btn-custom {
            margin: 0 5px;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 5px;
        }

        .card-title {
            margin-bottom: 20px;
        }

        .table th {
            background-color: #f8f9fa;
            font-weight: bold;
        }

        .table-bordered {
            border: 1px solid #dee2e6;
        }

            .table-bordered th, .table-bordered td {
                border: 1px solid #dee2e6;
            }

        .btn {
            padding: 5px 10px;
            font-size: 0.875rem;
            border-radius: 4px;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-custom:hover {
            color: #fff;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" runat="Server">
    <h2 class="text-center my-4">Finance</h2>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <h4 class="card-title text-center mb-4">View Requests</h4>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <h6 class="card-title text-start mb-4">Test Requests</h6>
                <asp:GridView ID="AppointmentsGridView" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" runat="server" OnRowCommand="AppointmentsGridView_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="ReportID" HeaderText="Report ID" />
                        <asp:BoundField DataField="LabName" HeaderText="Lab Name" />
                        <asp:BoundField DataField="TestName" HeaderText="Test Name" />
                        <asp:BoundField DataField="Diagnosis" HeaderText="Diagnosis" />
                        <asp:BoundField DataField="Price" HeaderText="Price" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <div class="action-buttons">
                                    <asp:LinkButton ID="AcceptButton" Text="Accept" CssClass="btn btn-success btn-sm btn-custom" CommandName="Accept" CommandArgument='<%# Eval("ReportID") %>' runat="server" />
                                    <asp:LinkButton ID="DeclineButton" Text="Decline" CssClass="btn btn-danger btn-sm btn-custom" CommandName="Decline" CommandArgument='<%# Eval("ReportID") %>' runat="server" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="table-responsive">
                <h6 class="card-title text-start mb-4">Medicine Requests</h6>
                <asp:GridView ID="PrescriptionsGridView" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" runat="server" OnRowCommand="PrescriptionsGridView_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="PrescriptionID" HeaderText="Prescription ID" />
                        <asp:BoundField DataField="MedicineName" HeaderText="Medicine Name" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                        <asp:BoundField DataField="TotalPrice" HeaderText="Price" />
                        <asp:BoundField DataField="Diagnosis" HeaderText="Diagnosis" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <div class="action-buttons">
                                    <asp:LinkButton ID="AcceptPrescriptionButton" Text="Accept" CssClass="btn btn-success btn-sm btn-custom" CommandName="AcceptPrescription" CommandArgument='<%# Eval("PrescriptionID") %>' runat="server" />
                                    <asp:LinkButton ID="DeclinePrescriptionButton" Text="Decline" CssClass="btn btn-danger btn-sm btn-custom" CommandName="DeclinePrescription" CommandArgument='<%# Eval("PrescriptionID") %>' runat="server" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
