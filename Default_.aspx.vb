Option Explicit On
Option Strict On

Imports System.Globalization

Public Class Default_
    Inherits System.Web.UI.Page
    'Dim db As New DB_EaglesInternalE01
    'Dim db As New DB_EaglesIntemalEntities_test
    Dim db As New DB_EaglesInternalEntities
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim datenow As String = Convert.ToDateTime(Date.Now).ToString("dd/MM/yyyy")
            BindData(datenow, datenow, "", "")
        End If
    End Sub
    Private Sub BindData(ByVal date1 As String, ByVal date2 As String, branch As String, mess As String)

        'If mess = "ทุกคน" Then
        '    mess = ""
        'End If
        'If branch = "ทุกสาขา" Then
        '    branch = ""
        'End If
        Dim dt1 As Date = DateTime.ParseExact("01/01/2018", "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US"))
        'Dim dt2 As Date = DateTime.ParseExact(date2, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US"))
        'And c.BookingDate <= dt2 And c.Branch.Contains(branch) And c.Messenger.Contains(mess) Order By c.RecNo Descending

        Dim ds = (From c In db.tblBookingMessengers Where c.BookingDate = dt1
                     Select New With {
                         c.RecNo, c.BookingDate, c.CustomerName, c.Location, _
                         c.BookingBy, c.Messenger, c.Status
                        }).ToList()

        If ds.Count > 0 Then
            Me.showBooking.DataSource = ds
            Me.showBooking.DataBind()
        Else
            Me.showBooking.DataSource = Nothing
            Me.showBooking.DataBind()
        End If


    End Sub

    Protected Sub btnSaveChange_Click(sender As Object, e As EventArgs) Handles btnSaveChange.Click

        Dim BookingMessenger As tblBookingMessenger = (From c In db.tblBookingMessengers _
                        Where c.RecNo = CInt(txtRecno.Text) _
                        Select c).First()

        BookingMessenger.BookingDate = DateTime.ParseExact(txtBookingDate.Text, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US"))
        BookingMessenger.BookingTime = txtBookingTime.Text
        BookingMessenger.CusTel = txtCusTel.Text.Trim
        BookingMessenger.ContactPerson = txtContactPerson.Text.Trim
        BookingMessenger.CustomerName = txtCustomerName.Text.Trim
        BookingMessenger.Location = txtLocation.Text.Trim
        BookingMessenger.JobType1 = IIf(chkJobType1.Checked = True, "วางบิล", "").ToString
        BookingMessenger.JobType2 = IIf(chkJobType2.Checked = True, "รับเช็ค", "").ToString
        BookingMessenger.JobType3 = IIf(chkJobType3.Checked = True, "รับ/ส่ง เอกสาร", "").ToString
        BookingMessenger.JobType4 = IIf(chkJobType4.Checked = True, "อื่นๆ", "").ToString
        BookingMessenger.JobDesc = txtJobDesc.Text.Trim
        BookingMessenger.ReceiveComback = txtReceiveComback.Text.Trim
        BookingMessenger.BookingBy = txtBookingBy.Text.Trim
        BookingMessenger.Branch = ddlBranch.Text
        BookingMessenger.Messenger = ddlMessenger.Text
        BookingMessenger.Status = RadioButtonList1.SelectedValue
        BookingMessenger.Remark = txtRemark.Text.Trim
        BookingMessenger.ReceiveBy = txtReceiveby.Text.Trim
        BookingMessenger.StatusJob = CType(IIf(chkStatus.Checked = True, 1, 0), Integer)
        BookingMessenger.UpdateBy = Session("Name_eng").ToString.ToUpper
        BookingMessenger.UpdateDate = Now

        db.SaveChanges()

        'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('บันทึกข้อมูล เรียบร้อยแล้วครับ')", True)
        'Response.Redirect(Request.Cookies("MessConfigPath").Value + "Default.aspx")
        'Response.Redirect("~/Default.aspx")
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirect", "alert('แก้ไขข้อมูล เรียบร้อยแล้วครับ'); window.location='" + Request.ApplicationPath + "/Default_.aspx';", True)

    End Sub

    Protected Sub lnkPrint_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim item As RepeaterItem = TryCast(TryCast(sender, LinkButton).Parent, RepeaterItem)
        Dim lblRecno As String = TryCast(item.FindControl("lblRecno"), Label).Text.Trim
        'Dim btnsubmit As LinkButton = TryCast(sender, LinkButton)
        'Dim gRow As GridViewRow = DirectCast(btnsubmit.NamingContainer, GridViewRow)
        'Dim index As String = GridView1.DataKeys(gRow.RowIndex).Value.ToString()

        'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "", "window.open('../Report/RptMessenger.aspx?recno='" + index + ",'popup1','_blank')", True)
        Dim url As String = "FrmReport/RptMessenger.aspx?recno=" + lblRecno
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "onclick", "javascript:window.open( '" + url + "','_blank','height=600px,width=1000px,scrollbars=1');", True)

    End Sub

    Protected Sub lnkEdit_Click(ByVal sender As Object, ByVal e As EventArgs)
        'Dim btnsubmit As LinkButton = TryCast(sender, LinkButton)
        'Dim gRow As GridViewRow = DirectCast(btnsubmit.NamingContainer, GridViewRow)
        'Dim show As Repeater = DirectCast(btnsubmit.NamingContainer, Gr)
        'Dim index As Integer = CInt(GridView1.DataKeys(gRow.RowIndex).Value.ToString())
        'lblRecno.Text = GridView1.DataKeys(gRow.RowIndex).Value.ToString()
        Dim item As RepeaterItem = TryCast(TryCast(sender, LinkButton).Parent, RepeaterItem)
        Dim index As Integer = CInt(TryCast(item.FindControl("lblRecno"), Label).Text.Trim)
        Dim BookingDate As String = TryCast(item.FindControl("lblBookingDate"), Label).Text.Trim


        Dim ds = (From c In db.tblBookingMessengers Where c.RecNo = index).SingleOrDefault
        Dim UserID As String = Session("UserID").ToString
        'Dim UserID As String = "e.1250".ToUpper

        If (ds.Status = "สำเร็จ" Or ds.Status = "ไม่สำเร็จ" Or ds.Status = "ยกเลิก") And Not (UserID = "E.1195" Or UserID = "K.301" Or UserID = "K.302" Or UserID = "E.896") Then
            ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('ข้อมูลสถานะ สำเร็จ,ไม่สำเร็จ,ยกเลิก คุณไม่สามารถแก้ไขข้อมูลได้ครับ')", True)
            Exit Sub
        End If

        txtRecno.Text = ds.RecNo.ToString
        txtBookingDate.Text = Convert.ToDateTime(ds.BookingDate).ToString("dd/MM/yyyy")
        txtBookingTime.Text = ds.BookingTime
        txtCusTel.Text = ds.CusTel
        txtContactPerson.Text = ds.ContactPerson
        txtCustomerName.Text = ds.CustomerName
        txtLocation.Text = ds.Location
        If ds.JobType1 = "วางบิล" Then
            chkJobType1.Checked = True
        Else
            chkJobType1.Checked = False
        End If
        If ds.JobType2 = "รับเช็ค" Then
            chkJobType2.Checked = True
        Else
            chkJobType2.Checked = False
        End If
        If ds.JobType3 = "รับ/ส่ง เอกสาร" Then
            chkJobType3.Checked = True
        Else
            chkJobType3.Checked = False
        End If
        If ds.JobType4 = "อื่นๆ" Then
            chkJobType4.Checked = True
        Else
            chkJobType4.Checked = False
        End If
        txtJobDesc.Text = ds.JobDesc
        txtReceiveComback.Text = ds.ReceiveComback
        txtBookingBy.Text = ds.BookingBy
        ddlBranch.Text = ds.Branch
        txtReceiveby.Text = ds.ReceiveBy
        ddlMessenger.Text = ds.Messenger
        If ds.Status = "สำเร็จ" Then
            RadioButtonList1.SelectedValue = "สำเร็จ"
        ElseIf ds.Status = "ไม่สำเร็จ" Then
            RadioButtonList1.SelectedValue = "ไม่สำเร็จ"
        ElseIf ds.Status = "ยกเลิก" Then
            RadioButtonList1.SelectedValue = "ยกเลิก"
        Else
            RadioButtonList1.SelectedValue = Nothing
        End If
        If ds.StatusJob = 1 Then
            chkStatus.Checked = True
        Else
            chkStatus.Checked = False
        End If
        txtRemark.Text = ds.Remark


        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "EditModalScript", "openModal();", True)

    End Sub
    'Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
    '    Dim index As Integer = Convert.ToInt32(e.CommandArgument)

    '    If e.CommandName.Equals("Edit") Then
    '        Using db = New DB_EaglesInternalEntities

    '            Dim ds = (From c In db.tblBookingMessenger Where c.RecNo = index).SingleOrDefault
    '            lblRecno.Text = ds.RecNo.ToString
    '            txtBookingDate.Text = ds.BookingDate.ToString
    '            txtBookingTime.Text = ds.BookingTime
    '            ddlBranch.Text = ds.Branch

    '       End Using
    '        'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "EditModalScript", "openModal();", False)
    '        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "EditModalScript", "openModal();", True)


    '    End If
    'End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        If txtDate1.Text = "" Then
            txtDate1.Text = Convert.ToDateTime(Date.Now).ToString("dd/MM/yyyy")
        End If

        If txtDate2.Text = "" Then
            txtDate2.Text = Convert.ToDateTime(Date.Now).ToString("dd/MM/yyyy")
        End If

        BindData(txtDate1.Text, txtDate2.Text, ddlBranchSearch.Text, ddlMessengerSearch.Text)
    End Sub

    'Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
    '    If e.Row.RowType = DataControlRowType.DataRow Then
    '        Dim lblRecno As Label = DirectCast(e.Row.FindControl("lblRecno"), Label)
    '        If Not IsNothing(lblRecno) Then
    '            lblRecno.Text = DataBinder.Eval(e.Row.DataItem, "Recno").ToString()
    '        End If
    '        Dim lblBookingDate As Label = DirectCast(e.Row.FindControl("lblBookingDate"), Label)
    '        If Not IsNothing(lblBookingDate) Then
    '            lblBookingDate.Text = CStr(DataBinder.Eval(e.Row.DataItem, "BookingDate", "{0:dd/MM/yyyy}"))
    '        End If
    '        Dim lblCustomerName As Label = DirectCast(e.Row.FindControl("lblCustomerName"), Label)
    '        If Not IsNothing(lblCustomerName) Then
    '            lblCustomerName.Text = DataBinder.Eval(e.Row.DataItem, "CustomerName").ToString()
    '        End If
    '        Dim lblLocation As Label = DirectCast(e.Row.FindControl("lblLocation"), Label)
    '        If Not IsNothing(lblLocation) Then
    '            lblLocation.Text = DataBinder.Eval(e.Row.DataItem, "Location").ToString()
    '        End If
    '        Dim lblBookingBy As Label = DirectCast(e.Row.FindControl("lblBookingBy"), Label)
    '        If Not IsNothing(lblBookingBy) Then
    '            lblBookingBy.Text = DataBinder.Eval(e.Row.DataItem, "BookingBy").ToString()
    '        End If
    '        Dim lblBranch As Label = DirectCast(e.Row.FindControl("lblBranch"), Label)
    '        If Not IsNothing(lblBranch) Then
    '            lblBranch.Text = DataBinder.Eval(e.Row.DataItem, "Branch").ToString()
    '        End If
    '        Dim lblMessenger As Label = DirectCast(e.Row.FindControl("lblMessenger"), Label)
    '        If Not IsNothing(lblMessenger) Then
    '            lblMessenger.Text = DataBinder.Eval(e.Row.DataItem, "Messenger").ToString()
    '        End If
    '        Dim lblstatus As Label = DirectCast(e.Row.FindControl("lblstatus"), Label)
    '        If Not IsNothing(lblstatus) Then
    '            lblstatus.Text = DataBinder.Eval(e.Row.DataItem, "status").ToString()
    '        End If
    '    End If
    'End Sub

    'Protected Sub ShowPageCommand(s As Object, e As GridViewPageEventArgs)
    '    GridView1.PageIndex = e.NewPageIndex

    '    If txtDate1.Text = "" Then
    '        txtDate1.Text = Convert.ToDateTime(Date.Now).ToString("dd/MM/yyyy")
    '    End If
    '    If txtDate2.Text = "" Then
    '        txtDate2.Text = Convert.ToDateTime(Date.Now).ToString("dd/MM/yyyy")
    '    End If

    '    BindData(txtDate1.Text, txtDate2.Text, ddlBranchSearch.Text, ddlMessengerSearch.Text)

    'End Sub

    Protected Sub showBooking_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles showBooking.ItemDataBound
        If e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem Then
            Dim lblRecno As Label = DirectCast(e.Item.FindControl("lblRecno"), Label)
            If Not IsNothing(lblRecno) Then
                lblRecno.Text = DataBinder.Eval(e.Item.DataItem, "Recno").ToString()
            End If
            Dim lblBookingDate As Label = DirectCast(e.Item.FindControl("lblBookingDate"), Label)
            If Not IsNothing(lblBookingDate) Then
                lblBookingDate.Text = CStr(DataBinder.Eval(e.Item.DataItem, "BookingDate", "{0:dd/MM/yyyy}"))
            End If
            Dim lblCustomerName As Label = DirectCast(e.Item.FindControl("lblCustomerName"), Label)
            If Not IsNothing(lblCustomerName) Then
                lblCustomerName.Text = DataBinder.Eval(e.Item.DataItem, "CustomerName").ToString()
            End If
            'Dim lblLocation As Label = DirectCast(e.Item.FindControl("lblLocation"), Label)
            'If Not IsNothing(lblLocation) Then
            '    lblLocation.Text = DataBinder.Eval(e.Item.DataItem, "Location").ToString()
            'End If
            Dim lblBookingBy As Label = DirectCast(e.Item.FindControl("lblBookingBy"), Label)
            If Not IsNothing(lblBookingBy) Then
                lblBookingBy.Text = DataBinder.Eval(e.Item.DataItem, "BookingBy").ToString()
            End If
            'Dim lblBranch As Label = DirectCast(e.Item.FindControl("lblBranch"), Label)
            'If Not IsNothing(lblBranch) Then
            '    lblBranch.Text = DataBinder.Eval(e.Item.DataItem, "Branch").ToString()
            'End If
            Dim lblMessenger As Label = DirectCast(e.Item.FindControl("lblMessenger"), Label)
            If Not IsNothing(lblMessenger) Then
                lblMessenger.Text = DataBinder.Eval(e.Item.DataItem, "Messenger").ToString()
            End If
            Dim lblstatus As Label = DirectCast(e.Item.FindControl("lblstatus"), Label)
            If Not IsNothing(lblstatus) Then
                lblstatus.Text = DataBinder.Eval(e.Item.DataItem, "status").ToString()
            End If
        End If
    End Sub
End Class