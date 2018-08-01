Option Strict On
Option Explicit On

Imports System.IO
Imports System.Linq
Imports System.Data
Imports System.Web
Imports System.Web.Configuration
Imports System.Data.SqlClient
Imports Microsoft.Reporting.WebForms
Imports CrystalDecisions.CrystalReports.Engine
Imports System.Globalization
Imports System.Text
Imports System.Net
Imports Microsoft.VisualBasic

Public Class _Default
    Inherits System.Web.UI.Page
    'Dim db As New DB_EaglesInternalE01
    'Dim db As New DB_EaglesIntemalEntities_test
    Dim db As New DB_EaglesInternalEntities
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtBookingBy.Text = Session("Name_thai").ToString
            show_Customer()
        End If
    End Sub
    Private Sub saveCustomer()
        Try
            db.tblBookingMessengers.Add(New tblBookingMessenger() With { _
                        .BookingDate = DateTime.ParseExact(txtBookingDate.Text, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US")), _
                        .BookingTime = txtBookingTime.Text, _
                        .CusTel = txtCusTel.Text.Trim, _
                        .ContactPerson = txtContactPerson.Text.Trim, _
                        .CustomerName = txtCustomerName.Text.Trim, _
                        .Location = txtLocation.Text.Trim, _
                        .JobType1 = IIf(chkJobType1.Checked = True, "วางบิล", "").ToString, _
                        .JobType2 = IIf(chkJobType2.Checked = True, "รับเช็ค", "").ToString, _
                        .JobType3 = IIf(chkJobType3.Checked = True, "รับ/ส่ง เอกสาร", "").ToString, _
                        .JobType4 = IIf(chkJobType4.Checked = True, "อื่นๆ", "").ToString, _
                        .JobDesc = txtJobDesc.Text.Trim, _
                        .ReceiveComback = txtReceiveComback.Text.Trim, _
                        .BookingBy = txtBookingBy.Text.Trim, _
                        .Branch = ddlBranch.Text, _
                        .ReceiveBy = txtReceiveby.Text.Trim, _
                        .Messenger = "", _
                        .Status = "", _
                        .Remark = "", _
                        .CreateBy = Session("Name_eng").ToString.ToUpper, _
                        .CreateDate = Now _
                   })
            db.SaveChanges()
            'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('บันทึกข้อมูล เรียบร้อยแล้วครับ');", True)

            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirect", "alert('บันทึกข้อมูล เรียบร้อยแล้วครับ')", True)
            clearText()
            ' Response.Redirect("~/Default.aspx")
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub btnConfirm_Click(sender As Object, e As EventArgs)
        Dim cu = (From cn In db.tblCustomerLists Where cn.CustomerName = txtCustomerName.Text.Trim Select cn).FirstOrDefault
        If Not cu Is Nothing Then
            saveCustomer()
        Else
            Select Case MsgBox("คุณต้องการเก็บข้อมูลบริษัทผู้ติดต่อ หรือไม่ ?", MsgBoxStyle.YesNo, "บันทึกข้อมูล")
                Case MsgBoxResult.Yes
                    db.tblCustomerLists.Add(New tblCustomerList With { _
                                       .CustomerName = txtCustomerName.Text.Trim, _
                                       .Location = txtLocation.Text.Trim, _
                                       .CustomerTel = txtCusTel.Text.Trim, _
                                       .ContactPerson = txtContactPerson.Text.Trim, _
                                       .CreateBy = Session("Name_eng").ToString.ToUpper, _
                                       .CreateDate = Now
                                        })

                    db.SaveChanges()
                    saveCustomer()
                Case MsgBoxResult.No
                    saveCustomer()

            End Select
        End If

    End Sub

    Private Sub show_Customer()
        Dim dt As Date = DateTime.ParseExact("25/07/2018", "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US"))
        Try
            Dim cu = (From cn In db.tblCustomerLists
                Select cn.CustomerName, cn.ContactPerson, cn.CustomerTel).ToList

            If cu.Count > 0 Then
                showCustomer.DataSource = cu
                showCustomer.DataBind()
            Else
                showCustomer.DataSource = Nothing
                showCustomer.DataBind()
            End If

        Catch ex As Exception

        End Try
    End Sub



    Protected Sub showCustomer_ItemDataBound(sender As Object, e As RepeaterItemEventArgs)
        If e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem Then

            'Dim lblRecno As Label = DirectCast(e.Item.FindControl("lblRecno"), Label)
            '   If Not IsNothing(lblRecno) Then
            '       lblRecno.Text = DataBinder.Eval(e.Item.DataItem, "Recno").ToString()
            '   End If
            Dim lblCustomerName As Label = DirectCast(e.Item.FindControl("lblCustomerName"), Label)
            If Not IsNothing(lblCustomerName) Then
                lblCustomerName.Text = DataBinder.Eval(e.Item.DataItem, "CustomerName").ToString()
            End If

            Dim lblContactPerson As Label = DirectCast(e.Item.FindControl("lblContactPerson"), Label)
            If Not IsNothing(lblContactPerson) Then
                lblContactPerson.Text = DataBinder.Eval(e.Item.DataItem, "ContactPerson").ToString()
            End If
            Dim lblCusTel As Label = DirectCast(e.Item.FindControl("lblCusTel"), Label)
            If Not IsNothing(lblCusTel) Then
                lblCusTel.Text = DataBinder.Eval(e.Item.DataItem, "CustomerTel").ToString()
            End If
        End If
    End Sub

    Protected Sub lnkSearch_Click(sender As Object, e As EventArgs)

        Dim item As RepeaterItem = TryCast(TryCast(sender, LinkButton).Parent, RepeaterItem)
        Dim Customer As String = TryCast(item.FindControl("lblCustomerName"), Label).Text.Trim
        'Dim BookingDate As String = TryCast(item.FindControl("lblBookingDate"), Label).Text.Trim
        'Dim index As Integer = CInt(TryCast(item.FindControl("lblRecno"), Label).Text.Trim)

        Dim ds = (From c In db.tblCustomerLists Where c.CustomerName = Customer).SingleOrDefault
        'Dim UserID As String = Session("UserID").ToString
        'Dim UserID As String = "e.1250".ToUpper

        txtCusTel.Text = ds.CustomerTel
        txtContactPerson.Text = ds.ContactPerson
        txtCustomerName.Text = ds.CustomerName
        txtLocation.Text = ds.Location

    End Sub

    Protected Sub Unnamed_ServerClick(sender As Object, e As EventArgs)

        Try
            Dim cu = (From cn In db.tblCustomerLists Where cn.CustomerName = txtGo.Value.Trim
                Select cn).FirstOrDefault

            If cu Is Nothing Then
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('ไม่พบข้อมูล User ที่ค้นหา')", True)
            Else
                txtCusTel.Text = cu.CustomerTel
                txtContactPerson.Text = cu.ContactPerson
                txtCustomerName.Text = cu.CustomerName
                txtLocation.Text = cu.Location
            End If

        Catch ex As Exception

        End Try
    End Sub
    Private Sub clearText()
        'txtBookingBy.Text = ""
        txtBookingDate.Text = ""
        txtBookingTime.Text = ""
        txtContactPerson.Text = ""
        txtCusTel.Text = ""
        txtCustomerName.Text = ""
        txtJobDesc.Text = ""
        txtLocation.Text = ""
        txtReceiveby.Text = ""
        txtReceiveComback.Text = ""

    End Sub
End Class