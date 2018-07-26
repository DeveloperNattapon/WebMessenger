<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="RegisterBooking.aspx.vb" Inherits="WebMessenger._Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" class="form-horizontal">
          <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
         <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">  
                        <h1>Register Booking</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                            <li class="breadcrumb-item active">Register Booking</li>
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
                        <h3 class="card-title">Register Booking</h3>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-body">
                 <div class="col-md-12 offset-2">
                 <div class="form-group">
                    <label class="col-sm-2 control-label" for="txtBookingDate">ประจำวันที่</label>
                    <div class="col-md-8">

                        <asp:TextBox ID="txtBookingDate" CssClass="form-control" runat="server" required="required" autocomplete="off"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txtBookingDate" Format="dd/MM/yyyy"></asp:CalendarExtender>

                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="txtBookingTime">เวลา</label>
                    <div class="col-sm-8">
                  <%--      <input type="time" class="input-medium" runat="server" id="txtBookingTime" />--%>
                        <asp:TextBox ID="txtBookingTime" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:MaskedEditExtender ID="MaskedEditExtender1" runat="server"
                            TargetControlID="txtBookingTime" AcceptAMPM="false" MaskType="Time"
                            Mask="99:99" AutoComplete="False" />

                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="ddlBranch">สาขา</label>
                    <div class="col-md-8">
                        <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>SPM</asp:ListItem>
                            <asp:ListItem>PTN</asp:ListItem>
                            <asp:ListItem>LKB</asp:ListItem>
                            <asp:ListItem>SBIA</asp:ListItem>
                            <asp:ListItem>CKT</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="txtCustomerName" >บริษัทผู้ติดต่อ</label>
               <div class="row">
                    <div class="col-md-6">
                        <asp:TextBox CssClass="form-control" ID="txtCustomerName" runat="server" autocomplete="off"></asp:TextBox>
                    </div>
                    
                    <div class="col-md-3">     
                       <button id="btnSearch_" class="btn btn-outline-primary" runat="server" data-toggle="modal" data-target="#exampleModalCenter" type="button" autofocus="autofocus"><i class="fa fa-search"></i></button>
                        <a>ค้นหาบริษัทผู้ติดต่อ</a>
                    </div>  
               </div>
                            
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="txtCusTel">โทร</label>
                    <div class="col-8">
                        <asp:TextBox CssClass="form-control" ID="txtCusTel" runat="server" autocomplete="off"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label" for="txtContactPerson">ผู้ติดต่อ</label>
                    <div class="col-md-8">
                        <asp:TextBox CssClass="form-control" ID="txtContactPerson" runat="server" autocomplete="off"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label" for="txtLocation">ที่อยู่</label>
                    <div class="col-md-8">
                        <asp:TextBox CssClass="form-control" ID="txtLocation" runat="server"  TextMode="MultiLine" Height="100px"></asp:TextBox>

                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2  control-label" for="chkJobType">ลักษณะงาน</label>
                    <div class="col-md-8">
                        <div class="form-group">
                            <label class="checkbox">
                                <input id="chkJobType1" runat="server" type="checkbox" value="" />วางบิล
                            </label>
                            <label class="checkbox">
                                <input id="chkJobType2" runat="server" type="checkbox" value="" />รับเช็ค
                            </label>
                            <label class="checkbox">
                                <input id="chkJobType3" runat="server" type="checkbox" value="" />รับ/ส่ง เอกสาร
                            </label>
                             <label class="checkbox">
                                <input id="chkJobType4" runat="server" type="checkbox" value="" />อื่นๆ
                            </label>

                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2control-label" for="txtJobDesc">รายละเอียดงาน</label>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtJobDesc" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label" for="txtReceiveComback">สิ่งที่ต้องรับกลับ</label>
                    <div class="col-md-8">
                        <asp:TextBox CssClass="form-control" ID="txtReceiveComback" runat="server" autocomplete="off"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label" for="txtBookingBy">ผู้สั่งงาน</label>
                    <div class="col-md-8">
                        <asp:TextBox CssClass="form-control" ID="txtBookingBy" runat="server" autocomplete="off"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label" for="txtReceiveby">ผู้รับเอกสาร</label>
                    <div class="col-md-8">
                        <asp:TextBox CssClass="form-control" ID="txtReceiveby" runat="server" autocomplete="off"></asp:TextBox>
                    </div>
                </div>
          
              
                 </div>
                 <div class="col-6">
                       <div class="form-group">
                    <div class="text-right">
                        <asp:Button ID="btnConfirm" CssClass="btn btn-primary" runat="server" Text="Save" OnClick="btnConfirm_Click"/>
                        <input id="Reset1" class="btn" type="reset" value="Reset" />&nbsp;&nbsp;
                    </div>
                </div>
         
                 </div>
                    </div>
                    <!-- /.card-body -->
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->

        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">ค้นหาบริษัทผู้ติดต่อ</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="input-group input-group-sm">
                            <input type="text" class="form-control" runat="server" id="txtGo">
                            <span class="input-group-append">
                                <button type="button" class="btn btn-info btn-flat" runat="server" onserverclick="Unnamed_ServerClick">Go!</button>
                            </span>
                        </div>
                        <br />
                       <asp:Repeater ID="showCustomer" runat="server" OnItemDataBound="showCustomer_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="table table-sm" id="example1">
                                          <thead>
                                              <tr>
                                                  <th scope="col">เลือก</th>
                                                  <th scope="col">บริษัทผู้ติดต่อ</th>
                                                  <th scope="col">ผู้ติดต่อ</th>
                                                  <th scope="col">โทร</th>

                                              </tr>
                                           </thead>
                                </HeaderTemplate>

                                <ItemTemplate>
                                  
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="lnkSearch" runat="server" OnClick="lnkSearch_Click" CssClass="btn btn-outline-info"><i class="fa fa-hand-pointer-o"></i></asp:LinkButton></td>
                                      
                                         <td>
                                            <asp:Label ID="lblCustomerName" runat="server" Text="Label"></asp:Label></td>
                                        
                                        <td>
                                            <asp:Label ID="lblContactPerson" runat="server" Text="Label"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="lblCusTel" runat="server" Text="Label"></asp:Label></td>
                                       </tr>

                                </ItemTemplate>
                                <FooterTemplate>
                                    <tfoot>
                                        <tr>
                                            <th scope="col">เลือก</th>
                                            <th scope="col">บริษัทผู้ติดต่อ</th>
                                            <th scope="col">ผู้ติดต่อ</th>
                                            <th scope="col">โทร</th>   
                                        </tr>
                                    </tfoot>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
