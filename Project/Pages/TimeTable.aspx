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
                Time Table Management
            </div>
            <div class="card-body">
                <!-- Form for adding new rows -->
                <asp:Panel ID="timeTableForm" runat="server">
                    <div class="form-group">
                        <label for="doctor-name">Doctor's Name</label>
                        <asp:TextBox ID="txt_doctorName" CssClass="form-control" runat="server" placeholder="Doctor's Name" />
                    </div>
                    <div class="form-group">
                        <label>Sunday</label>
                        <div class="d-flex">
                            <asp:TextBox ID="sundayStart" CssClass="form-control mr-2" runat="server" TextMode="Time" placeholder="Start Time" />
                            <asp:TextBox ID="sundayEnd" CssClass="form-control" runat="server" TextMode="Time" placeholder="End Time" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Monday</label>
                        <div class="d-flex">
                            <asp:TextBox ID="mondayStart" CssClass="form-control mr-2" runat="server" TextMode="Time" placeholder="Start Time" />
                            <asp:TextBox ID="mondayEnd" CssClass="form-control" runat="server" TextMode="Time" placeholder="End Time" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Tuesday</label>
                        <div class="d-flex">
                            <asp:TextBox ID="tuesdayStart" CssClass="form-control mr-2" runat="server" TextMode="Time" placeholder="Start Time" />
                            <asp:TextBox ID="tuesdayEnd" CssClass="form-control" runat="server" TextMode="Time" placeholder="End Time" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Wednesday</label>
                        <div class="d-flex">
                            <asp:TextBox ID="wednesdayStart" CssClass="form-control mr-2" runat="server" TextMode="Time" placeholder="Start Time" />
                            <asp:TextBox ID="wednesdayEnd" CssClass="form-control" runat="server" TextMode="Time" placeholder="End Time" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Thursday</label>
                        <div class="d-flex">
                            <asp:TextBox ID="thursdayStart" CssClass="form-control mr-2" runat="server" TextMode="Time" placeholder="Start Time" />
                            <asp:TextBox ID="thursdayEnd" CssClass="form-control" runat="server" TextMode="Time" placeholder="End Time" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Friday</label>
                        <div class="d-flex">
                            <asp:TextBox ID="fridayStart" CssClass="form-control mr-2" runat="server" TextMode="Time" placeholder="Start Time" />
                            <asp:TextBox ID="fridayEnd" CssClass="form-control" runat="server" TextMode="Time" placeholder="End Time" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Saturday</label>
                        <div class="d-flex">
                            <asp:TextBox ID="saturdayStart" CssClass="form-control mr-2" runat="server" TextMode="Time" placeholder="Start Time" />
                            <asp:TextBox ID="saturdayEnd" CssClass="form-control" runat="server" TextMode="Time" placeholder="End Time" />
                        </div>
                    </div>
                    <asp:Button ID="addRow" CssClass="btn btn-primary" runat="server" Text="Add"  />
                </asp:Panel>

                <!-- Data Table -->
                <asp:GridView ID="timeTableGrid" CssClass="table table-striped" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" />
                        <asp:BoundField DataField="Department" HeaderText="Department" />
                        <asp:BoundField DataField="DoctorName" HeaderText="Doctor's Name" />
                        <asp:BoundField DataField="Sunday" HeaderText="Sunday" />
                        <asp:BoundField DataField="Monday" HeaderText="Monday" />
                        <asp:BoundField DataField="Tuesday" HeaderText="Tuesday" />
                        <asp:BoundField DataField="Wednesday" HeaderText="Wednesday" />
                        <asp:BoundField DataField="Thursday" HeaderText="Thursday" />
                        <asp:BoundField DataField="Friday" HeaderText="Friday" />
                        <asp:BoundField DataField="Saturday" HeaderText="Saturday" />
                        <asp:BoundField DataField="Price" HeaderText="Price" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="editRow" CssClass="btn btn-warning btn-sm" runat="server" Text="Edit" CommandName="Edit" />
                                <asp:Button ID="deleteRow" CssClass="btn btn-danger btn-sm" runat="server" Text="Delete" CommandName="Delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <!-- Save and Cancel Buttons -->
                <div class="mt-3">
                    <asp:Button ID="saveChanges" CssClass="btn btn-success" runat="server" Text="Save Changes" />
                    <asp:Button ID="cancelChanges" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
                </div>
            </div>
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="Server">
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const addRowButton = document.getElementById('add-row');
            const tableBody = document.querySelector('#table1 tbody');

            addRowButton.addEventListener('click', function () {
                const doctorName = document.getElementById('doctor-name').value;
                const department = document.getElementById('department').value;

                const sundayStart = document.getElementById('sunday-start').value;
                const sundayEnd = document.getElementById('sunday-end').value;
                const mondayStart = document.getElementById('monday-start').value;
                const mondayEnd = document.getElementById('monday-end').value;
                const tuesdayStart = document.getElementById('tuesday-start').value;
                const tuesdayEnd = document.getElementById('tuesday-end').value;
                const wednesdayStart = document.getElementById('wednesday-start').value;
                const wednesdayEnd = document.getElementById('wednesday-end').value;
                const thursdayStart = document.getElementById('thursday-start').value;
                const thursdayEnd = document.getElementById('thursday-end').value;
                const fridayStart = document.getElementById('friday-start').value;
                const fridayEnd = document.getElementById('friday-end').value;
                const saturdayStart = document.getElementById('saturday-start').value;
                const saturdayEnd = document.getElementById('saturday-end').value;

                // Create a new row
                const newRow = document.createElement('tr');
                newRow.innerHTML = `
        <td></td>
        <td>${department}</td>
        <td>${doctorName}</td>
        <td>${sundayStart} - ${sundayEnd}</td>
        <td>${mondayStart} - ${mondayEnd}</td>
        <td>${tuesdayStart} - ${tuesdayEnd}</td>
        <td>${wednesdayStart} - ${wednesdayEnd}</td>
        <td>${thursdayStart} - ${thursdayEnd}</td>
        <td>${fridayStart} - ${fridayEnd}</td>
        <td>${saturdayStart} - ${saturdayEnd}</td>
        <td>999$</td>
        <td>
            <button class="btn btn-warning btn-sm edit-row">Edit</button>
            <button class="btn btn-danger btn-sm delete-row">Delete</button>
        </td>
    `;
                tableBody.appendChild(newRow);

                // Clear the form
                document.getElementById('timeTableForm').reset();

                // Show success message
                Toastify({
                    text: "Row added successfully!",
                    duration: 3000,
                    gravity: "top",
                    position: "right",
                    backgroundColor: "#4fbe87",
                }).showToast();
            });

            tableBody.addEventListener('click', function (event) {
                if (event.target.classList.contains('edit-row')) {
                    const row = event.target.closest('tr');
                    const cells = row.querySelectorAll('td');

                    // Populate form with row data for editing
                    document.getElementById('doctor-name').value = cells[2].textContent;

                    // Populate the form for each day
                    const sundayTimes = cells[3].textContent.split(' - ');
                    document.getElementById('sunday-start').value = sundayTimes[0];
                    document.getElementById('sunday-end').value = sundayTimes[1];

                    const mondayTimes = cells[4].textContent.split(' - ');
                    document.getElementById('monday-start').value = mondayTimes[0];
                    document.getElementById('monday-end').value = mondayTimes[1];

                    const tuesdayTimes = cells[5].textContent.split(' - ');
                    document.getElementById('tuesday-start').value = tuesdayTimes[0];
                    document.getElementById('tuesday-end').value = tuesdayTimes[1];

                    const wednesdayTimes = cells[6].textContent.split(' - ');
                    document.getElementById('wednesday-start').value = wednesdayTimes[0];
                    document.getElementById('wednesday-end').value = wednesdayTimes[1];

                    const thursdayTimes = cells[7].textContent.split(' - ');
                    document.getElementById('thursday-start').value = thursdayTimes[0];
                    document.getElementById('thursday-end').value = thursdayTimes[1];

                    const fridayTimes = cells[8].textContent.split(' - ');
                    document.getElementById('friday-start').value = fridayTimes[0];
                    document.getElementById('friday-end').value = fridayTimes[1];

                    const saturdayTimes = cells[9].textContent.split(' - ');
                    document.getElementById('saturday-start').value = saturdayTimes[0];
                    document.getElementById('saturday-end').value = saturdayTimes[1];

                    // Remove row from table
                    row.remove();
                }

                if (event.target.classList.contains('delete-row')) {
                    const row = event.target.closest('tr');
                    row.remove();

                    // Show success message
                    Toastify({
                        text: "Row deleted successfully!",
                        duration: 3000,
                        gravity: "top",
                        position: "right",
                        backgroundColor: "#e74c3c",
                    }).showToast();
                }
            });

            document.getElementById('save-changes').addEventListener('click', function () {
                Toastify({
                    text: "Changes saved successfully!",
                    duration: 3000,
                    gravity: "top",
                    position: "right",
                    backgroundColor: "#4fbe87",
                }).showToast();
            });

            document.getElementById('cancel-changes').addEventListener('click', function () {
                document.getElementById('timeTableForm').reset();
                Toastify({
                    text: "Changes cancelled!",
                    duration: 3000,
                    gravity: "top",
                    position: "right",
                    backgroundColor: "#e74c3c",
                }).showToast();
            });
        });
    </script>
</asp:Content>
