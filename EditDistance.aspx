<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EditDistance.aspx.vb"  Inherits="WebMessenger.EditDistance" MasterPageFile="~/MasterPage.Master" EnableEventValidation="false" EnableViewState="true"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Messnger</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                            <li class="breadcrumb-item active">Messnger</li>
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
                                      <label class="col-md-4 control-label" for="txtTimeOut">เวลาออก</label>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="txtTimeOut" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:MaskedEditExtender ID="MaskedEditExtender2" runat="server"
                                            TargetControlID="txtTimeOut" AcceptAMPM="false" MaskType="Time"
                                            Mask="99:99" AutoComplete="False" />
                                    </div>
                                
                               
                                </div>
                                  <div class="form-group">
                                       <label class="col-md-4 control-label" for="txtMileOut">เลขไมล์ออก</label>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="txtMileOut" runat="server" CssClass="form-control" ></asp:TextBox>
                                    </div>
                                  </div>  
                                   
                                </div>
                           
                        <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="lblNameAdd">ชื่อ</label>
                                    <div class="col-md-12">
                                        <%--  <asp:TextBox ID="txtName" runat="server"></asp:TextBox>--%>
                                        <asp:Label ID="lblName" runat="server" Text="Label" CssClass="form-control"></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="txtTimeInAdd">เวลาเข้า</label>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="txtTimeIn" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:MaskedEditExtender ID="MaskedEditExtender3" runat="server"
                                            TargetControlID="txtTimeIn" AcceptAMPM="false" MaskType="Time"
                                            Mask="99:99" AutoComplete="False" />
                                    </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-4 control-label " for="txtMileIn">เลขไมล์เข้า</label>
                                        <div class="col-md-12">
                                            <asp:TextBox ID="txtMileIn" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                               
                            </div>
                            <div class="col-12 text-right">
                                 <div class="form-group">
                                
                                <asp:Button ID="btnEdit" CssClass="btn btn-primary" runat="server" Text="Save" OnClick="btnEdit_Click" />
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
