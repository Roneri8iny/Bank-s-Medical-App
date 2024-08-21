<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Finance.master" AutoEventWireup="true" CodeFile="Veiwrequests.aspx.cs" Inherits="Pages_FinanceHome" %>

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
                <asp:GridView ID="RequestsGridView" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" runat="server" OnRowCommand="RequestsGridView_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" />
                        <asp:BoundField DataField="ApStatus" HeaderText="Appointment Status" />
                        <asp:BoundField DataField="Diagnosis" HeaderText="Diagnosis" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <div class="action-buttons">
                                    <asp:LinkButton ID="AcceptButton" Text="Accept" CssClass="btn btn-success btn-sm btn-custom" CommandName="Accept" CommandArgument='<%# Eval("EmployeeID") %>' runat="server" />
                                    <asp:LinkButton ID="DeclineButton" Text="Decline" CssClass="btn btn-danger btn-sm btn-custom" CommandName="Decline" CommandArgument='<%# Eval("EmployeeID") %>' runat="server" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="table-responsive">
                <asp:GridView ID="PrescriptionsGridView" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" runat="server" OnRowCommand="PrescriptionsGridView_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="AppointmentID" HeaderText="Appointment ID" />
                        <asp:BoundField DataField="PayStatus" HeaderText="Pay Status" />
                        <asp:BoundField DataField="Monthly" HeaderText="Monthly" />
                        
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <div class="action-buttons">
                                    <asp:LinkButton ID="AcceptPrescriptionButton" Text="Accept" CssClass="btn btn-success btn-sm btn-custom" CommandName="AcceptPrescription" CommandArgument='<%# Eval("AppointmentID") %>' runat="server" />
                                    <asp:LinkButton ID="DeclinePrescriptionButton" Text="Decline" CssClass="btn btn-danger btn-sm btn-custom" CommandName="DeclinePrescription" CommandArgument='<%# Eval("AppointmentID") %>' runat="server" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="Server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastify-js/1.12.0/toastify.min.js"></script>
    <script type="text/javascript">
        function handleAction(button, action) {
            var row = button.closest('tr');
            row.style.display = 'none';

            // Display a simple JavaScript alert
            alert('Request ' + action + 'd successfully!');

            // Optionally, send an AJAX request to update the server-side data
            // This is commented out as you might not need it
            // var xhr = new XMLHttpRequest();
            // xhr.open("POST", "UpdateStatusHandler.ashx", true);
            // xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            // xhr.send("action=" + action + "&id=" + button.getAttribute('data-id'));
        }
</script>

</asp:Content>
