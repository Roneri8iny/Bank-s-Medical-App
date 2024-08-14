<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Finance.master" AutoEventWireup="true" CodeFile="FinanceHome.aspx.cs" Inherits="Pages_FinanceHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" runat="Server">

    <h2>Finance</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    
   

    
    <h4 class="card-title">View Requests</h4>
    <div class="card-content">
        <div class="card-body">
            <!-- Content for card body -->
        </div>
        <div class="table-responsive">
            <table class="table mb-0">
                <thead class="thead-dark">
                    <tr>
                        <th>NAME</th>
                        <th>ID</th>
                        <th>Request Description</th>
                        <th>Amount</th>
                        <th>Approval Request</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="text-bold-500">Michael Right</td>
                        <td>001</td>
                        <td class="text-bold-500">Request for project budget approval.</td>
                        <td>$1,500</td>
                        <td>
                            <a href="#" class="btn btn-success btn-sm">Accept</a>
                            <a href="#" class="btn btn-danger btn-sm">Decline</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-bold-500">Morgan Vanblum</td>
                        <td>002</td>
                        <td class="text-bold-500">Request for travel reimbursement.</td>
                        <td>$300</td>
                        <td>
                            <a href="#" class="btn btn-success btn-sm">Accept</a>
                            <a href="#" class="btn btn-danger btn-sm">Decline</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-bold-500">Tiffani Blogz</td>
                        <td>003</td>
                        <td class="text-bold-500">Request for equipment purchase.</td>
                        <td>$2,000</td>
                        <td>
                            <a href="#" class="btn btn-success btn-sm">Accept</a>
                            <a href="#" class="btn btn-danger btn-sm">Decline</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-bold-500">Ashley Boul</td>
                        <td>004</td>
                        <td class="text-bold-500">Request for software license renewal.</td>
                        <td>$450</td>
                        <td>
                            <a href="#" class="btn btn-success btn-sm">Accept</a>
                            <a href="#" class="btn btn-danger btn-sm">Decline</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-bold-500">Mikkey Mice</td>
                        <td>005</td>
                        <td class="text-bold-500">Request for office supplies.</td>
                        <td>$120</td>
                        <td>
                            <a href="#" class="btn btn-success btn-sm">Accept</a>
                            <a href="#" class="btn btn-danger btn-sm">Decline</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>

                

<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>

