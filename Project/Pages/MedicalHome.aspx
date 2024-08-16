<%@ Page Title="Medical Field Home Page" Language="C#" MasterPageFile="~/MasterPages/MedicalField.master" AutoEventWireup="true" CodeFile="MedicalHome.aspx.cs" Inherits="Pages_MedicalHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- SEO Meta Tags -->
    <meta name="description" content="Medical Field Home Page showcasing doctors, appointments, and profile statistics.">
    <meta name="keywords" content="medical, doctors, appointments, healthcare">
    <meta name="author" content="Your Name">
    
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PageHeader" runat="Server">
    <!-- Page heading -->
    <h3 class="mt-4 mb-4">Medical Field Home Page</h3>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="Server">
    <!-- Main content area -->
    <div class="page-heading mb-4">
        <!-- Page-specific heading or introduction can go here -->
    </div>

    <div class="page-content">
        <section class="row">
            <div class="col-12 col-lg-9">
                <div class="row">
                    <!-- Card: Doctors Available -->
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4">
                        <div class="card">
                            <div class="card-body d-flex align-items-center">
                                <div class="stats-icon bg-purple text-white rounded-circle p-3 me-3" aria-label="Doctors Available">
                                    <i class="iconly-boldShow" role="img" aria-hidden="true"></i>
                                </div>
                                <div>
                                    <h6 class="text-muted font-semibold">Doctors Available</h6>
                                    <h6 class="font-extrabold mb-0">120</h6>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Card: Appointments Today -->
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4">
                        <div class="card">
                            <div class="card-body d-flex align-items-center">
                                <div class="stats-icon bg-green text-white rounded-circle p-3 me-3" aria-label="Appointments Today">
                                    <i class="iconly-boldAdd-User" role="img" aria-hidden="true"></i>
                                </div>
                                <div>
                                    <h6 class="text-muted font-semibold">Appointments Today</h6>
                                    <h6 class="font-extrabold mb-0">42</h6>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Medical Field Profile -->
                    <div class="col-12 col-lg-3 mb-4">
                        <div class="card">
                            <div class="card-body d-flex align-items-center">
                                <div class="avatar avatar-xl me-3">
                                    <!-- Profile Image (placeholder) -->
                                    <!-- <img src="path_to_profile_image.jpg" alt="John Duck's Profile Image" class="rounded-circle"> -->
                                </div>
                                <div>
                                    <h5 class="font-bold mb-1">John Duck</h5>
                                    <h6 class="text-muted mb-0">Head of Medical Field</h6>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Profile Visit Statistics -->
                    <div class="col-12 mb-4">
                        <div class="card">
                            <div class="card-header">
                                <h4>Profile Visit</h4>
                            </div>
                            <div class="card-body">
                                <div id="chart-profile-visit"></div>
                            </div>
                        </div>
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
