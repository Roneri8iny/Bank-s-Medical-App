<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AnalysisDoctor.master" AutoEventWireup="true" CodeFile="TestRequests.aspx.cs" Inherits="Pages_TestRequests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Test Requests</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <!-- Hoverable rows start -->
    <section class="section">
        <div class="row" id="table-hover-row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Test Requests</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                        </div>
                        <!-- table hover -->
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th>Employee Name</th>
                                        <th>Employee ID</th>
                                        <th>Employee Email</th>
                                        <th>View Test Requset</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="TestRequestsRepeater" runat="server" OnItemCommand="TestRequestsRepeater_ItemCommand">
                                        <ItemTemplate>
                                            <tr>
                                                <td class="text-bold-500"><%# Eval("EmployeeName") %></td>
                                                <td><%# Eval("EmployeeID") %></td>
                                                <td><%# Eval("Email") %></td>
                                                <td>
                                                    <div class="buttons">
                                                        <asp:LinkButton ID="btnViewDetails" runat="server"
                                                            CommandName="ViewTestDetails"
                                                            CommandArgument='<%# string.Format("{0}, {1}",Eval("EmployeeID"), Eval("ReportID")) %>'
                                                            CssClass="btn btn-primary rounded-pill">
                                                            View Details
                                                        </asp:LinkButton>
                                                    </div>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hoverable rows end -->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>