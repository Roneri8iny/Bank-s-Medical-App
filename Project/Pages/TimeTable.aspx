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
                        <label for="doctor-name">Doctor's Name</label>
                        <asp:TextBox ID="txt_doctorName" CssClass="form-control" runat="server" placeholder="Doctor's Name" />
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
                    <asp:Button ID="addRow" CssClass="btn btn-success mt-2 mb-3 " runat="server" Text="     Add     " />
                </asp:Panel>
                <!-- Data Table -->
                <asp:GridView ID="timeTableGrid" CssClass="table table-striped" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="SlotID">
                    <Columns>
                        <asp:BoundField DataField="DoctorID" HeaderText="DoctorID" />
                        <asp:BoundField DataField="DoctorName" HeaderText="Doctor Name" />
                        <asp:BoundField DataField="TTDay" HeaderText="Day" />
                        <asp:BoundField DataField="StartTime" HeaderText="From" />
                        <asp:BoundField DataField="EndTime" HeaderText="To" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="editRow" CssClass="btn btn-info btn-sm " runat="server" Text="Edit" CommandName="Edit" />
                                <asp:Button ID="deleteRow" CssClass="btn btn-danger btn-sm " runat="server" Text="Delete" CommandName="Delete" />
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
        document.addEventListener('DOMContentLoaded', function () {
            const addRowButton = document.getElementById('<%= addRow.ClientID %>');

            addRowButton.addEventListener('click', function (e) {
                e.preventDefault();

                const doctorName = document.getElementById('<%= txt_doctorName.ClientID %>').value;
                const day = document.getElementById('<%= ddl_days.ClientID %>').value;
                const startTime = document.getElementById('<%= txt_startTime.ClientID %>').value;
                const endTime = document.getElementById('<%= txt_endTime.ClientID %>').value;

                if (!doctorName) {
                    Toastify({
                        text: "Doctor's Name is required.",
                        duration: 3000,
                        backgroundColor: "linear-gradient(to right, #FF0000, #FFAAAA)"
                    }).showToast();
                    return;
                }

                if (!startTime || !endTime) {
                    Toastify({
                        text: "Start and End Time are required.",
                        duration: 3000,
                        backgroundColor: "linear-gradient(to right, #FF0000, #FFAAAA)"
                    }).showToast();
                    return;
                }

                // Call the server-side method to add the row
                fetch('TimeTable.aspx/AddRow', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({
                        doctorName,
                        day,
                        startTime,
                        endTime
                    })
                })
                    .then(response => response.json())
                    .then(result => {
                        if (result) {
                            Toastify({
                                text: "Row added successfully.",
                                duration: 3000,
                                backgroundColor: "linear-gradient(to right, #00FF00, #AAFFAA)"
                            }).showToast();
                            location.reload(); // Reload to show the updated data
                        } else {
                            Toastify({
                                text: "Failed to add row.",
                                duration: 3000,
                                backgroundColor: "linear-gradient(to right, #FF0000, #FFAAAA)"
                            }).showToast();
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        Toastify({
                            text: "An error occurred.",
                            duration: 3000,
                            backgroundColor: "linear-gradient(to right, #FF0000, #FFAAAA)"
                        }).showToast();
                    });
            });
        });
    </script>
</asp:Content>
