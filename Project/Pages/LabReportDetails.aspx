<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeFile="LabReportDetails.aspx.cs" Inherits="Pages_LabReportDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Lab Report Details</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <section id="multiple-column-form">
        <div class="row match-height">
            <div class="col-12">

                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Previous Lab Reports</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <div class="list-group">

                                <asp:Repeater ID="TestDetailsRepeater" runat="server">
                                    <ItemTemplate>
                                        <span class="list-group-item">
                                            <asp:Label ID="lbl_prescription" runat="server" Text='<%# Eval("TestName", "Test Name: {0}") %>' CssClass="mb-1" Style="font-size: 20px; color: #25396f; font-weight: bold; display: block;"></asp:Label>
                                            
                                            <iframe src='<%# "../assets/pdfs/" + Eval("ResultPDF") %>' width="100%" height="600px" style="border: none;" style="border: #08679f;"></iframe>
                                        </span>
                                    </ItemTemplate>
                                </asp:Repeater>


                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>