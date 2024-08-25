<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AnalysisDoctor.master" AutoEventWireup="true" CodeFile="Test Details.aspx.cs" Inherits="Pages_Test_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Test Details</title>
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
                            <img id="employeeImage" class="card-img-top img-fluid" src=""
                                            alt="Card image cap" style="width: 250px; height: auto; margin-right: 15px;" runat="server"/>
                            <div class="card-body">
                                <h4 class="card-title" style="padding-left: 45px" runat="server" id="employeeNameLabel"> </h4>
                                <div class="card-body">
                                    <div id="Tests" class="container-fluid">
                                        <div class="row">
                                            <section class="section">
                                                <div class="row" id="table-hover-row">
                                                    <div class="col-12">
                                                        <div class="card">
                                                            <div class="card-content">
                                                                <div class="card-body">
                                                                    <div class="table-responsive">
                                                                        <table class="table table-hover mb-0">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th>Test Name</th>
                                                                                    <th>Test Result</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <asp:Repeater ID="ResultsUploadRepeater" runat="server" OnItemCommand="ResultsUploadRepeater_ItemCommand">
                                                                                    <ItemTemplate>
                                                                                        <tr>
                                                                                            <td class="text-bold-500"><%# Eval("TestName") %></td>
                                                                                            <td>
                                                                                                <div class="buttons">
                                                                                                    <asp:FileUpload ID="FileUpload" runat="server" CssClass="with-validation-filepond" accept=".pdf" />
                                                                                                    <asp:LinkButton ID="UploadButton" runat="server" CommandName="UploadFile" Text="Upload" />
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
                                                </div>
                                            </section>
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
