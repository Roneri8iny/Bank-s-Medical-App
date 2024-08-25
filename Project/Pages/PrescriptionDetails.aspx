<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeFile="PrescriptionDetails.aspx.cs" Inherits="Pages_PrescriptionDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Prescription Details</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    <section id="multiple-column-form">
        <div class="row match-height">
            <div class="col-12">

                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Previous Prescriptions</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <div class="list-group">

                                <asp:Repeater ID="PrescriptionDetailsRepeater" runat="server" >
                                    <ItemTemplate>
                                        <span class="list-group-item">
                                            <asp:Label ID="lbl_prescription" runat="server" Text='<%# Eval("MedicineName", "Medicine Name: {0}") %>' CssClass="mb-1" Style="font-size: 20px; color: #25396f; font-weight: bold; display: block;"></asp:Label>

                                            <asp:Label ID="lbl_status" runat="server" Text='<%# Eval("Quantity", "Medicine Quantity: {0}") %>' CssClass="mb-1" Style="display: block;"></asp:Label>
                                            <asp:Label ID="lbl_diagnosis" runat="server" Text='<%# Eval("Frequency", "Medicine Frequency: {0}") %>' CssClass="mb-1" Style="display: block;"></asp:Label>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Notes", "Notes: {0}") %>' CssClass="mb-1" Style="display: block;"></asp:Label>
                                            <!--%-- <iframe src="D:\Javabeans.101.pdf" width="100%" height="600px" style="border: none;"></iframe> --%-->
                                            
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
<asp:Content ID="Content4" ContentPlaceHolderID="Script" Runat="Server">
</asp:Content>
