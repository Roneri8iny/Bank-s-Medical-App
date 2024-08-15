<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AnalysisDoctor.master" AutoEventWireup="true" CodeFile="Test Details.aspx.cs" Inherits="Pages_Test_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Test Requests</Title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    <section id="groups">
                    <div class="row match-height">
                        <div class="col-12 mt-3 mb-1">
                            <h4 class="section-title text-uppercase">Test Details</h4>
                        </div>
                    </div>
                    <div class="row match-height">
                        <div class="col-12">
                            <div class="card-group">
                                <div class="card">
                                    <div class="card-content">
                                        <img class="card-img-top img-fluid" src="../assets/images/samples/images.jpeg"
                                            alt="Card image cap" style="width: 250px; height: auto; margin-right: 15px;"/>
                                        <div class="card-body">
                                            <h4 class="card-title"; style="padding-left: 45px">Employee Name</h4>
                                            <div class="card-body">
                                                

                                                <div id="Tests" class="container-fluid">
                                                    <div class="row">


                                                        <!-- Hoverable rows start -->
                                                        <section class="section">
                                                            <div class="row" id="table-hover-row">
                                                                <div class="col-12">
                                                                    <div class="card">
                                                                        
                                                                        <div class="card-content">
                                                                            <div class="card-body">
                                                                            </div>
                                                                            <!-- table hover -->
                                                                            <div class="table-responsive">
                                                                                <table class="table table-hover mb-0">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th>Test Name</th>
                                                                                            <th>Test Result</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td class="text-bold-500">Michael Right</td>

                                                                                            <td>
                                                                                                <div class="buttons">
                                                                                                    <asp:FileUpload ID="FileUpload5" runat="server" CssClass="with-validation-filepond"/>

                                                                                                </div>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="text-bold-500">Morgan Vanblum</td>
                                                                                           
                                                                                            <td>
                                                                                                <div class="buttons">
                                                                                                    <asp:FileUpload ID="FileUpload4" runat="server" CssClass="with-validation-filepond"/>

                                                                                                </div>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="text-bold-500">Tiffani Blogz</td>
                                                                                            
                                                                                            <td>
                                                                                                <div class="buttons">
                                                                                                    <asp:FileUpload ID="FileUpload3" runat="server" CssClass="with-validation-filepond"/>

                                                                                                </div>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="text-bold-500">Ashley Boul</td>
                                                                                            
                                                                                            <td>
                                                                                                <div class="buttons">
                                                                                                    <asp:FileUpload ID="FileUpload2" runat="server" CssClass="with-validation-filepond"/>

                                                                                                </div>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="text-bold-500">Mikkey Mice</td>
                                                                                            
                                                                                            <td>
                                                                                                <div class="buttons">
                                                                                                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="with-validation-filepond"/>

                                                                                                </div>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>

                                                                                <div class="col-12 d-flex justify-content-start">
                                                                                    <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-primary me-1 mb-1" Style="margin-top: 50px;" />
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </section>
                                                        <!-- Hoverable rows end -->
                                                    </div>
                                                </div>

                                            </div>
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

