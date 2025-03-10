Option Strict Off
Option Explicit On
Module Module1
    Structure SYSTEMTIME
        Dim wYear As Long
        Dim wMonth As Long
        Dim wDayOfWeek As Long
        Dim wDay As Long
        Dim wHour As Long
        Dim wMinute As Long
        Dim wSecond As Long
        Dim wMilliseconds As Long
    End Structure

    Public Declare Function WLGenLicenseTextKey Lib "WinlicenseSDK.dll" (ByVal LicenseHash As String, ByVal UserName As String, ByVal Organization As String, ByVal CustomData As String, ByVal MachineID As String, ByVal NumDays As Short, ByVal NumExec As Short, ByRef NewDate As Integer, ByVal CountryId As Short, ByVal Runtime As Short, ByVal GlobalMinutes As Short, ByVal BufferOut As String) As Short
    Public Declare Function WLGenLicenseTextKey Lib "WinlicenseSDK.dll" (ByVal LicenseHash As String, ByVal UserName As String, ByVal Organization As String, ByVal CustomData As String, ByVal MachineID As String, ByVal NumDays As Short, ByVal NumExec As Short, ByRef NewDate As SYSTEMTIME, ByVal CountryId As Short, ByVal Runtime As Short, ByVal GlobalMinutes As Short, ByVal BufferOut As String) As Short

    Public Declare Function WLGenLicenseSmartKey Lib "WinlicenseSDK.dll" (ByVal LicenseHash As String, ByVal UserName As String, ByVal Organization As String, ByVal CustomData As String, ByVal MachineID As String, ByVal NumDays As Short, ByVal NumExec As Short, ByRef NewDate As Integer, ByVal BufferOut As String) As Short
    Public Declare Function WLGenLicenseSmartKey Lib "WinlicenseSDK.dll" (ByVal LicenseHash As String, ByVal UserName As String, ByVal Organization As String, ByVal CustomData As String, ByVal MachineID As String, ByVal NumDays As Short, ByVal NumExec As Short, ByRef NewDate As SYSTEMTIME, ByVal BufferOut As String) As Short

    Public Declare Function WLGenLicenseFileKey Lib "WinlicenseSDK.dll" (ByVal LicenseHash As String, ByVal UserName As String, ByVal Organization As String, ByVal CustomData As String, ByVal MachineID As String, ByVal NumDays As Short, ByVal NumExec As Short, ByRef NewDate As Integer, ByVal CountryId As Short, ByVal Runtime As Short, ByVal GlobalMinutes As Short, ByVal BufferOut As String) As Short
    Public Declare Function WLGenLicenseFileKey Lib "WinlicenseSDK.dll" (ByVal LicenseHash As String, ByVal UserName As String, ByVal Organization As String, ByVal CustomData As String, ByVal MachineID As String, ByVal NumDays As Short, ByVal NumExec As Short, ByRef NewDate As SYSTEMTIME, ByVal CountryId As Short, ByVal Runtime As Short, ByVal GlobalMinutes As Short, ByVal BufferOut As String) As Short


    Public GlobalBuffer As New VB6.FixedLengthString(4000)
End Module