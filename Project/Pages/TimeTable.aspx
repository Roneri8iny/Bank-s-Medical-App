<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MedicalField.master" AutoEventWireup="true" CodeFile="TimeTable.aspx.cs" Inherits="Pages_TimeTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <link rel="stylesheet" href="../assets/css/time-table.css" />
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PageHeader" runat="Server">
    <h3>Time Table Management</h3>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="Server">
    <section class="section">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Time Table Management</h4>
            </div>
            <div class="card-body">
                <!-- Form for adding new rows -->
                <asp:Panel ID="timeTableForm" runat="server">
                    <div class="form-group">
                        <label for="doctor-name">Doctor's UserName</label>
                        <asp:TextBox ID="txt_doctorName" CssClass="form-control" runat="server" placeholder="Doctor's UserName" />
                    </div>
                    <div class="form-group">
                        <label for="day-select">Select Day</label>
                        <asp:DropDownList ID="ddl_days" CssClass="form-control" runat="server">
                            <asp:ListItem Value="Sunday">Sunday</asp:ListItem>
                            <asp:ListItem Value="Monday">Monday</asp:ListItem>
                            <asp:ListItem Value="Tuesday">Tuesday</asp:ListItem>
                            <asp:ListItem Value="Wednesday">Wednesday</asp:ListItem>
                            <asp:ListItem Value="Thursday">Thursday</asp:ListItem>
                            <asp:ListItem Value="Friday">Friday</asp:ListItem>
                            <asp:ListItem Value="Saturday">Saturday</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="start-time">Start Time</label>
                        <asp:TextBox ID="txt_startTime" CssClass="form-control" runat="server" TextMode="SingleLine" placeholder="Start Time 00:00:00" />
                    </div>
                    <div class="form-group">
                        <label for="end-time">End Time</label>
                        <asp:TextBox ID="txt_endTime" CssClass="form-control" runat="server" TextMode="SingleLine" placeholder="End Time 00:00:00" />
                    </div>
                    <asp:Button ID="addRow" CssClass="btn btn-success mt-2 mb-3 " runat="server" Text="     Add     " onClick="addRow_Click" />
                </asp:Panel>
                <!-- Data Table -->
                <asp:GridView ID="timeTableGrid" CssClass="table table-striped" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="SlotID">
                    <Columns>
<%--                        <asp:BoundField DataField="DoctorID" HeaderText="DoctorID" />--%>
                        <asp:BoundField DataField="DoctorName" HeaderText="Doctor Name" />
                        <asp:BoundField DataField="TTDay" HeaderText="Day" />
                        <asp:BoundField DataField="StartTime" HeaderText="From" />
                        <asp:BoundField DataField="EndTime" HeaderText="To" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="deleteRow" CssClass="btn btn-danger btn-sm" runat="server" Text="Delete"  onClick="deleteRow_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="Script" runat="Server">
    <script>
        
    </script>
</asp:Content>
