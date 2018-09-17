<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default_.aspx.vb" Inherits="WebMessenger.Default_" MasterPageFile="~/MasterPage.Master" EnableEventValidation="false" EnableViewState="true"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Booking</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="Default_.aspx">Home</a></li>
                            <li class="breadcrumb-item active">Booking</li>
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
                        <h3 class="card-title">Booking</h3>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-body">
                        <div class="col-12">
                            <div class="row">
                            <div class="col-md-4 offset-2">
                                
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="txtDate1">วันที่ค้นหา</label>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txtDate1" CssClass="form-control" runat="server" AutoComplete="off"></asp:TextBox>
                                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txtDate1" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="txtDate2">ถึงวันที่</label>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txtDate2" CssClass="form-control" runat="server" AutoComplete="off"></asp:TextBox>
                                        <asp:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" TargetControlID="txtDate2" Format="dd/MM/yyyy"></asp:CalendarExtender>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="txtSearchDate">สาขา</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlBranchSearch" runat="server" CssClass="form-control input-sm">
                                            <asp:ListItem>ทุกสาขา</asp:ListItem>
                                            <asp:ListItem>SPM</asp:ListItem>
                                            <asp:ListItem>PTN</asp:ListItem>
                                            <asp:ListItem>LKB</asp:ListItem>
                                            <asp:ListItem>SBIA</asp:ListItem>
                                            <asp:ListItem>CKT</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="txtSearchDate">ผู้วิ่งงาน</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlMessengerSearch" runat="server" CssClass="form-control">
                                            <asp:ListItem>ทุกคน</asp:ListItem>
                                            <asp:ListItem>นาย ธเนศร์ จันทนมัฎฐะ</asp:ListItem>
                                            <asp:ListItem>นาย อิสระพงศ์ ห้องสำเริง</asp:ListItem>
                                            <asp:ListItem>นาย ประเสริฐ ไชยฉลาด</asp:ListItem>
                                            <asp:ListItem>นาย ชัยยงค์ อนุตโร</asp:ListItem>
                                            <asp:ListItem>นาย อนนท์ พงษ์ใหม่</asp:ListItem>
                                            <asp:ListItem>มอร์เตอร์ไซด์รับจ้าง</asp:ListItem>
                                            <asp:ListItem>นาย บุญมี พรมมาก</asp:ListItem>
                                            <asp:ListItem>นาย อำนาจ สุขงาม</asp:ListItem>
                                            <asp:ListItem>นาย สุทธิพงษ์ กายท้วม</asp:ListItem>
                                            <asp:ListItem>นาย ณัฐพล ท่ากลาง</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                                <div class="col-10">
                                    <div class="offset-10">
                                <asp:Button ID="Button1" CssClass="btn btn-success btn-default" runat="server" Text="ค้นหา" OnClick="Button1_Click"/>
                            </div>
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
        <section class="content">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <!-- /.card-header -->
                        <div class="card-body">
                            <asp:Repeater ID="showBooking" runat="server">
                                <HeaderTemplate>
                                    <table id="example1" class="table table-bordered table-sm">
                                        <thead>
                                            <tr>
                                                <th>เลขที่</th>
                                                <th>วันที่</th>
                                                <th>ผู้ติดต่อ</th>
                                                <th>ผู้สั่งงาน</th>
                                                <th>ผู้วิ่งงาน</th>
                                                <th>สถานะ</th>
                                                <th>Edit</th>
                                                <th>Print</th>
                                            </tr>
                                        </thead>
                                </HeaderTemplate>
                                <ItemTemplate>

                                    <tr>
                                        <td>
                                            <asp:Label ID="lblRecno" runat="server" Text="Label"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="lblBookingDate" runat="server" Text="Label"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="lblCustomerName" runat="server" Text="Label"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="lblBookingBy" runat="server" Text="Label"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="lblMessenger" runat="server" Text="Label"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label></td>
                                        <td class="text-center">
                                            <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" OnClick="lnkEdit_Click" CssClass="btn btn-outline-info"><i class="fa fa-edit"></i></asp:LinkButton></td>
                                        <td class="text-center">
                                            <asp:LinkButton ID="lnkPrint" runat="server" Text="Print" CssClass="btn btn-outline-dark" OnClick="lnkPrint_Click"><i class="fa fa-print"></i></asp:LinkButton></td>
                                    </tr>

                                </ItemTemplate>
                                <FooterTemplate>
                                    <tfoot>
                                        <tr>
                                            <th>เลขที่</th>
                                            <th>วันที่</th>
                                            <th>ผู้ติดต่อ</th>
                                            <th>ผู้สั่งงาน</th>
                                            <th>ผู้วิ่งงาน</th>
                                            <th>สถานะ</th>
                                            <th>Edit</th>
                                            <th>Print</th>
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
        <!-- /.content -->
        <asp:Panel ID="EndCustomerPanel" runat="server" CssClass="modal" TabIndex="-1" role="dialog" aria-labelledby="myLabe1">
            <div class="modal-dialog modal-lg" role="dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Edit Booking</h4>
                    </div>
                    <asp:UpdatePanel ID="EndCustomerUpdatePanel" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="modal-body">
                                <fieldset>
                                    <form class="form-horizontal">
                                        <div class="form-group">
                                            <label for="lblRecno" class="col-sm-2">เลขที่</label>
                                            <div class="col-sm-12">
                                                <asp:TextBox ID="txtRecno" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <label for="txtBookingDate" class="col-sm-4">ประจำวันที่</label>
                                            <div class="col-sm-12">
                                                <asp:TextBox ID="txtBookingDate" Format="dd/MM/yyyy" CssClass="form-control" runat="server"></asp:TextBox>
                                                <asp:CalendarExtender ID="txtBookingDate_CalendarExtender" Format="dd/MM/yyyy" runat="server" Enabled="True" TargetControlID="txtBookingDate"></asp:CalendarExtender>

                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <label for="txtBookingTime" class="col-sm-4">เวลา</label>
                                            <div class="col-sm-12">
                                                <asp:TextBox ID="txtBookingTime" CssClass="form-control" runat="server"></asp:TextBox>
                                                <asp:MaskedEditExtender ID="txtBookingTime_MaskedEditExtender" runat="server"
                                                    TargetControlID="txtBookingTime" AcceptAMPM="false" MaskType="Time" Mask="99:99" AutoComplete="False" />

                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <label for="ddlBranch" class="col-sm-4">สาขา</label>
                                            <div class="col-sm-12">
                                                <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control">
                                                    <asp:ListItem> </asp:ListItem>
                                                    <asp:ListItem>SPM</asp:ListItem>
                                                    <asp:ListItem>PTN</asp:ListItem>
                                                    <asp:ListItem>LKB</asp:ListItem>
                                                    <asp:ListItem>SBIA</asp:ListItem>
                                                    <asp:ListItem>CKT</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>


                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4" for="txtCustomerName">บริษัทผู้ติดต่อ</label>
                                            <div class="col-sm-12">
                                                <asp:TextBox CssClass="form-control" ID="txtCustomerName" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4" for="txtCusTel">โทร</label>
                                            <div class="col-sm-12">
                                                <asp:TextBox CssClass="form-control" ID="txtCusTel" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4" for="txtContactPerson">ผู้ติดต่อ</label>
                                            <div class="col-sm-12">
                                                <asp:TextBox CssClass="form-control" ID="txtContactPerson" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4" for="txtLocation">ที่อยู่</label>
                                            <div class="col-sm-12">
                                                <asp:TextBox CssClass="form-control" ID="txtLocation" runat="server" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4" for="chkJobType">ลักษณะงาน</label>
                                            <div class="col-sm-12">
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
                                            <label class="col-sm-4" for="txtJobDesc">รายละเอียดงาน</label>
                                            <div class="col-sm-12">
                                                <asp:TextBox ID="txtJobDesc" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4" for="txtReceiveComback">สิ่งที่ต้องรับกลับ</label>
                                            <div class="col-md-12">
                                                <asp:TextBox CssClass="form-control" ID="txtReceiveComback" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4" for="txtBookingBy">ผู้สั่งงาน</label>
                                            <div class="col-md-12">
                                                <asp:TextBox CssClass="form-control" ID="txtBookingBy" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4" for="txtReceiveby">ผู้รับเอกสาร</label>
                                            <div class="col-md-12">
                                                <asp:TextBox CssClass="form-control" ID="txtReceiveby" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4" for="ddlMessenger">ผู้วิ่งงาน</label>
                                            <div class="col-md-12">
                                                <asp:DropDownList ID="ddlMessenger" runat="server" CssClass="form-control">
                                                    <asp:ListItem> </asp:ListItem>
                                                    <asp:ListItem>นาย ธเนศร์ จันทนมัฎฐะ</asp:ListItem>
                                                    <asp:ListItem>นาย อิสระพงศ์ ห้องสำเริง</asp:ListItem>
                                                    <asp:ListItem>นาย ประเสริฐ ไชยฉลาด</asp:ListItem>
                                                    <asp:ListItem>นาย ชัยยงค์ อนุตโร</asp:ListItem>
                                                    <asp:ListItem>นาย อนนท์ พงษ์ใหม่</asp:ListItem>
                                                    <asp:ListItem>มอร์เตอร์ไซด์รับจ้าง</asp:ListItem>
                                                    <asp:ListItem>นาย บุญมี พรมมาก</asp:ListItem>
                                                    <asp:ListItem>นาย อำนาจ สุขงาม</asp:ListItem>
                                                    <asp:ListItem>นาย สุทธิพงษ์ กายท้วม</asp:ListItem>
                                                    <asp:ListItem>นาย ณัฐพล ท่ากลาง</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="chkStatus">การตรวจงาน</label>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="checkbox">
                                                        <input id="chkStatus" runat="server" type="checkbox" value="" />ตรวจแล้ว
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="RadioButton1">สถานะงาน</label>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                                        <asp:ListItem Value="สำเร็จ"></asp:ListItem>
                                                        <asp:ListItem Value="ไม่สำเร็จ"></asp:ListItem>
                                                        <asp:ListItem Value="ยกเลิก"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-8" for="txtRemark">สาเหตุที่ผลงาน ไม่สำเร็จ,ยกเลิก</label>
                                            <div class="col-md-12">
                                                <asp:TextBox CssClass="form-control" ID="txtRemark" runat="server"></asp:TextBox>
                                            </div>
                                        </div>


                                    </form>
                                </fieldset>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <asp:Button Type="button" CssClass="btn btn-primary" runat="server" Text="Save changes" OnClick="btnSaveChange_Click" ID="btnSaveChange"></asp:Button>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </asp:Panel>
    </form>

</asp:Content>

 
