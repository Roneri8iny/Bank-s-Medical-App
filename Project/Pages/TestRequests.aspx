<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AnalysisDoctor.master" AutoEventWireup="true" CodeFile="TestRequests.aspx.cs" Inherits="Pages_TestRequests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Test Requests</Title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
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
                                                    <th>View Test Request</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="text-bold-500">Michael Right</td>
                                                    <td>1</td>
                                                    <td>1@gmail.com</td>
                                                    <td><div class="buttons">
                                                            <a href="Test Details.aspx" class="btn btn-primary rounded-pill">View Details</a>

                                                        </div></td>
                                                </tr>
                                                <tr>
                                                    <td class="text-bold-500">Morgan Vanblum</td>
                                                    <td>2</td>
                                                    <td>2@gmail.com</td>
                                                    <td><div class="buttons">
                                                            <a href="Test Details.aspx" class="btn btn-primary rounded-pill">View Details</a>

                                                        </div></td>
                                                </tr>
                                                <tr>
                                                    <td class="text-bold-500">Tiffani Blogz</td>
                                                    <td>3</td>
                                                    <td>3@gmail.com</td>
                                                    <td><div class="buttons">
                                                            <a href="Test Details.aspx" class="btn btn-primary rounded-pill">View Details</a>

                                                        </div></td>
                                                </tr>
                                                <tr>
                                                    <td class="text-bold-500">Ashley Boul</td>
                                                    <td>4</td>
                                                    <td>4@gmail.com</td>
                                                    <td><div class="buttons">
                                                            <a href="Test Details.aspx" class="btn btn-primary rounded-pill">View Details</a>

                                                        </div></td>
                                                </tr>
                                                <tr>
                                                    <td class="text-bold-500">Mikkey Mice</td>
                                                    <td>5</td>
                                                    <td>5@gmail.com</td>
                                                    <td>
                                                        <div class="buttons">
                                                            <a href="Test Details.aspx" class="btn btn-primary rounded-pill">View Details</a>

                                                        </div>
                                                    </td>
                                                </tr>
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
<asp:Content ID="Content4" ContentPlaceHolderID="Script" Runat="Server">
</asp:Content>

