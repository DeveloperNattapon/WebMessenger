Option Strict On
Option Explicit On

Imports System.Data
Imports System.Globalization
Imports System.Text
Imports System.Linq
Imports System.IO
Imports Microsoft.VisualBasic


Public Class EditDistance
    Inherits System.Web.UI.Page
    'Dim db As New DB_EaglesInternalE01
    'Dim db As New DB_EaglesIntemalEntities_test
    Dim db As New DB_EaglesInternalEntities

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            showEdit()
        End If
    End Sub

    Protected Sub btnEdit_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub showEdit()
        Dim dateMess As Date = CDate(Request.QueryString("Date"))

        Dim name As String = Session("Prefix_thai").ToString + " " + Session("Name_thai").ToString + " " + Session("Surname_thai").ToString
        Try
            Dim ds = (From c In db.tblMessenger Where c.MessDate = dateMess And c.Name = name).FirstOrDefault
            'Dim dateM As Date = DateTime.ParseExact(CStr(ds.MessDate), "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US"))
            If String.IsNullOrEmpty(CStr(ds.MessDate)) Then
                MsgBox("เป็นค่าวว่าง")
            End If
            txtMessDate.Text = CStr(ds.MessDate)
            lblName.Text = ds.Name
            txtTimeOut.Text = ds.TimeOut
            txtMileOut.Text = CStr(ds.MileOut)
            txtTimeIn.Text = ds.TimeIn
            txtMileIn.Text = CStr(ds.MileIn)
        Catch ex As Exception
            MsgBox("Error", MsgBoxStyle.Critical)
        End Try


    End Sub

End Class