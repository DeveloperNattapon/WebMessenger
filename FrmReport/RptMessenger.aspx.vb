Option Strict On
Option Explicit On

Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Imports CrystalDecisions.Web
Imports CrystalDecisions.ReportSource
Imports CrystalDecisions.CrystalReports
Imports System.Linq
Imports Microsoft.Reporting.WebForms
Imports System.Net
Imports System.Globalization



Public Class RptMessenger
    Inherits System.Web.UI.Page
    Private rpt As ReportDocument

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim bookingTime As String

        If Not IsPostBack Then

            Dim index As Integer = CInt(Request.QueryString("recno"))
            Using db = New DB_EaglesInternalEntities
           
                Dim results = (From c In db.tblBookingMessengers
                      Where c.RecNo = index
                      Select New With {
                            c.RecNo,
                            c.BookingTime,
                            c.CusTel,
                            c.ContactPerson,
                            c.CustomerName,
                            c.Location,
                            c.JobType1,
                            c.JobType2,
                            c.JobType3,
                            c.JobType4,
                            c.JobDesc,
                            c.ReceiveComback,
                            c.BookingBy,
                            c.Branch,
                            c.Messenger,
                            c.Status,
                            c.Remark,
                            c.ReceiveBy
                            }).ToList()

                'If Not results Is Nothing Then
                '    MsgBox("1")
                'Else
                '    MsgBox("2")
                'End If

                Dim rpt As New ReportDocument()

                'Dim fileName As String = System.IO.Path.GetTempPath() + Guid.NewGuid().ToString() + ".pdf"
                'rpt.Load("D:\DevelopmentProjet/WebMessenger/WebMessenger/Report/crMessenger.rpt")

                rpt.Load(Server.MapPath("../Report/crMessenger.rpt"))
                rpt.SetDataSource(results)

                CrystalReportViewer1.ReportSource = rpt
                CrystalReportViewer1 = Nothing
                CType(rpt, ReportDocument).ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("../PDF/" + CStr(index) + ".pdf"))

              
                'Response.Redirect(Server.MapPath("../PDF/" + CStr(index) + ".pdf"))

                Dim path As String = Server.MapPath("../PDF/" + CStr(Request.QueryString("recno")) + ".pdf")
                Dim client As New WebClient()
                Dim buffer As [Byte]() = client.DownloadData(path)

                If buffer IsNot Nothing Then
                    Response.ContentType = "application/pdf"
                    Response.AddHeader("content-length", buffer.Length.ToString())
                    Response.BinaryWrite(buffer)
                    Response.End()
                End If
            End Using

        End If
    End Sub

    Protected Sub CrystalReportViewer1_Unload(sender As Object, e As EventArgs) Handles CrystalReportViewer1.Unload
        rpt.Close()
        rpt.Dispose()
        GC.Collect()
    End Sub

    Private Function Nullable(Of T)(nullable1 As Date?) As Object
        Throw New NotImplementedException
    End Function

End Class