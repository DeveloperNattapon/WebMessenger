<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Messenger_.aspx.vb" Inherits="WebMessenger.Messenger_" EnableEventValidation="false" EnableViewState="true" MasterPageFile="~/MasterPage.Master" %>

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
                                
                                <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Save" OnClick="btnSave_Click" />
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

        <section class="content">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                      <%--  <div class="card-header">
                            <asp:Button ID="btnAddMile" CssClass="btn btn-success btn-default" runat="server" Text="Add Mile" />
                        </div>--%>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <asp:Repeater ID="showMessnger" runat="server">
                                <HeaderTemplate>
                                    <table id="example1" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>วันที่วิ่งงาน</th>
                                                <th>ชื่อ</th>
                                                <th>เวลาออก</th>
                                                <th>เลขไมล์ออก</th>
                                                <th>เวลาเข้า</th>
                                                <th>เลขไมล์เข้า</th>
                                                <th>Edit</th>

                                            </tr>
                                        </thead>
                                </HeaderTemplate>
                                <ItemTemplate>

                                    <tr>
                                        <td>
                                            <asp:Label ID="lblMessDate" runat="server" Text="Label"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="lblTimeOut" runat="server" Text="Label"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="lblMileOut" runat="server" Text="Label"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="lblTimeIn" runat="server" Text="Label"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="lblMileIn" runat="server" Text="Label"></asp:Label></td>
                                        <td class="text-center">
                                            <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" OnClick="lnkEdit_Click" CssClass="btn btn-outline-info">
                                                <i class="fa fa-edit"></i></asp:LinkButton></td>
                                    </tr>

                                </ItemTemplate>
                                <FooterTemplate>
                                    <tfoot>
                                        <tr>
                                            <th>วันที่วิ่งงาน</th>
                                            <th>ชื่อ</th>
                                            <th>เวลาออก</th>
                                            <th>เลขไมล์ออก</th>
                                            <th>เวลาเข้า</th>
                                            <th>เลขไมล์เข้า</th>
                                            <th>Edit</th>
                                        </tr>
                                    </tfoot>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
     <%--  <%-- <%-- class="modal hind fade"--%>
       <%-- <div id="myModal" class="modal hind fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Edit Mile</h3>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                <fieldset>
                                   
                               
                           
                                </fieldset>
                            </div>
                            <div class="modal-footer">
                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                <asp:Button ID="btnSaveChange" CssClass="btn btn-primary" runat="server" Text="Save Changes" OnClick="btnSaveChange_Click" />
                            </div>
                        </ContentTemplate>
                       
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>--%>
        <!-- Modal modal hind fade -->
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
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-md-offset-1 col-md-2 control-label " for="lblMessDate">วันที่วิ่งงาน</label>
                                            <div class="col-md-9">
                                                <asp:Label ID="lblMessDate" runat="server" Text="Label"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-offset-1 col-md-2 control-label " for="lblName">ชื่อ</label>
                                            <div class="col-md-9">
                                                  <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-offset-1 col-md-2 control-label" for="txtTimeOut">เวลาออก</label>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="txtTimeOut" CssClass="input-medium" runat="server" Width="50px"></asp:TextBox>
                                                <asp:MaskedEditExtender ID="txtBookingTime_MaskedEditExtender" runat="server"
                                                    TargetControlID="txtTimeOut" AcceptAMPM="false" MaskType="Time"
                                                    Mask="99:99" AutoComplete="False" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-offset-1 col-md-2 control-label " for="txtMileOut">เลขไมล์ออก</label>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="txtMileOut" runat="server" Width="50px"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-offset-1 col-md-2 control-label" for="txtTimeIn">เวลาเข้า</label>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="txtTimeIn" CssClass="input-medium" runat="server" Width="50px"></asp:TextBox>
                                                <asp:MaskedEditExtender ID="MaskedEditExtender1" runat="server"
                                                    TargetControlID="txtTimeIn" AcceptAMPM="false" MaskType="Time"
                                                    Mask="99:99" AutoComplete="False" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-offset-1 col-md-2 control-label " for="txtMileIn">เลขไมล์เข้า</label>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="txtMileIn" runat="server" Width="50px"></asp:TextBox>
                                            </div>
                                        </div>

                                    </div>
                                </fieldset>
                                
                            </div>
                            <div class="modal-footer">
                                 <div class="modal-footer">
                                <button class="btn" data-dismiss="modal" aria-hidden="true" id="btn">Close</button>
                                <asp:Button ID="btnSaveChange" CssClass="btn btn-primary" runat="server" Text="Save Changes" OnClick="btnSaveChange_Click" />
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
