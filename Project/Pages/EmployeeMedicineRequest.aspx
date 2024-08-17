<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Employee.master" AutoEventWireup="true" CodeFile="EmployeeMedicineRequest.aspx.cs" Inherits="Pages_MedicineRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" runat="Server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Medicine Request</li>
        </ol>
    </nav>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <section id="multiple-column-form">
        <div class="row match-height">
            <div class="col-12">
                <div class="card">
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form">
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <p>Prescriptions</p>
                                            <!--Monthly Prescriptions List-->
                                            <div class="list-group">
                                                <span class="list-group-item">
                                                    <asp:Label ID="Label3" runat="server" Text="Prescription 1" CssClass="mb-1" Style="font-size: 20px; color: #25396f; font-weight: bold; display: block;"></asp:Label>

                                                    <asp:Label ID="Label4" runat="server" Text="Date of Appointment:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label5" runat="server" Text="Time of Appointment:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label6" runat="server" Text="Doctor Name:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label1" runat="server" Text="Department:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label2" runat="server" Text="Medicine 1: --- Frequency: --- Quantity: --- Notes: ---" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label7" runat="server" Text="Medicine 2: --- Frequency: --- Quantity: --- Notes: ---" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label8" runat="server" Text="Last Renewal Date:" CssClass="mb-1" Style="display: block;"></asp:Label>

                                                    <div class="d-flex w-100 justify-content-end">
                                                        <asp:Button ID="RequestButton" runat="server" Text="Renew" CssClass="btn btn-primary rounded-pill" />
                                                    </div>
                                                </span>
                                                <span class="list-group-item">
                                                    <asp:Label ID="Label9" runat="server" Text="Prescription 2" CssClass="mb-1" Style="font-size: 20px; color: #25396f; font-weight: bold; display: block;"></asp:Label>

                                                    <asp:Label ID="Label10" runat="server" Text="Date of Appointment:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label11" runat="server" Text="Time of Appointment:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label12" runat="server" Text="Doctor Name:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label13" runat="server" Text="Department:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label14" runat="server" Text="Medicine 1: --- Frequency: --- Quantity: --- Notes: ---" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label15" runat="server" Text="Medicine 2: --- Frequency: --- Quantity: --- Notes: ---" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label16" runat="server" Text="Last Renewal Date:" CssClass="mb-1" Style="display: block;"></asp:Label>

                                                    <div class="d-flex w-100 justify-content-end">
                                                        <asp:Button ID="Button1" runat="server" Text="Renew" CssClass="btn btn-primary rounded-pill" />
                                                    </div>
                                                </span>
                                                <span class="list-group-item">
                                                    <asp:Label ID="Label17" runat="server" Text="Prescription 3" CssClass="mb-1" Style="font-size: 20px; color: #25396f; font-weight: bold; display: block;"></asp:Label>

                                                    <asp:Label ID="Label18" runat="server" Text="Date of Appointment:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label19" runat="server" Text="Time of Appointment:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label20" runat="server" Text="Doctor Name:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label21" runat="server" Text="Department:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label22" runat="server" Text="Medicine 1: --- Frequency: --- Quantity: --- Notes: ---" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label23" runat="server" Text="Medicine 2: --- Frequency: --- Quantity: --- Notes: ---" CssClass="mb-1" Style="display: block;"></asp:Label>
                                                    <asp:Label ID="Label24" runat="server" Text="Last Renewal Date:" CssClass="mb-1" Style="display: block;"></asp:Label>

                                                    <div class="d-flex w-100 justify-content-end">
                                                        <asp:Button ID="Button2" runat="server" Text="Renew" CssClass="btn btn-primary rounded-pill" />
                                                    </div>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>

