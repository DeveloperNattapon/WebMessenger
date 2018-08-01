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

Public Class TestCode
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub



    Protected Sub btnSave_Click(sender As Object, e As EventArgs)

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "EditModalScript", "myModal1();", True)
    End Sub

    Protected Sub OnConfirm(sender As Object, e As EventArgs)
        Select Case MsgBox("Are you sure ?", MsgBoxStyle.YesNo, "Delete")
            Case MsgBoxResult.Yes
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('You clicked YES!')", True)
            Case MsgBoxResult.No
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('You clicked NO!')", True)
        End Select

        'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "confirm", "confirm('คุณต้องการเก็บข้อมูลบริษัทผู้ติดต่อ หรือไม่ ?');", True)
        'Dim confirmValue As String = Request.Form("confirm")

        'If confirmValue = "Yes" Then
        '    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('You clicked YES!')", True)

        'Else

        '    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('You clicked NO!')", True)
        'End If

    End Sub
End Class