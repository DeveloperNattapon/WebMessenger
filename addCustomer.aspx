<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="addCustomer.aspx.vb" Inherits="WebMessenger.addCustomer" MasterPageFile="~/MasterPage.Master" EnableEventValidation="false" EnableViewState="true" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="txtMessDate">วันที่วิ่งงาน</label>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="txtMessDate" runat="server" CssClass="form-control" placeholder="MM/DD/YYYY" ></asp:TextBox>
                                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txtMessDate" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                    </div>
                                 </div>
                                <div class="form-group">
                                      <label class="col-md-4 control-label" for="txtTimeOutAdd">เวลาออก</label>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="txtTimeOutAdd" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:MaskedEditExtender ID="MaskedEditExtender2" runat="server"
                                            TargetControlID="txtTimeOutAdd" AcceptAMPM="false" MaskType="Time"
                                            Mask="99:99" AutoComplete="False" />
                                    </div>
                                
                               
                                </div>
                                  <div class="form-group">
                                       <label class="col-md-4 control-label" for="txtMileOutAdd">เลขไมล์ออก</label>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="txtMileOutAdd" runat="server" CssClass="form-control" ></asp:TextBox>
                                    </div>
                                  </div>  
                                   
                                </div>
                           
                        <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="lblNameAdd">ชื่อ</label>
                                    <div class="col-md-12">
                                        <%--  <asp:TextBox ID="txtName" runat="server"></asp:TextBox>--%>
                                        <asp:Label ID="lblNameAdd" runat="server" Text="Label" CssClass="form-control"></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="txtTimeInAdd">เวลาเข้า</label>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="txtTimeInAdd" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:MaskedEditExtender ID="MaskedEditExtender3" runat="server"
                                            TargetControlID="txtTimeInAdd" AcceptAMPM="false" MaskType="Time"
                                            Mask="99:99" AutoComplete="False" />
                                    </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-4 control-label " for="txtMileInAdd">เลขไมล์เข้า</label>
                                        <div class="col-md-12">
                                            <asp:TextBox ID="txtMileInAdd" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                               
                            </div>
                            <div class="col-12 text-right">
                                 <div class="form-group">
                                
                                <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Save" />
                                <button class="btn" data-dismiss="modal" aria-hidden="true" runat="server">Close</button>
                            </div>
                            </div>
                           
                           
                      </div>
               
                        </div>
                  
                    <!-- /.card-body -->
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>
    </form>
</asp:Content>
