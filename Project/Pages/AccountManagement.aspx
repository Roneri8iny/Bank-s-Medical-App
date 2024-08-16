<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MedicalField.master" AutoEventWireup="true" CodeFile="AccountManagement.aspx.cs" Inherits="Pages_AccountManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <link rel="stylesheet" href="../assets/css/time-table.css" />
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="PageHeader" runat="Server">
    <h3>Manage Accounts</h3>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="Server">
    <!-- Search For -->

    <div class="row">
        <div class="col-md-6 col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Search User Account</h4>
                </div>
                <div class="card-content">
                    <div class="card-body">
                        <form id="searchForm">
                            <div class="form-group">
                                <label for="search-username">Username</label>
                                <div class="input-group">
                                    <input type="text" id="search-username" class="form-control" placeholder="Enter Username" required>
                                    <button type="submit" class="btn btn-primary">Search</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Account Management Form -->
    <div class="row">
        <div class="col-md-8 col-12">
            <div class="card" id="accountFormCard" style="display: block;">
                <div class="card-header">
                    <h4 class="card-title">Edit User Account</h4>
                </div>
                <div class="card-content">
                    <div class="card-body">
                        <form id="accountForm">
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" id="username" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="Password">Password</label>
                                <input type="password" class="form-control" id="password" required minlength="6">
                            </div>
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" id="name" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="role">Depatment</label>
                                <select id="role" class="form-select" required>
                                    <option value="Specialized Doctor">Specialized Doctor</option>
                                    <option value="Pharmacy Doctor">Pharmacy Doctor</option>
                                    <option value="Analysis Doctor">Analysis Doctor</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="mobile">Mobile Number</label>
                                <input type="text" id="mobile" class="form-control" required pattern="^\d{10}$">
                            </div>
                            <div class="form-group">
                                <label for="price">Price</label>
                                <input type="text" id="price" class="form-control" required pattern="^\d+(\.\d{1,2})?$">
                            </div>

                            <div class="d-flex justify-content-end">
                                <button type="button" id="updateBtn" class="btn btn-success me-2">Update</button>
                                <button type="button" id="deleteBtn" class="btn btn-danger">Delete</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="Server">
    <!-- Include SweetAlert and Toastify scripts -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>

    <script>
        // Handle search form submission
        document.getElementById('searchForm')?.addEventListener('submit', function (event) {
            event.preventDefault();
            var username = document.getElementById('search-username').value;

            // Simulate an AJAX request to check if user exists
            var userExists = checkUserExists(username);

            if (userExists) {
                // Fill the form with user data (this is just a simulation)
                fillUserForm(username);
                document.getElementById('accountFormCard').style.display = 'block';
            } else {
                // Show error if user does not exist
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'User not registered or username error',
                });
            }
        });

        // Simulate function to check if user exists
        function checkUserExists(username) {
            // Replace this with actual server-side logic
            return username === 'existinguser';
        }

        // Simulate filling form with user data
        function fillUserForm(username) {
            document.getElementById('username').value = username;
            document.getElementById('name').value = 'John Doe';
            document.getElementById('role').value = 'Specialized Doctor';
            document.getElementById('mobile').value = '1234567890';
            document.getElementById('price').value = '100.00';
        }

        // Handle update button click
        document.getElementById('updateBtn')?.addEventListener('click', function () {
            // Perform the update action (this is just a simulation)
            // You should send the updated data to the server here
            Toastify({
                text: "Account updated successfully!",
                duration: 3000,
                gravity: "top",
                position: "right",
                backgroundColor: "#4fbe87",
            }).showToast();
        });

        // Handle delete button click
        document.getElementById('deleteBtn')?.addEventListener('click', function () {
            // Perform the delete action (this is just a simulation)
            // You should send the delete request to the server here
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire(
                        'Deleted!',
                        'The account has been deleted.',
                        'success'
                    );
                    document.getElementById('accountFormCard').style.display = 'none';
                }
            });
        });
    </script>
</asp:Content>
