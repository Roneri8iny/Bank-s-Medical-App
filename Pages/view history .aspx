<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Finance.master" AutoEventWireup="true" CodeFile="view history .aspx.cs" Inherits="Pages_view_history_" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" Runat="Server">
    <h2>Finance</h2>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    
    <h4 class="card-title">Previous Requests</h4>
    <div class="card-content">
        <div class="card-body">
            <!-- Content for card body -->
        </div>
        <div class="table-responsive">
            <table class="table mb-0">
                <thead class="thead-dark">
                    <tr>
                        <th>REQUEST ID</th>
                        <th>REQUESTER NAME</th>
                        <th>DESCRIPTION</th>
                        <th>AMOUNT</th>
                        <th>STATUS</th>
                        <th>DATE</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>001</td>
                        <td class="text-bold-500">Michael Right</td>
                        <td>Project budget approval.</td>
                        <td>$1,500</td>
                        <td class="text-success">Approved</td>
                        <td>05 Aug 2024</td>
                    </tr>
                    <tr>
                        <td>002</td>
                        <td class="text-bold-500">Morgan Vanblum</td>
                        <td>Travel reimbursement.</td>
                        <td>$300</td>
                        <td class="text-danger">Declined</td>
                        <td>04 Aug 2024</td>
                    </tr>
                    <tr>
                        <td>003</td>
                        <td class="text-bold-500">Tiffani Blogz</td>
                        <td>Equipment purchase.</td>
                        <td>$2,000</td>
                        <td class="text-success">Approved</td>
                        <td>03 Aug 2024</td>
                    </tr>
                    <tr>
                        <td>004</td>
                        <td class="text-bold-500">Ashley Boul</td>
                        <td>Software license renewal.</td>
                        <td>$450</td>
                        <td class="text-warning">Pending</td>
                        <td>02 Aug 2024</td>
                    </tr>
                    <tr>
                        <td>005</td>
                        <td class="text-bold-500">Mikkey Mice</td>
                        <td>Office supplies.</td>
                        <td>$120</td>
                        <td class="text-success">Approved</td>
                        <td>01 Aug 2024</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <h4 class="card-title mt-4">All Previous Appointments</h4>
    <div class="card-content">
        <div class="card-body">
            <!-- Content for card body -->
        </div>
        <div class="table-responsive">
            <table class="table mb-0">
                <thead class="thead-dark">
                    <tr>
                        <th>APPOINTMENT ID</th>
                        <th>CLIENT NAME</th>
                        <th>SERVICE</th>
                        <th>DATE</th>
                        <th>TIME</th>
                        <th>STATUS</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>101</td>
                        <td class="text-bold-500">John Doe</td>
                        <td>Financial Consultation</td>
                        <td>07 Aug 2024</td>
                        <td>10:00 AM</td>
                        <td class="text-success">Completed</td>
                    </tr>
                    <tr>
                        <td>102</td>
                        <td class="text-bold-500">Jane Smith</td>
                        <td>Tax Filing</td>
                        <td>06 Aug 2024</td>
                        <td>01:00 PM</td>
                        <td class="text-success">Completed</td>
                    </tr>
                    <tr>
                        <td>103</td>
                        <td class="text-bold-500">Alice Johnson</td>
                        <td>Investment Advice</td>
                        <td>05 Aug 2024</td>
                        <td>03:00 PM</td>
                        <td class="text-warning">Pending</td>
                    </tr>
                    <tr>
                        <td>104</td>
                        <td class="text-bold-500">Bob Brown</td>
                        <td>Retirement Planning</td>
                        <td>04 Aug 2024</td>
                        <td>09:00 AM</td>
                        <td class="text-danger">Cancelled</td>
                    </tr>
                    <tr>
                        <td>105</td>
                        <td class="text-bold-500">Sarah Wilson</td>
                        <td>Wealth Management</td>
                        <td>03 Aug 2024</td>
                        <td>11:00 AM</td>
                        <td class="text-success">Completed</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Script" Runat="Server">
</asp:Content>

