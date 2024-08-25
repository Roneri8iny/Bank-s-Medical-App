<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Finance.master" AutoEventWireup="true" CodeFile="viewhistory.aspx.cs" Inherits="Pages_viewhistory" %>

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
        .card-title {
            margin-bottom: 20px;
        }
        .history-tables {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 20px;
        }
        .history-table {
            flex: 1;
            min-width: 300px; /* Ensures tables are responsive on smaller screens */
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
        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }
        .btn {
            padding: 5px 10px;
            font-size: 0.875rem;
            border-radius: 4px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" runat="Server">
    <h2 class="text-center my-4">Finance - History</h2>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <div class="history-tables">
        <!-- Appointment History Section -->
        <div class="history-table">
            <h4 class="card-title text-center mb-4">View Lab Reports History</h4>
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView ID="RequestsHistoryGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover">
                            <Columns>
                                <asp:BoundField DataField="ReportID" HeaderText="Report ID" />
                                <asp:BoundField DataField="TestName" HeaderText="Test Name" />
                                <asp:BoundField DataField="Diagnosis" HeaderText="Diagnosis" />
                                <asp:BoundField DataField="Price" HeaderText="Price" />
                                <asp:BoundField DataField="PayStatus" HeaderText="Status" />
                                <asp:BoundField DataField="AppointmentDate" HeaderText="Appointment Date" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false" />
                              
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

        <!-- Prescription History Section -->
        <div class="history-table">
            <h4 class="card-title text-center mb-4">View Prescription History</h4>
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView ID="PrescriptionsHistoryGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover">
                            <Columns>
                                <asp:BoundField DataField="PrescriptionID" HeaderText="Prescription ID" />
                                <asp:BoundField DataField="MedicineName" HeaderText="Medicine Name" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" />
                                <asp:BoundField DataField="PayStatus" HeaderText="Status" />
                                <asp:BoundField DataField="Diagnosis" HeaderText="Diagnosis" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="Server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastify-js/1.12.0/toastify.min.js"></script>
</asp:Content>