<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MedicalField.master" AutoEventWireup="true" CodeFile="NewAccount.aspx.cs" Inherits="Pages_NewAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Add any additional head content here -->
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PageHeader" runat="Server">
    <!-- Page Header Content -->
    <h3>New Doctor Account</h3>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="Server">
    <!-- Main Content of the Page -->
    <div class="col-md-8 col-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Doctors Account Details</h4>
            </div>
            <div class="card-content">
                <div class="card-body">
                    <!-- Form starts here -->
                    <asp:Panel runat="server" ID="newDoctorForm">
                        <div class="form-body">
                            <div class="row">
                                <!-- Doctor Name Field -->
                                <div class="col-12">
                                    <div class="form-group has-icon-left">
                                        <label for="doctor-name">Doctor Name</label>
                                        <div class="position-relative">
                                            <asp:TextBox runat="server" CssClass="form-control" Placeholder="Doctor Name" ID="txt_doctor_name" />
                                            <div class="form-control-icon">
                                                <i class="bi bi-person"></i>
                                            </div>
                                            <div class="invalid-feedback">
                                                Please enter the doctor's name.
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Price Field -->
                                <div class="col-12">
                                    <div class="form-group has-icon-left">
                                        <label for="price">Price</label>
                                        <div class="position-relative">
                                            <asp:TextBox runat="server" CssClass="form-control" Placeholder="Price" ID="txt_price" TextMode="SingleLine" />
                                            <div class="form-control-icon">
                                                <i class="bi bi-tag"></i>
                                            </div>
                                            <div class="invalid-feedback">
                                                Please enter a valid price (e.g., 100 or 99.99).
                                            </div>
                                        </div>
                                    </div>
                                </div> 

                                <!-- Position Dropdown -->
                                <div class="col-12">
                                    <div class="form-group has-icon-left">
                                        <label for="postion">Position</label>
                                        <div class="position-relative">
                                            <asp:DropDownList runat="server" ID="ddl_postion">
                                                <asp:ListItem Text="Specialized Doctor" Value="1"/>
                                                <asp:ListItem Text="Pharmacy Doctor" Value="2"/>
                                                <asp:ListItem Text="Analysis Doctor" Value="3"/>
                                            </asp:DropDownList>                                        
                                            <div class="form-control-icon">
                                                <i class="bi bi-briefcase-medical"></i>
                                            </div>
                                            <div class="invalid-feedback">
                                                Please select a position.
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Medical Department Field -->
                                <div class="col-12">
                                    <div class="form-group has-icon-left">
                                        <label for="medical-department">Medical Department</label>
                                        <div class="position-relative">
                                            <asp:DropDownList runat="server" ID="ddl_Departments">
                                                <asp:ListItem Text="Surgery" Value="1"/>
                                            </asp:DropDownList>
                                            <div class="form-control-icon">
                                                <i class="bi bi-hospital"></i>
                                            </div>
                                            <div class="invalid-feedback">
                                                Please select a medical department.
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Mobile Number Field -->
                                <div class="col-12">
                                    <div class="form-group has-icon-left">
                                        <label for="mobile">Mobile Number</label>
                                        <div class="position-relative">
                                            <asp:TextBox runat="server" CssClass="form-control" Placeholder="Mobile Number" ID="txt_mobile" />
                                            <div class="form-control-icon">
                                                <i class="bi bi-phone"></i>
                                            </div>
                                            <div class="invalid-feedback">
                                                Please enter a valid 10-digit mobile number.
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Username Field -->
                                <div class="col-12">
                                    <div class="form-group has-icon-left">
                                        <label for="username">Username</label>
                                        <div class="position-relative">
                                            <asp:TextBox runat="server" CssClass="form-control" Placeholder="Username" ID="username" />
                                            <div class="form-control-icon">
                                                <i class="bi bi-person-circle"></i>
                                            </div>
                                            <div class="invalid-feedback">
                                                Please enter a username.
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Password Field -->
                                <div class="col-12">
                                    <div class="form-group has-icon-left">
                                        <label for="password">Password</label>
                                        <div class="position-relative">
                                            <asp:TextBox runat="server" CssClass="form-control" Placeholder="Password" ID="password" TextMode="Password" />
                                            <div class="form-control-icon">
                                                <i class="bi bi-lock"></i>
                                            </div>
                                            <div class="invalid-feedback">
                                                Please enter a password with at least 6 characters.
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Submit and Reset Buttons -->
                                <div class="col-12 d-flex justify-content-end">
                                    <asp:Button ID="btn_addDoctor" runat="server" CssClass="btn btn-primary me-1 mb-1" Text="Add Doctor" OnClick="btn_addDoctor_Click"/>
                                    <button type="reset" class="btn btn-light-secondary me-1 mb-1">Reset</button>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <!-- Form ends here -->
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="Server">
    <!-- Script for handling Bootstrap form validation -->
    <script>
        (function () {
            'use strict'
            var forms = document.querySelectorAll('.needs-validation')

            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }

                        form.classList.add('was-validated')
                    }, false)
                })
        })()
    </script>
</asp:Content>
