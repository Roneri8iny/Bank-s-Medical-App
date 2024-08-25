<%@ Page Title="Medical Field Home Page" Language="C#" MasterPageFile="~/MasterPages/MedicalField.master" AutoEventWireup="true" CodeFile="MedicalHome.aspx.cs" Inherits="Pages_MedicalHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- SEO Meta Tags -->
    <meta name="description" content="Medical Field Home Page showcasing doctors, appointments, and profile statistics." />
    <meta name="keywords" content="medical, doctors, appointments, healthcare" />
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PageHeader" runat="Server">
    <!-- Page heading -->
    <h3 class="mt-4 mb-4 text-center">Medical Field Home Page</h3>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="Server">
    <!-- Main content area -->
    <div class="page-heading mb-4">
        <!-- Page-specific heading or introduction can go here -->
    </div>

    <div class="page-content">
        <section class="row justify-content-center">
            <!-- Card: Doctors Available -->
            <div class="col-12 col-md-6 mb-4">
                <div class="card">
                    <div class="card-body d-flex align-items-center">
                        <div class="stats-icon bg-purple text-white rounded-circle p-3 me-3" aria-label="Doctors Available">
                            <i class="iconly-boldShow" role="img" aria-hidden="true"></i>
                        </div>
                        <div>
                            <h4 class="text-muted font-semibold">Doctors Available</h4>
                            <asp:Label ID="lblDoctorsAvailable" runat="server" Text="120" CssClass="font-extrabold mb-0 fs-3"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Medical Field Profile -->
            <div class="col-12 col-md-8 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h3 class="font-bold mb-3">Medical Field Profile</h3>
                        <asp:Label ID="lblProfileName" runat="server" Text="Egypt Air" CssClass="font-bold mb-1 fs-4"></asp:Label>
                        <br />
                        <asp:Label ID="lblProfileTitle" runat="server" Text="Medical Field" CssClass="text-muted mb-2 fs-5"></asp:Label>
                        <hr />
                        <asp:Label ID="lblUsername" runat="server" Text="Username: med_user" CssClass="text-muted mb-1 fs-5"></asp:Label>
                        <br />
                        <asp:Label ID="lblEmail" runat="server" Text="Email: medfield@egyptair.com" CssClass="text-muted mb-1 fs-5"></asp:Label>
                        <br />
                        <asp:Label ID="lblHotline" runat="server" Text="Hotline: +20212345678" CssClass="text-muted mb-1 fs-5"></asp:Label>
                        <br />
                        <asp:Label ID="lblAddress" runat="server" Text="Address: Cairo, Egypt" CssClass="text-muted mb-1 fs-5"></asp:Label>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="Server">
    <!-- Additional scripts specific to this page can be added here -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Include any additional custom scripts needed for interactivity -->
</asp:Content>
