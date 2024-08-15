<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Doctor.master" AutoEventWireup="true" CodeFile="EmployeeHistory.aspx.cs" Inherits="Pages_EmployeeHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Employee Medical History</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    <section id="multiple-column-form">
        <div class="row match-height">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Employee's Medical History</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <div class="list-group">
                                
                                <span class="list-group-item">
                                    <asp:Label ID="Label11" runat="server" Text="Appointment X" CssClass="mb-1" Style="font-size: 20px; color: #25396f; font-weight: bold; display: block;"></asp:Label>

                                    <asp:Label ID="Label12" runat="server" Text="Date:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <asp:Label ID="Label13" runat="server" Text="Doctor:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <asp:Label ID="Label14" runat="server" Text="Department:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <asp:Label ID="Label15" runat="server" Text="Status: Attended" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <asp:Label ID="Label16" runat="server" Text="Diagnosis:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <asp:Label ID="Label54" runat="server" Text="Sick Leave Days:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                </span>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Previous Lab Reports</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <div class="list-group">
                                <span class="list-group-item">
                                    <asp:Label ID="Label17" runat="server" Text="Lab Report Z" CssClass="mb-1" Style="font-size: 20px; color: #25396f; font-weight: bold; display: block;"></asp:Label>

                                    <asp:Label ID="Label18" runat="server" Text="Date:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <asp:Label ID="Label29" runat="server" Text="Lab Name" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <asp:Label ID="Label19" runat="server" Text="Test Name:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <asp:Label ID="Label20" runat="server" Text="Result:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                </span>
                                <span class="list-group-item">
                                    <asp:Label ID="Label21" runat="server" Text="Lab Report Y" CssClass="mb-1" Style="font-size: 20px; color: #25396f; font-weight: bold; display: block;"></asp:Label>

                                    <asp:Label ID="Label22" runat="server" Text="Date:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <asp:Label ID="Label30" runat="server" Text="Lab Name" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <asp:Label ID="Label23" runat="server" Text="Test Name:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <asp:Label ID="Label24" runat="server" Text="Result:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                </span>
                                <span class="list-group-item">
                                    <asp:Label ID="Label25" runat="server" Text="Lab Report X" CssClass="mb-1" Style="font-size: 20px; color: #25396f; font-weight: bold; display: block;"></asp:Label>

                                    <asp:Label ID="Label26" runat="server" Text="Date:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <asp:Label ID="Label31" runat="server" Text="Lab Name" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <asp:Label ID="Label27" runat="server" Text="Test Name:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <asp:Label ID="Label28" runat="server" Text="Result:" CssClass="mb-1" Style="display: block;"></asp:Label>

                                </span>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Previous Prescriptions</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <div class="list-group">
                                <span class="list-group-item">
                                    <asp:Label ID="Label41" runat="server" Text="Prescription Z" CssClass="mb-1" Style="font-size: 20px; color: #25396f; font-weight: bold; display: block;"></asp:Label>

                                    <asp:Label ID="Label42" runat="server" Text="Appointment Date:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <asp:Label ID="Label43" runat="server" Text="Doctor:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <asp:Label ID="Label44" runat="server" Text="Department:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <div class="modal-primary me-1 mb-1 d-flex justify-content-end">
                                        <!-- Button trigger for primary themes modal -->
                                        <asp:Button
                                            ID="btnPrimary"
                                            runat="server"
                                            Text="View Details"
                                            CssClass="btn btn-outline-primary"
                                            OnClientClick="var myModal = new bootstrap.Modal(document.getElementById('primary')); myModal.show(); return false;" />

                                        <!--primary theme Modal -->
                                        <div class="modal fade text-left" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel160" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header bg-primary">
                                                        <asp:Label ID="myModalLabel160" runat="server" Text="Prescription Details" CssClass="modal-title white"></asp:Label>
                                                    </div>
                                                    <div class="modal-body">
                                                        <asp:Label ID="Medicin1" runat="server" Text="Medicine 1: --- Frequency: --- Quantity: --- Notes: ---" style="display:block;"></asp:Label>
                                                        <asp:Label ID="Label40" runat="server" Text="Medicine 2: --- Frequency: --- Quantity: --- Notes: ---" style="display:block;"></asp:Label>
                                                        <asp:Label ID="Label45" runat="server" Text="Medicine 3: --- Frequency: --- Quantity: --- Notes: ---" style="display:block;"></asp:Label>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <asp:Button ID="CloseButton" runat="server" CssClass="btn btn-light-secondary" OnClientClick="this.closest('.modal').modal('hide'); return false;" Text="Close" />

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </span>
                                <span class="list-group-item">
                                    <asp:Label ID="Label32" runat="server" Text="Prescription Y" CssClass="mb-1" Style="font-size: 20px; color: #25396f; font-weight: bold; display: block;"></asp:Label>

                                    <asp:Label ID="Label33" runat="server" Text="Appointment Date:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <asp:Label ID="Label34" runat="server" Text="Doctor:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <asp:Label ID="Label35" runat="server" Text="Department:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <div class="modal-primary me-1 mb-1 d-flex justify-content-end">
                                        <!-- Button trigger for primary themes modal -->
                                        <asp:Button
                                            ID="Button1"
                                            runat="server"
                                            Text="View Details"
                                            CssClass="btn btn-outline-primary"
                                            OnClientClick="var myModal = new bootstrap.Modal(document.getElementById('primary')); myModal.show(); return false;" />

                                        <!--primary theme Modal -->
                                        <div class="modal fade text-left" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel160" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header bg-primary">
                                                        <asp:Label ID="Label46" runat="server" Text="Prescription Details" CssClass="modal-title white"></asp:Label>
                                                    </div>
                                                    <div class="modal-body">
                                                        <asp:Label ID="Label47" runat="server" Text="Medicine 1: --- Frequency: --- Quantity: --- Notes: ---" style="display:block;"></asp:Label>
                                                        <asp:Label ID="Label48" runat="server" Text="Medicine 2: --- Frequency: --- Quantity: --- Notes: ---" style="display:block;"></asp:Label>
                                                        <asp:Label ID="Label49" runat="server" Text="Medicine 3: --- Frequency: --- Quantity: --- Notes: ---" style="display:block;"></asp:Label>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <asp:Button ID="Button2" runat="server" CssClass="btn btn-light-secondary" OnClientClick="this.closest('.modal').modal('hide'); return false;" Text="Close" />

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </span>
                                <span class="list-group-item">
                                    <asp:Label ID="Label36" runat="server" Text="Prescription X" CssClass="mb-1" Style="font-size: 20px; color: #25396f; font-weight: bold; display: block;"></asp:Label>

                                    <asp:Label ID="Label37" runat="server" Text="Appointment Date:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <asp:Label ID="Label38" runat="server" Text="Doctor:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <asp:Label ID="Label39" runat="server" Text="Department:" CssClass="mb-1" Style="display: block;"></asp:Label>
                                    <div class="modal-primary me-1 mb-1 d-flex justify-content-end">
                                        <!-- Button trigger for primary themes modal -->
                                        <asp:Button
                                            ID="Button3"
                                            runat="server"
                                            Text="View Details"
                                            CssClass="btn btn-outline-primary"
                                            OnClientClick="var myModal = new bootstrap.Modal(document.getElementById('primary')); myModal.show(); return false;" />

                                        <!--primary theme Modal -->
                                        <div class="modal fade text-left" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel160" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header bg-primary">
                                                        <asp:Label ID="Label50" runat="server" Text="Prescription Details" CssClass="modal-title white"></asp:Label>
                                                    </div>
                                                    <div class="modal-body">
                                                        <asp:Label ID="Label51" runat="server" Text="Medicine 1: --- Frequency: --- Quantity: --- Notes: ---" style="display:block;"></asp:Label>
                                                        <asp:Label ID="Label52" runat="server" Text="Medicine 2: --- Frequency: --- Quantity: --- Notes: ---" style="display:block;"></asp:Label>
                                                        <asp:Label ID="Label53" runat="server" Text="Medicine 3: --- Frequency: --- Quantity: --- Notes: ---" style="display:block;"></asp:Label>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <asp:Button ID="Button4" runat="server" CssClass="btn btn-light-secondary" OnClientClick="this.closest('.modal').modal('hide'); return false;" Text="Close" />

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </span>

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

