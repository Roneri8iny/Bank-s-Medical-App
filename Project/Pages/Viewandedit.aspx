<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Middleman.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="Viewandedit.aspx.cs" Inherits="Pages_Viewandedit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Add any required CSS or meta tags here -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <div class="card">

        <asp:ScriptManager ID="scr" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <h2>Middle Man</h2>

                <asp:Label ID="Label1" runat="server" Text=""><br> </asp:Label>


            </ContentTemplate>
        </asp:UpdatePanel>

        <h4 class="card-title">View and Edit Medical Field Accounts</h4>


        <div class="card-content">
            <div class="card-body">
                <!-- Optional: Search and Filter -->
                <div class="mb-3">
                    <asp:TextBox ID="SearchInput" CssClass="form-control" Placeholder="Search by Username, Email" runat="server"></asp:TextBox>
                    <asp:Button ID="SearchButton1" Text="Search"
                        CssClass="btn btn-primary mt-2" OnClick="SearchButton1_Click" runat="server" />

                </div>
                <div class="table-responsive">
                    <asp:GridView ID="AccountsGridView" CssClass="table mb-0" AutoGenerateColumns="False" DataKeyNames="MFID"
                        runat="server">
                        <Columns>
                            <asp:BoundField DataField="Username" HeaderText="Username" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="Hotline" HeaderText="Hotline" />
                            <asp:BoundField DataField="MFType" HeaderText="Medical Field" />
                            <asp:BoundField DataField="MFAddress" HeaderText="Address" />

                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:LinkButton ID="DeleteButton" Text="Delete" 
                                        CssClass="btn btn-danger btn-sm" OnCommand="DeleteButton_Command"
                                        CommandArgument='<%# Eval("MFID") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">Edit Medical Field Account</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:TextBox ID="EditUsername" CssClass="form-control" runat="server" />
                    <%--<asp:RequiredFieldValidator ID="EditUsernameRequired" ControlToValidate="EditUsername" ErrorMessage="Username is required." runat="server" ForeColor="Red" />--%>

                    <asp:TextBox ID="EditEmail" CssClass="form-control" runat="server" />
                    <%--<asp:RequiredFieldValidator ID="EditEmailRequired" ControlToValidate="EditEmail" ErrorMessage="Email is required." runat="server" ForeColor="Red" />--%>

                    <asp:TextBox ID="EditHotline" CssClass="form-control" runat="server" />
                    <%--<asp:RequiredFieldValidator ID="EditHotlineRequired" ControlToValidate="EditHotline" ErrorMessage="Hotline is required." runat="server" ForeColor="Red" />--%>

                    <asp:TextBox ID="EditAddress" CssClass="form-control" runat="server" />
                    <%--<asp:RequiredFieldValidator ID="EditAddressRequired" ControlToValidate="EditAddress" ErrorMessage="Address is required." runat="server" ForeColor="Red" />--%>

                    <asp:DropDownList ID="EditMedicalField" CssClass="form-control" runat="server">
                        <asp:ListItem Value="Hospital">Hospital</asp:ListItem>
                        <asp:ListItem Value="Specialty Clinic">Specialty Clinic</asp:ListItem>
                        <asp:ListItem Value="Lab">Lab</asp:ListItem>
                        <asp:ListItem Value="Pharmacy">Pharmacy</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="EditMedicalFieldRequired" ControlToValidate="EditMedicalField" ErrorMessage="Medical Field is required." runat="server" ForeColor="Red" />

                    <asp:Button ID="SaveChangesButton" Text="Save Changes" CssClass="btn btn-primary" OnClick="SaveChangesButton_Click" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="Server">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</asp:Content>
