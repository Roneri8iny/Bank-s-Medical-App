<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Doctor.master" AutoEventWireup="true" CodeFile="Appointment Details.aspx.cs" Inherits="Pages_Appointment_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
    <style>
        #editor {
            display: flex;
            align-items: center;
        }

        #Diagnosis {
            flex: 1; /* Allows the textarea to take up the remaining space */
            margin-right: 10px; /* Space between textarea and button */
        }

        .col-md-6, .col-12 {
            padding: 0;
        }

        .card {
            padding: 0;
        }

        .col-md-6 {
            width: 50%; /* Adjust this as needed */
        }

        .card, .form {
            margin: 0;
        }

        .row {
            display: flex;
            justify-content: space-between; /* Or use 'flex-start' to push them together */
        }
    </style>
    <title>Appointment Details</title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    <section id="groups">
                    <div class="row match-height">
                        <div class="col-12 mt-3 mb-1">
                            <h4 class="section-title text-uppercase">Appointment Details</h4>
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
                                            <div class="col-12 d-flex justify-content-start">
                                                  <asp:Button ID="Button2" runat="server" Text="View Employee History" CssClass="btn btn-primary me-1 mb-1" style="margin-left: 45px;" OnClick="btnRedirect_Click"/>
                                            </div>
                                            <div class="card-body">
                                                <div id="editor" class="d-flex align-items-center" >
                                                    <textarea id="Diagnosis" class="form-control" cols="70" ></textarea>
                                                    <asp:Button ID="Submit_Diagnosis" runat="server" Text="Submit Diagnosis" class="btn btn-primary rounded-pill" />
                                                </div>

                                                <div id="Prescription" class="container-fluid">
                                                    <div class="row">
                                                        <!-- Form Column -->
                                                        <div class="col-md-6 col-12">
                                                            <!-- Basic Vertical form layout section start -->
                                                            <section id="basic-vertical-layouts">
                                                                <div class="card" style="padding-left:0px;">
                                                                    <div class="card-header">
                                                                        <h4 class="card-title">Prescription Details</h4>
                                                                    </div>
                                                                    <div class="card-content">
                                                                        <div class="card-body">
                                                                            <form class="form form-vertical">
                                                                                <div class="form-body">
                                                                                    <div class="row">
                                                                                        <!-- Medicine Name Dropdown -->
                                                                                        <div class="col-12">
                                                                                            <div class="form-group">
                                                                                                <label for="DropDownList" style="padding-right: 150px">Medicine Name</label>
                                                                                                <div class="btn-group mb-1">
                                                                                                    <div class="dropdown">
                                                                                                        <asp:DropDownList ID="ddlMedicines" runat="server" CssClass="btn btn-primary dropdown-toggle me-1">
                                                                                                            <asp:ListItem Value="1">Medicine 1</asp:ListItem>
                                                                                                            <asp:ListItem Value="2">Medicine 2</asp:ListItem>
                                                                                                            <asp:ListItem Value="3">Medicine 3</asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>

                                                                                        <!-- Medicine Quantity -->
                                                                                        <div class="col-12">
                                                                                            <div class="form-group">
                                                                                                <asp:Label ID="LabelQuantity" runat="server" AssociatedControlID="TextBoxQuantity" Text="Medicine Quantity"></asp:Label>
                                                                                                <asp:TextBox ID="TextBoxQuantity" runat="server" CssClass="form-control" Placeholder="Quantity" TextMode="Number"></asp:TextBox>
                                                                                            </div>
                                                                                        </div>

                                                                                        <!-- Medicine Frequency -->
                                                                                        <div class="col-12">
                                                                                            <div class="form-group">
                                                                                                <asp:Label ID="LabelFrequency" runat="server" AssociatedControlID="TextBoxFrequency" Text="Medicine Frequency"></asp:Label>
                                                                                                <asp:TextBox ID="TextBoxFrequency" runat="server" CssClass="form-control" Placeholder="Frequency" TextMode="Number"></asp:TextBox>
                                                                                            </div>
                                                                                        </div>

                                                                                        <!-- Prescription Notes -->
                                                                                        <div class="col-12">
                                                                                            <div class="form-group">
                                                                                                <asp:Label ID="LabelNotes" runat="server" AssociatedControlID="PrescriptionNotes" Text="Prescription Notes"></asp:Label>
                                                                                                <asp:TextBox ID="PrescriptionNotes" runat="server" CssClass="form-control" Columns="70" TextMode="MultiLine"></asp:TextBox>
                                                                                            </div>
                                                                                        </div>

                                                                                        <!-- Submit Button -->
                                                                                        <div class="col-12 d-flex justify-content-start">
                                                                                            <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-primary me-1 mb-1" />
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </section>
                                                            <!-- // Basic Vertical form layout section end -->
                                                        </div>

                                                        <!-- Table Column -->
                                                        <div class="col-md-6 col-12">
                                                            <div class="card">
                                                                <div class="card-header">
                                                                    <h4 class="card-title">Prescriped Medicines</h4>
                                                                </div>
                                                                <div class="card-content">
                                                                    <div class="card-body">
                                                                        <asp:Table ID="PrescriptionTable" runat="server" CssClass="table table-striped">
                                                                            <asp:TableHeaderRow>
                                                                                <asp:TableHeaderCell>Medicine Name</asp:TableHeaderCell>
                                                                                <asp:TableHeaderCell>Quantity</asp:TableHeaderCell>
                                                                                <asp:TableHeaderCell>Frequency</asp:TableHeaderCell>
                                                                            </asp:TableHeaderRow>

                                                                            
                                                                            <asp:TableRow>
                                                                                <asp:TableCell>Medicine 1</asp:TableCell>
                                                                                <asp:TableCell>2</asp:TableCell>
                                                                                <asp:TableCell>Twice Daily</asp:TableCell>
                                                                            </asp:TableRow>

                                                                            
                                                                            <asp:TableRow>
                                                                                <asp:TableCell>Medicine 1</asp:TableCell>
                                                                                <asp:TableCell>2</asp:TableCell>
                                                                                <asp:TableCell>Twice Daily</asp:TableCell>
                                                                            </asp:TableRow>

                                                                            
                                                                            <asp:TableRow>
                                                                                <asp:TableCell>Medicine 1</asp:TableCell>
                                                                                <asp:TableCell>2</asp:TableCell>
                                                                                <asp:TableCell>Twice Daily</asp:TableCell>
                                                                            </asp:TableRow>

                                                                            
                                                                            <asp:TableRow>
                                                                                <asp:TableCell>Medicine 1</asp:TableCell>
                                                                                <asp:TableCell>2</asp:TableCell>
                                                                                <asp:TableCell>Twice Daily</asp:TableCell>
                                                                            </asp:TableRow>

                                                                            
                                                                            <asp:TableRow>
                                                                                <asp:TableCell>Medicine 1</asp:TableCell>
                                                                                <asp:TableCell>2</asp:TableCell>
                                                                                <asp:TableCell>Twice Daily</asp:TableCell>
                                                                            </asp:TableRow>

                                                                            
                                                                            <asp:TableRow>
                                                                                <asp:TableCell>Medicine 1</asp:TableCell>
                                                                                <asp:TableCell>2</asp:TableCell>
                                                                                <asp:TableCell>Twice Daily</asp:TableCell>
                                                                            </asp:TableRow>

                                                                        </asp:Table>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        <div class="row match-height">
            <div class="col-12">
                <div class="card-group">
                    <div class="card">
                        <div class="card-content">

                            <div class="card-body">
                                <div class="card-body">
                                    <div id="LabTests" class="container-fluid">
                                        <div class="row">
                                            <!-- Form Column -->
                                            <div class="col-md-6 col-12">
                                                <!-- Basic Vertical form layout section start -->
                                                <section id="basic-vertical-layouts2">
                                                    <div class="card" style="padding-left: 0px;">
                                                        <div class="card-header">
                                                            <h4 class="card-title">Request Lab Tests</h4>
                                                        </div>
                                                        <div class="card-content">
                                                            <div class="card-body">
                                                                <form class="form form-vertical">
                                                                    <div class="form-body">
                                                                        <div class="row">
                                                                            <!-- Test Name Dropdown -->
                                                                            <div class="col-12">
                                                                                <div class="form-group">
                                                                                    <label for="DropdownButton" style="padding-right: 150px">Test Name</label>
                                                                                    <div class="btn-group mb-1">
                                                                                        <div class="dropdown">
                                                                                            <asp:DropDownList ID="DropDownList3" runat="server" CssClass="btn btn-primary dropdown-toggle me-1">
                                                                                                <asp:ListItem Value="1">Test 1</asp:ListItem>
                                                                                                <asp:ListItem Value="2">Test 2</asp:ListItem>
                                                                                                <asp:ListItem Value="3">Test 3</asp:ListItem>
                                                                                            </asp:DropDownList>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>



                                                                            <!-- Submit Button -->
                                                                            <div class="col-12 d-flex justify-content-start">
                                                                                <asp:Button ID="Button4" runat="server" Text="Submit" CssClass="btn btn-primary me-1 mb-1" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </section>
                                                <!-- // Basic Vertical form layout section end -->
                                            </div>

                                            <!-- Table Column -->
                                            <div class="col-md-6 col-12">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h4 class="card-title">Requested Lab Tests</h4>
                                                    </div>
                                                    <div class="card-content">
                                                        <div class="card-body">
                                                            <asp:Table ID="Table2" runat="server" CssClass="table table-striped">
                                                                <asp:TableHeaderRow>
                                                                    <asp:TableHeaderCell>Test 1</asp:TableHeaderCell>
                                                                </asp:TableHeaderRow>

                                                                <asp:TableRow>
                                                                    <asp:TableCell>Test 1</asp:TableCell>

                                                                </asp:TableRow>

                                                                            
                                                                            <asp:TableRow>
                                                                                <asp:TableCell>Test 1</asp:TableCell>
                                                                                
                                                                            </asp:TableRow>

                                                                            
                                                                            <asp:TableRow>
                                                                                <asp:TableCell>Test 1</asp:TableCell>
                                                                                
                                                                            </asp:TableRow>

                                                                            
                                                                            <asp:TableRow>
                                                                                <asp:TableCell>Test 1</asp:TableCell>
                                                                                
                                                                            </asp:TableRow>

                                                                            
                                                                            <asp:TableRow>
                                                                                <asp:TableCell>Test 1</asp:TableCell>
                                                                                
                                                                            </asp:TableRow>

                                                                            
                                                                            <asp:TableRow>
                                                                                <asp:TableCell>Test 1</asp:TableCell>
                                                                                
                                                                            </asp:TableRow>

                                                                        </asp:Table>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        <div class="row match-height">
            <div class="col-12">
                <div class="card-group">
                    <div class="card">
                        <div class="card-content">

                            <div class="card-body">
                                <div class="card-body">
                                    <div id="LabTests" class="container-fluid">
                                        <div class="row">
                                            <!-- Form Column -->
                                            <div class="col-md-6 col-12">
                                                <!-- Basic Vertical form layout section start -->
                                                <section id="basic-vertical-layouts2">
                                                    <div class="card" style="padding-left: 0px;">
                                                        <div class="card-header">
                                                            <h4 class="card-title">Specify Sick Leave</h4>
                                                        </div>
                                                        <div class="card-content">
                                                            <div class="card-body">
                                                                <form class="form form-vertical">
                                                                    <div class="form-body">
                                                                        <div class="row">
                                                                            <!-- Sick Leave Reason Text Box -->
                                                                            <div class="col-12">
                                                                                <div class="form-group">
                                                                                    <asp:Label ID="Label1" runat="server" AssociatedControlID="TextBoxQuantity" Text="Sick Leave Reason"></asp:Label>
                                                                                    <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-12">
                                                                                <div class="form-group">
                                                                                    <asp:Label ID="Label2" runat="server" AssociatedControlID="TextBoxQuantity" Text="Choose Start Day" style="padding-right: 70px;"></asp:Label>
                                                                                    <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-12">
                                                                                <div class="form-group">
                                                                                    <asp:Label ID="Label3" runat="server" AssociatedControlID="TextBoxQuantity" Text="Choose End Day" style="padding-right: 78px;"></asp:Label>
                                                                                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
                                                                                </div>
                                                                            </div>


                                                                            <!-- Submit Button -->
                                                                            <div class="col-12 d-flex justify-content-start">
                                                                                <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-primary me-1 mb-1" style="margin-top: 50px;"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </section>
                                                <!-- // Basic Vertical form layout section end -->
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
    <script>
        function autoResizeTextarea() {
            const textarea = document.getElementById('Diagnosis');
            textarea.addEventListener('input', function () {
                this.style.height = 'auto'; // Reset height to auto to allow shrinking
                this.style.height = (this.scrollHeight) + 'px'; // Set height to scrollHeight
            });
        }

        autoResizeTextarea();
</script>
</asp:Content>

