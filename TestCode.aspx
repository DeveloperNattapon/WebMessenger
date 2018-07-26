<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TestCode.aspx.vb" Inherits="WebMessenger.TestCode" MasterPageFile="~/MasterPage.Master" EnableEventValidation="false" EnableViewState="true"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Customer</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                            <li class="breadcrumb-item active">Customer</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">Messnger</h3>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-body">
                    <div class="table" onload="makeTableScroll();">
        <table id="myTable">
            <tr>
                <td>blah blah</td>
                <td>blah blah</td>
                <td>blah blah</td>
                <td>blah blah</td>
            </tr>
            <tr>
                <td>Here is some long text that should wrap: blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah</td>
                <td>blah blah</td>
                <td>blah blah</td>
                <td>blah blah</td>
            </tr>
            <tr>
                <td>blah</td>
                <td>blah</td>
                <td>blah</td>
                <td>blah</td>
            </tr>
            <tr>
                <td>blah blah</td>
                <td>blah blah</td>
                <td>blah blah</td>
                <td>blah blah</td>
            </tr>
            <tr>
                <td>blah blah</td>
                <td>blah blah</td>
                <td>blah blah</td>
                <td>blah blah</td>
            </tr>
            <tr>
                <td>blah blah</td>
                <td>blah blah</td>
                <td>blah blah</td>
                <td>blah blah</td>
            </tr>
            <tr>
                <td>blah</td>
                <td>blah</td>
                <td>blah</td>
                <td>blah</td>
            </tr>
        </table>
    </div>
                    
                    </div>
                    <!-- /.card-body -->
                </div>
           </div>
            <!-- /.container-fluid -->
        </section>


       <div class="modal fade" id="myModalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalEditLabel" aria-hidden="true">
            <div class="modal-dialog card card-primary" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="myModalEditLabel">Edit Mile</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                <fieldset>
                                    
                                </fieldset>
                                
                            </div>
                            <div class="modal-footer">
                                 <div class="modal-footer">
                                <button class="btn" data-dismiss="modal" aria-hidden="true" id="btn">Close</button>
                                <asp:Button ID="btnSaveChange" CssClass="btn btn-primary" runat="server" Text="Save Changes" />
                            </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                           
                            <asp:AsyncPostBackTrigger ControlID="btnSaveChange" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

    </form>

     
</asp:Content>
