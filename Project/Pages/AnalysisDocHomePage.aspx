<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AnalysisDoctor.master" AutoEventWireup="true" CodeFile="AnalysisDocHomePage.aspx.cs" Inherits="Pages_AnalysisDocHomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Home Page</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    <!-- Groups section start -->
                <section id="groups">
                    <div class="row match-height">
                        <div class="col-12 mt-3 mb-1">
                            <h4 class="section-title text-uppercase">Personal Information</h4>
                        </div>
                    </div>
                    <div class="row match-height">
                        <div class="col-12">
                            <div class="card-group">
                                <div class="card">
                                    <div class="card-content">
                                        
                                        <div class="card-body">
                                            <h4 class="card-title">Doctor Name</h4>
                                            <p class="card-text">
                                                Doctor's Department</p>
                                            <p class="card-text">
                                                Doctor's Username</p>
                                            <p class="card-text">
                                                Doctor's Position</p>
                                            <p class="card-text">
                                                Doctor's Mobile</p>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Script" Runat="Server">
</asp:Content>

