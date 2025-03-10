Option Strict Off
Option Explicit On
Friend Class Form1
	Inherits System.Windows.Forms.Form
#Region "Windows Form Designer generated code "
	Public Sub New()
		MyBase.New()
		If m_vb6FormDefInstance Is Nothing Then
			If m_InitializingDefInstance Then
				m_vb6FormDefInstance = Me
			Else
				Try 
					'For the start-up form, the first instance created is the default instance.
					If System.Reflection.Assembly.GetExecutingAssembly.EntryPoint.DeclaringType Is Me.GetType Then
						m_vb6FormDefInstance = Me
					End If
				Catch
				End Try
			End If
		End If
		'This call is required by the Windows Form Designer.
		InitializeComponent()
	End Sub
	'Form overrides dispose to clean up the component list.
	Protected Overloads Overrides Sub Dispose(ByVal Disposing As Boolean)
		If Disposing Then
			If Not components Is Nothing Then
				components.Dispose()
			End If
		End If
		MyBase.Dispose(Disposing)
	End Sub
	'Required by the Windows Form Designer
	Private components As System.ComponentModel.IContainer
	Public ToolTip1 As System.Windows.Forms.ToolTip
	Public WithEvents SmartKeyEdit As System.Windows.Forms.TextBox
	Public WithEvents GenerateSmartButton As System.Windows.Forms.Button
	Public WithEvents Frame7 As System.Windows.Forms.GroupBox
	Public WithEvents GenerateRegButton As System.Windows.Forms.Button
	Public WithEvents RegNameEdit As System.Windows.Forms.TextBox
	Public WithEvents KeyValueNameEdit As System.Windows.Forms.TextBox
	Public WithEvents KeyNameEdit As System.Windows.Forms.TextBox
	Public WithEvents Text9 As System.Windows.Forms.TextBox
	Public WithEvents Label10 As System.Windows.Forms.Label
	Public WithEvents Label9 As System.Windows.Forms.Label
	Public WithEvents Label8 As System.Windows.Forms.Label
	Public WithEvents Frame6 As System.Windows.Forms.GroupBox
	Public WithEvents TextKeyEdit As System.Windows.Forms.TextBox
	Public WithEvents GenerateTextButton As System.Windows.Forms.Button
	Public WithEvents Frame5 As System.Windows.Forms.GroupBox
	Public WithEvents GenerateFileButton As System.Windows.Forms.Button
	Public WithEvents FileNameEdit As System.Windows.Forms.TextBox
	Public WithEvents Label7 As System.Windows.Forms.Label
	Public WithEvents Frame4 As System.Windows.Forms.GroupBox
	Public WithEvents Frame3 As System.Windows.Forms.GroupBox
	Public WithEvents MaxExecEdit As System.Windows.Forms.TextBox
	Public WithEvents NumDaysEdit As System.Windows.Forms.TextBox
	Public WithEvents Label6 As System.Windows.Forms.Label
	Public WithEvents Label5 As System.Windows.Forms.Label
	Public WithEvents Frame2 As System.Windows.Forms.GroupBox
	Public WithEvents CustomName As System.Windows.Forms.TextBox
	Public WithEvents HardIdName As System.Windows.Forms.TextBox
	Public WithEvents CompanyName_Renamed As System.Windows.Forms.TextBox
	Public WithEvents NameEdit As System.Windows.Forms.TextBox
	Public WithEvents Label4 As System.Windows.Forms.Label
	Public WithEvents Label3 As System.Windows.Forms.Label
	Public WithEvents Label2 As System.Windows.Forms.Label
	Public WithEvents Label1 As System.Windows.Forms.Label
	Public WithEvents Frame1 As System.Windows.Forms.GroupBox
	'NOTE: The following procedure is required by the Windows Form Designer
	'It can be modified using the Windows Form Designer.
	'Do not modify it using the code editor.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
		Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(Form1))
		Me.components = New System.ComponentModel.Container()
		Me.ToolTip1 = New System.Windows.Forms.ToolTip(components)
		Me.ToolTip1.Active = True
		Me.Frame3 = New System.Windows.Forms.GroupBox
		Me.Frame7 = New System.Windows.Forms.GroupBox
		Me.SmartKeyEdit = New System.Windows.Forms.TextBox
		Me.GenerateSmartButton = New System.Windows.Forms.Button
		Me.Frame6 = New System.Windows.Forms.GroupBox
		Me.GenerateRegButton = New System.Windows.Forms.Button
		Me.RegNameEdit = New System.Windows.Forms.TextBox
		Me.KeyValueNameEdit = New System.Windows.Forms.TextBox
		Me.KeyNameEdit = New System.Windows.Forms.TextBox
		Me.Text9 = New System.Windows.Forms.TextBox
		Me.Label10 = New System.Windows.Forms.Label
		Me.Label9 = New System.Windows.Forms.Label
		Me.Label8 = New System.Windows.Forms.Label
		Me.Frame5 = New System.Windows.Forms.GroupBox
		Me.TextKeyEdit = New System.Windows.Forms.TextBox
		Me.GenerateTextButton = New System.Windows.Forms.Button
		Me.Frame4 = New System.Windows.Forms.GroupBox
		Me.GenerateFileButton = New System.Windows.Forms.Button
		Me.FileNameEdit = New System.Windows.Forms.TextBox
		Me.Label7 = New System.Windows.Forms.Label
		Me.Frame2 = New System.Windows.Forms.GroupBox
		Me.MaxExecEdit = New System.Windows.Forms.TextBox
		Me.NumDaysEdit = New System.Windows.Forms.TextBox
		Me.Label6 = New System.Windows.Forms.Label
		Me.Label5 = New System.Windows.Forms.Label
		Me.Frame1 = New System.Windows.Forms.GroupBox
		Me.CustomName = New System.Windows.Forms.TextBox
		Me.HardIdName = New System.Windows.Forms.TextBox
		Me.CompanyName_Renamed = New System.Windows.Forms.TextBox
		Me.NameEdit = New System.Windows.Forms.TextBox
		Me.Label4 = New System.Windows.Forms.Label
		Me.Label3 = New System.Windows.Forms.Label
		Me.Label2 = New System.Windows.Forms.Label
		Me.Label1 = New System.Windows.Forms.Label
		Me.Text = "License Key Generator SDK"
		Me.ClientSize = New System.Drawing.Size(514, 600)
		Me.Location = New System.Drawing.Point(4, 23)
		Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
		Me.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
		Me.BackColor = System.Drawing.SystemColors.Control
		Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Sizable
		Me.ControlBox = True
		Me.Enabled = True
		Me.KeyPreview = False
		Me.MaximizeBox = True
		Me.MinimizeBox = True
		Me.Cursor = System.Windows.Forms.Cursors.Default
		Me.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.ShowInTaskbar = True
		Me.HelpButton = False
		Me.WindowState = System.Windows.Forms.FormWindowState.Normal
		Me.Name = "Form1"
		Me.Frame3.Text = "Type Generated Key"
		Me.Frame3.Size = New System.Drawing.Size(441, 281)
		Me.Frame3.Location = New System.Drawing.Point(32, 296)
		Me.Frame3.TabIndex = 14
		Me.Frame3.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Frame3.BackColor = System.Drawing.SystemColors.Control
		Me.Frame3.Enabled = True
		Me.Frame3.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Frame3.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Frame3.Visible = True
		Me.Frame3.Name = "Frame3"
		Me.Frame7.Text = "SmartActivate Key"
		Me.Frame7.Size = New System.Drawing.Size(193, 73)
		Me.Frame7.Location = New System.Drawing.Point(216, 192)
		Me.Frame7.TabIndex = 31
		Me.Frame7.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Frame7.BackColor = System.Drawing.SystemColors.Control
		Me.Frame7.Enabled = True
		Me.Frame7.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Frame7.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Frame7.Visible = True
		Me.Frame7.Name = "Frame7"
		Me.SmartKeyEdit.AutoSize = False
		Me.SmartKeyEdit.Size = New System.Drawing.Size(177, 19)
		Me.SmartKeyEdit.Location = New System.Drawing.Point(8, 48)
		Me.SmartKeyEdit.TabIndex = 33
		Me.SmartKeyEdit.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.SmartKeyEdit.AcceptsReturn = True
		Me.SmartKeyEdit.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.SmartKeyEdit.BackColor = System.Drawing.SystemColors.Window
		Me.SmartKeyEdit.CausesValidation = True
		Me.SmartKeyEdit.Enabled = True
		Me.SmartKeyEdit.ForeColor = System.Drawing.SystemColors.WindowText
		Me.SmartKeyEdit.HideSelection = True
		Me.SmartKeyEdit.ReadOnly = False
		Me.SmartKeyEdit.Maxlength = 0
		Me.SmartKeyEdit.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.SmartKeyEdit.MultiLine = False
		Me.SmartKeyEdit.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.SmartKeyEdit.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.SmartKeyEdit.TabStop = True
		Me.SmartKeyEdit.Visible = True
		Me.SmartKeyEdit.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.SmartKeyEdit.Name = "SmartKeyEdit"
		Me.GenerateSmartButton.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.GenerateSmartButton.Text = "Generate Smart Key"
		Me.GenerateSmartButton.Size = New System.Drawing.Size(121, 17)
		Me.GenerateSmartButton.Location = New System.Drawing.Point(32, 24)
		Me.GenerateSmartButton.TabIndex = 32
		Me.GenerateSmartButton.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.GenerateSmartButton.BackColor = System.Drawing.SystemColors.Control
		Me.GenerateSmartButton.CausesValidation = True
		Me.GenerateSmartButton.Enabled = True
		Me.GenerateSmartButton.ForeColor = System.Drawing.SystemColors.ControlText
		Me.GenerateSmartButton.Cursor = System.Windows.Forms.Cursors.Default
		Me.GenerateSmartButton.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.GenerateSmartButton.TabStop = True
		Me.GenerateSmartButton.Name = "GenerateSmartButton"
		Me.Frame6.Text = "Registry Key"
		Me.Frame6.Size = New System.Drawing.Size(193, 153)
		Me.Frame6.Location = New System.Drawing.Point(216, 31)
		Me.Frame6.TabIndex = 22
		Me.Frame6.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Frame6.BackColor = System.Drawing.SystemColors.Control
		Me.Frame6.Enabled = True
		Me.Frame6.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Frame6.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Frame6.Visible = True
		Me.Frame6.Name = "Frame6"
		Me.GenerateRegButton.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.GenerateRegButton.Text = "Generate Reg Key File"
		Me.GenerateRegButton.Size = New System.Drawing.Size(121, 21)
		Me.GenerateRegButton.Location = New System.Drawing.Point(40, 120)
		Me.GenerateRegButton.TabIndex = 30
		Me.GenerateRegButton.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.GenerateRegButton.BackColor = System.Drawing.SystemColors.Control
		Me.GenerateRegButton.CausesValidation = True
		Me.GenerateRegButton.Enabled = True
		Me.GenerateRegButton.ForeColor = System.Drawing.SystemColors.ControlText
		Me.GenerateRegButton.Cursor = System.Windows.Forms.Cursors.Default
		Me.GenerateRegButton.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.GenerateRegButton.TabStop = True
		Me.GenerateRegButton.Name = "GenerateRegButton"
		Me.RegNameEdit.AutoSize = False
		Me.RegNameEdit.Size = New System.Drawing.Size(89, 19)
		Me.RegNameEdit.Location = New System.Drawing.Point(96, 80)
		Me.RegNameEdit.TabIndex = 29
		Me.RegNameEdit.Text = "License.reg"
		Me.RegNameEdit.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.RegNameEdit.AcceptsReturn = True
		Me.RegNameEdit.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.RegNameEdit.BackColor = System.Drawing.SystemColors.Window
		Me.RegNameEdit.CausesValidation = True
		Me.RegNameEdit.Enabled = True
		Me.RegNameEdit.ForeColor = System.Drawing.SystemColors.WindowText
		Me.RegNameEdit.HideSelection = True
		Me.RegNameEdit.ReadOnly = False
		Me.RegNameEdit.Maxlength = 0
		Me.RegNameEdit.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.RegNameEdit.MultiLine = False
		Me.RegNameEdit.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.RegNameEdit.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.RegNameEdit.TabStop = True
		Me.RegNameEdit.Visible = True
		Me.RegNameEdit.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.RegNameEdit.Name = "RegNameEdit"
		Me.KeyValueNameEdit.AutoSize = False
		Me.KeyValueNameEdit.Size = New System.Drawing.Size(81, 19)
		Me.KeyValueNameEdit.Location = New System.Drawing.Point(104, 56)
		Me.KeyValueNameEdit.TabIndex = 27
		Me.KeyValueNameEdit.Text = "reg_value"
		Me.KeyValueNameEdit.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.KeyValueNameEdit.AcceptsReturn = True
		Me.KeyValueNameEdit.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.KeyValueNameEdit.BackColor = System.Drawing.SystemColors.Window
		Me.KeyValueNameEdit.CausesValidation = True
		Me.KeyValueNameEdit.Enabled = True
		Me.KeyValueNameEdit.ForeColor = System.Drawing.SystemColors.WindowText
		Me.KeyValueNameEdit.HideSelection = True
		Me.KeyValueNameEdit.ReadOnly = False
		Me.KeyValueNameEdit.Maxlength = 0
		Me.KeyValueNameEdit.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.KeyValueNameEdit.MultiLine = False
		Me.KeyValueNameEdit.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.KeyValueNameEdit.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.KeyValueNameEdit.TabStop = True
		Me.KeyValueNameEdit.Visible = True
		Me.KeyValueNameEdit.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.KeyValueNameEdit.Name = "KeyValueNameEdit"
		Me.KeyNameEdit.AutoSize = False
		Me.KeyNameEdit.Size = New System.Drawing.Size(72, 20)
		Me.KeyNameEdit.Location = New System.Drawing.Point(111, 24)
		Me.KeyNameEdit.TabIndex = 25
		Me.KeyNameEdit.Text = "/Software/MyApp"
		Me.KeyNameEdit.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.KeyNameEdit.AcceptsReturn = True
		Me.KeyNameEdit.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.KeyNameEdit.BackColor = System.Drawing.SystemColors.Window
		Me.KeyNameEdit.CausesValidation = True
		Me.KeyNameEdit.Enabled = True
		Me.KeyNameEdit.ForeColor = System.Drawing.SystemColors.WindowText
		Me.KeyNameEdit.HideSelection = True
		Me.KeyNameEdit.ReadOnly = False
		Me.KeyNameEdit.Maxlength = 0
		Me.KeyNameEdit.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.KeyNameEdit.MultiLine = False
		Me.KeyNameEdit.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.KeyNameEdit.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.KeyNameEdit.TabStop = True
		Me.KeyNameEdit.Visible = True
		Me.KeyNameEdit.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.KeyNameEdit.Name = "KeyNameEdit"
		Me.Text9.AutoSize = False
		Me.Text9.Enabled = False
		Me.Text9.Size = New System.Drawing.Size(39, 20)
		Me.Text9.Location = New System.Drawing.Point(72, 24)
		Me.Text9.TabIndex = 24
		Me.Text9.Text = "HKLM"
		Me.Text9.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Text9.AcceptsReturn = True
		Me.Text9.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.Text9.BackColor = System.Drawing.SystemColors.Window
		Me.Text9.CausesValidation = True
		Me.Text9.ForeColor = System.Drawing.SystemColors.WindowText
		Me.Text9.HideSelection = True
		Me.Text9.ReadOnly = False
		Me.Text9.Maxlength = 0
		Me.Text9.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.Text9.MultiLine = False
		Me.Text9.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Text9.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.Text9.TabStop = True
		Me.Text9.Visible = True
		Me.Text9.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.Text9.Name = "Text9"
		Me.Label10.Text = "File name (*.reg)"
		Me.Label10.Size = New System.Drawing.Size(81, 17)
		Me.Label10.Location = New System.Drawing.Point(16, 88)
		Me.Label10.TabIndex = 28
		Me.Label10.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label10.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.Label10.BackColor = System.Drawing.SystemColors.Control
		Me.Label10.Enabled = True
		Me.Label10.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label10.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label10.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label10.UseMnemonic = True
		Me.Label10.Visible = True
		Me.Label10.AutoSize = False
		Me.Label10.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label10.Name = "Label10"
		Me.Label9.Text = "Key Value Name:"
		Me.Label9.Size = New System.Drawing.Size(89, 17)
		Me.Label9.Location = New System.Drawing.Point(16, 56)
		Me.Label9.TabIndex = 26
		Me.Label9.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label9.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.Label9.BackColor = System.Drawing.SystemColors.Control
		Me.Label9.Enabled = True
		Me.Label9.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label9.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label9.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label9.UseMnemonic = True
		Me.Label9.Visible = True
		Me.Label9.AutoSize = False
		Me.Label9.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label9.Name = "Label9"
		Me.Label8.Text = "KeyName:"
		Me.Label8.Size = New System.Drawing.Size(49, 17)
		Me.Label8.Location = New System.Drawing.Point(16, 32)
		Me.Label8.TabIndex = 23
		Me.Label8.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label8.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.Label8.BackColor = System.Drawing.SystemColors.Control
		Me.Label8.Enabled = True
		Me.Label8.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label8.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label8.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label8.UseMnemonic = True
		Me.Label8.Visible = True
		Me.Label8.AutoSize = False
		Me.Label8.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label8.Name = "Label8"
		Me.Frame5.Text = "Text Key"
		Me.Frame5.Size = New System.Drawing.Size(177, 129)
		Me.Frame5.Location = New System.Drawing.Point(24, 136)
		Me.Frame5.TabIndex = 19
		Me.Frame5.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Frame5.BackColor = System.Drawing.SystemColors.Control
		Me.Frame5.Enabled = True
		Me.Frame5.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Frame5.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Frame5.Visible = True
		Me.Frame5.Name = "Frame5"
		Me.TextKeyEdit.AutoSize = False
		Me.TextKeyEdit.Size = New System.Drawing.Size(129, 73)
		Me.TextKeyEdit.Location = New System.Drawing.Point(24, 48)
		Me.TextKeyEdit.MultiLine = True
		Me.TextKeyEdit.ScrollBars = System.Windows.Forms.ScrollBars.Vertical
		Me.TextKeyEdit.TabIndex = 21
		Me.TextKeyEdit.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.TextKeyEdit.AcceptsReturn = True
		Me.TextKeyEdit.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.TextKeyEdit.BackColor = System.Drawing.SystemColors.Window
		Me.TextKeyEdit.CausesValidation = True
		Me.TextKeyEdit.Enabled = True
		Me.TextKeyEdit.ForeColor = System.Drawing.SystemColors.WindowText
		Me.TextKeyEdit.HideSelection = True
		Me.TextKeyEdit.ReadOnly = False
		Me.TextKeyEdit.Maxlength = 0
		Me.TextKeyEdit.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.TextKeyEdit.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.TextKeyEdit.TabStop = True
		Me.TextKeyEdit.Visible = True
		Me.TextKeyEdit.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.TextKeyEdit.Name = "TextKeyEdit"
		Me.GenerateTextButton.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.GenerateTextButton.Text = "Generate Text Key"
		Me.GenerateTextButton.Size = New System.Drawing.Size(113, 17)
		Me.GenerateTextButton.Location = New System.Drawing.Point(32, 24)
		Me.GenerateTextButton.TabIndex = 20
		Me.GenerateTextButton.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.GenerateTextButton.BackColor = System.Drawing.SystemColors.Control
		Me.GenerateTextButton.CausesValidation = True
		Me.GenerateTextButton.Enabled = True
		Me.GenerateTextButton.ForeColor = System.Drawing.SystemColors.ControlText
		Me.GenerateTextButton.Cursor = System.Windows.Forms.Cursors.Default
		Me.GenerateTextButton.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.GenerateTextButton.TabStop = True
		Me.GenerateTextButton.Name = "GenerateTextButton"
		Me.Frame4.Text = "File Key"
		Me.Frame4.Size = New System.Drawing.Size(177, 89)
		Me.Frame4.Location = New System.Drawing.Point(24, 32)
		Me.Frame4.TabIndex = 15
		Me.Frame4.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Frame4.BackColor = System.Drawing.SystemColors.Control
		Me.Frame4.Enabled = True
		Me.Frame4.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Frame4.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Frame4.Visible = True
		Me.Frame4.Name = "Frame4"
		Me.GenerateFileButton.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.GenerateFileButton.Text = "Generate File Key"
		Me.GenerateFileButton.Size = New System.Drawing.Size(113, 17)
		Me.GenerateFileButton.Location = New System.Drawing.Point(32, 56)
		Me.GenerateFileButton.TabIndex = 18
		Me.GenerateFileButton.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.GenerateFileButton.BackColor = System.Drawing.SystemColors.Control
		Me.GenerateFileButton.CausesValidation = True
		Me.GenerateFileButton.Enabled = True
		Me.GenerateFileButton.ForeColor = System.Drawing.SystemColors.ControlText
		Me.GenerateFileButton.Cursor = System.Windows.Forms.Cursors.Default
		Me.GenerateFileButton.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.GenerateFileButton.TabStop = True
		Me.GenerateFileButton.Name = "GenerateFileButton"
		Me.FileNameEdit.AutoSize = False
		Me.FileNameEdit.Size = New System.Drawing.Size(97, 19)
		Me.FileNameEdit.Location = New System.Drawing.Point(72, 16)
		Me.FileNameEdit.TabIndex = 17
		Me.FileNameEdit.Text = "License.dat"
		Me.FileNameEdit.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.FileNameEdit.AcceptsReturn = True
		Me.FileNameEdit.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.FileNameEdit.BackColor = System.Drawing.SystemColors.Window
		Me.FileNameEdit.CausesValidation = True
		Me.FileNameEdit.Enabled = True
		Me.FileNameEdit.ForeColor = System.Drawing.SystemColors.WindowText
		Me.FileNameEdit.HideSelection = True
		Me.FileNameEdit.ReadOnly = False
		Me.FileNameEdit.Maxlength = 0
		Me.FileNameEdit.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.FileNameEdit.MultiLine = False
		Me.FileNameEdit.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.FileNameEdit.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.FileNameEdit.TabStop = True
		Me.FileNameEdit.Visible = True
		Me.FileNameEdit.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.FileNameEdit.Name = "FileNameEdit"
		Me.Label7.Text = "File Name:"
		Me.Label7.Size = New System.Drawing.Size(57, 17)
		Me.Label7.Location = New System.Drawing.Point(16, 24)
		Me.Label7.TabIndex = 16
		Me.Label7.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label7.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.Label7.BackColor = System.Drawing.SystemColors.Control
		Me.Label7.Enabled = True
		Me.Label7.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label7.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label7.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label7.UseMnemonic = True
		Me.Label7.Visible = True
		Me.Label7.AutoSize = False
		Me.Label7.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label7.Name = "Label7"
		Me.Frame2.Text = "Key Expiration Info"
		Me.Frame2.Size = New System.Drawing.Size(441, 81)
		Me.Frame2.Location = New System.Drawing.Point(32, 200)
		Me.Frame2.TabIndex = 9
		Me.Frame2.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Frame2.BackColor = System.Drawing.SystemColors.Control
		Me.Frame2.Enabled = True
		Me.Frame2.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Frame2.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Frame2.Visible = True
		Me.Frame2.Name = "Frame2"
		Me.MaxExecEdit.AutoSize = False
		Me.MaxExecEdit.Size = New System.Drawing.Size(97, 19)
		Me.MaxExecEdit.Location = New System.Drawing.Point(304, 24)
		Me.MaxExecEdit.TabIndex = 13
		Me.MaxExecEdit.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.MaxExecEdit.AcceptsReturn = True
		Me.MaxExecEdit.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.MaxExecEdit.BackColor = System.Drawing.SystemColors.Window
		Me.MaxExecEdit.CausesValidation = True
		Me.MaxExecEdit.Enabled = True
		Me.MaxExecEdit.ForeColor = System.Drawing.SystemColors.WindowText
		Me.MaxExecEdit.HideSelection = True
		Me.MaxExecEdit.ReadOnly = False
		Me.MaxExecEdit.Maxlength = 0
		Me.MaxExecEdit.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.MaxExecEdit.MultiLine = False
		Me.MaxExecEdit.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.MaxExecEdit.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.MaxExecEdit.TabStop = True
		Me.MaxExecEdit.Visible = True
		Me.MaxExecEdit.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.MaxExecEdit.Name = "MaxExecEdit"
		Me.NumDaysEdit.AutoSize = False
		Me.NumDaysEdit.Size = New System.Drawing.Size(97, 19)
		Me.NumDaysEdit.Location = New System.Drawing.Point(104, 24)
		Me.NumDaysEdit.TabIndex = 12
		Me.NumDaysEdit.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.NumDaysEdit.AcceptsReturn = True
		Me.NumDaysEdit.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.NumDaysEdit.BackColor = System.Drawing.SystemColors.Window
		Me.NumDaysEdit.CausesValidation = True
		Me.NumDaysEdit.Enabled = True
		Me.NumDaysEdit.ForeColor = System.Drawing.SystemColors.WindowText
		Me.NumDaysEdit.HideSelection = True
		Me.NumDaysEdit.ReadOnly = False
		Me.NumDaysEdit.Maxlength = 0
		Me.NumDaysEdit.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.NumDaysEdit.MultiLine = False
		Me.NumDaysEdit.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.NumDaysEdit.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.NumDaysEdit.TabStop = True
		Me.NumDaysEdit.Visible = True
		Me.NumDaysEdit.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.NumDaysEdit.Name = "NumDaysEdit"
		Me.Label6.Text = "Max. Executions:"
		Me.Label6.Size = New System.Drawing.Size(89, 17)
		Me.Label6.Location = New System.Drawing.Point(216, 32)
		Me.Label6.TabIndex = 11
		Me.Label6.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label6.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.Label6.BackColor = System.Drawing.SystemColors.Control
		Me.Label6.Enabled = True
		Me.Label6.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label6.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label6.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label6.UseMnemonic = True
		Me.Label6.Visible = True
		Me.Label6.AutoSize = False
		Me.Label6.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label6.Name = "Label6"
		Me.Label5.Text = "Number Days:"
		Me.Label5.Size = New System.Drawing.Size(73, 17)
		Me.Label5.Location = New System.Drawing.Point(24, 32)
		Me.Label5.TabIndex = 10
		Me.Label5.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label5.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.Label5.BackColor = System.Drawing.SystemColors.Control
		Me.Label5.Enabled = True
		Me.Label5.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label5.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label5.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label5.UseMnemonic = True
		Me.Label5.Visible = True
		Me.Label5.AutoSize = False
		Me.Label5.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label5.Name = "Label5"
		Me.Frame1.Text = "User's Information"
		Me.Frame1.Size = New System.Drawing.Size(441, 153)
		Me.Frame1.Location = New System.Drawing.Point(32, 32)
		Me.Frame1.TabIndex = 0
		Me.Frame1.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Frame1.BackColor = System.Drawing.SystemColors.Control
		Me.Frame1.Enabled = True
		Me.Frame1.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Frame1.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Frame1.Visible = True
		Me.Frame1.Name = "Frame1"
		Me.CustomName.AutoSize = False
		Me.CustomName.Size = New System.Drawing.Size(105, 89)
		Me.CustomName.Location = New System.Drawing.Point(312, 40)
		Me.CustomName.MultiLine = True
		Me.CustomName.TabIndex = 8
		Me.CustomName.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.CustomName.AcceptsReturn = True
		Me.CustomName.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.CustomName.BackColor = System.Drawing.SystemColors.Window
		Me.CustomName.CausesValidation = True
		Me.CustomName.Enabled = True
		Me.CustomName.ForeColor = System.Drawing.SystemColors.WindowText
		Me.CustomName.HideSelection = True
		Me.CustomName.ReadOnly = False
		Me.CustomName.Maxlength = 0
		Me.CustomName.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.CustomName.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.CustomName.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.CustomName.TabStop = True
		Me.CustomName.Visible = True
		Me.CustomName.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.CustomName.Name = "CustomName"
		Me.HardIdName.AutoSize = False
		Me.HardIdName.Size = New System.Drawing.Size(129, 19)
		Me.HardIdName.Location = New System.Drawing.Point(96, 104)
		Me.HardIdName.TabIndex = 7
		Me.HardIdName.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.HardIdName.AcceptsReturn = True
		Me.HardIdName.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.HardIdName.BackColor = System.Drawing.SystemColors.Window
		Me.HardIdName.CausesValidation = True
		Me.HardIdName.Enabled = True
		Me.HardIdName.ForeColor = System.Drawing.SystemColors.WindowText
		Me.HardIdName.HideSelection = True
		Me.HardIdName.ReadOnly = False
		Me.HardIdName.Maxlength = 0
		Me.HardIdName.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.HardIdName.MultiLine = False
		Me.HardIdName.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.HardIdName.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.HardIdName.TabStop = True
		Me.HardIdName.Visible = True
		Me.HardIdName.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.HardIdName.Name = "HardIdName"
		Me.CompanyName_Renamed.AutoSize = False
		Me.CompanyName_Renamed.Size = New System.Drawing.Size(129, 19)
		Me.CompanyName_Renamed.Location = New System.Drawing.Point(96, 72)
		Me.CompanyName_Renamed.TabIndex = 6
		Me.CompanyName_Renamed.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.CompanyName_Renamed.AcceptsReturn = True
		Me.CompanyName_Renamed.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.CompanyName_Renamed.BackColor = System.Drawing.SystemColors.Window
		Me.CompanyName_Renamed.CausesValidation = True
		Me.CompanyName_Renamed.Enabled = True
		Me.CompanyName_Renamed.ForeColor = System.Drawing.SystemColors.WindowText
		Me.CompanyName_Renamed.HideSelection = True
		Me.CompanyName_Renamed.ReadOnly = False
		Me.CompanyName_Renamed.Maxlength = 0
		Me.CompanyName_Renamed.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.CompanyName_Renamed.MultiLine = False
		Me.CompanyName_Renamed.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.CompanyName_Renamed.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.CompanyName_Renamed.TabStop = True
		Me.CompanyName_Renamed.Visible = True
		Me.CompanyName_Renamed.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.CompanyName_Renamed.Name = "CompanyName_Renamed"
		Me.NameEdit.AutoSize = False
		Me.NameEdit.Size = New System.Drawing.Size(129, 19)
		Me.NameEdit.Location = New System.Drawing.Point(96, 40)
		Me.NameEdit.TabIndex = 5
		Me.NameEdit.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.NameEdit.AcceptsReturn = True
		Me.NameEdit.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.NameEdit.BackColor = System.Drawing.SystemColors.Window
		Me.NameEdit.CausesValidation = True
		Me.NameEdit.Enabled = True
		Me.NameEdit.ForeColor = System.Drawing.SystemColors.WindowText
		Me.NameEdit.HideSelection = True
		Me.NameEdit.ReadOnly = False
		Me.NameEdit.Maxlength = 0
		Me.NameEdit.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.NameEdit.MultiLine = False
		Me.NameEdit.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.NameEdit.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.NameEdit.TabStop = True
		Me.NameEdit.Visible = True
		Me.NameEdit.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.NameEdit.Name = "NameEdit"
		Me.Label4.Text = "Custom Data:"
		Me.Label4.Size = New System.Drawing.Size(73, 17)
		Me.Label4.Location = New System.Drawing.Point(240, 40)
		Me.Label4.TabIndex = 4
		Me.Label4.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label4.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.Label4.BackColor = System.Drawing.SystemColors.Control
		Me.Label4.Enabled = True
		Me.Label4.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label4.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label4.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label4.UseMnemonic = True
		Me.Label4.Visible = True
		Me.Label4.AutoSize = False
		Me.Label4.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label4.Name = "Label4"
		Me.Label3.Text = "Hardware ID:"
		Me.Label3.Size = New System.Drawing.Size(73, 17)
		Me.Label3.Location = New System.Drawing.Point(24, 112)
		Me.Label3.TabIndex = 3
		Me.Label3.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label3.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.Label3.BackColor = System.Drawing.SystemColors.Control
		Me.Label3.Enabled = True
		Me.Label3.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label3.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label3.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label3.UseMnemonic = True
		Me.Label3.Visible = True
		Me.Label3.AutoSize = False
		Me.Label3.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label3.Name = "Label3"
		Me.Label2.Text = "Organization:"
		Me.Label2.Size = New System.Drawing.Size(73, 17)
		Me.Label2.Location = New System.Drawing.Point(24, 72)
		Me.Label2.TabIndex = 2
		Me.Label2.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label2.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.Label2.BackColor = System.Drawing.SystemColors.Control
		Me.Label2.Enabled = True
		Me.Label2.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label2.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label2.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label2.UseMnemonic = True
		Me.Label2.Visible = True
		Me.Label2.AutoSize = False
		Me.Label2.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label2.Name = "Label2"
		Me.Label1.Text = "Name:"
		Me.Label1.Size = New System.Drawing.Size(41, 17)
		Me.Label1.Location = New System.Drawing.Point(48, 40)
		Me.Label1.TabIndex = 1
		Me.Label1.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label1.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.Label1.BackColor = System.Drawing.SystemColors.Control
		Me.Label1.Enabled = True
		Me.Label1.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label1.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label1.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label1.UseMnemonic = True
		Me.Label1.Visible = True
		Me.Label1.AutoSize = False
		Me.Label1.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label1.Name = "Label1"
		Me.Controls.Add(Frame3)
		Me.Controls.Add(Frame2)
		Me.Controls.Add(Frame1)
		Me.Frame3.Controls.Add(Frame7)
		Me.Frame3.Controls.Add(Frame6)
		Me.Frame3.Controls.Add(Frame5)
		Me.Frame3.Controls.Add(Frame4)
		Me.Frame7.Controls.Add(SmartKeyEdit)
		Me.Frame7.Controls.Add(GenerateSmartButton)
		Me.Frame6.Controls.Add(GenerateRegButton)
		Me.Frame6.Controls.Add(RegNameEdit)
		Me.Frame6.Controls.Add(KeyValueNameEdit)
		Me.Frame6.Controls.Add(KeyNameEdit)
		Me.Frame6.Controls.Add(Text9)
		Me.Frame6.Controls.Add(Label10)
		Me.Frame6.Controls.Add(Label9)
		Me.Frame6.Controls.Add(Label8)
		Me.Frame5.Controls.Add(TextKeyEdit)
		Me.Frame5.Controls.Add(GenerateTextButton)
		Me.Frame4.Controls.Add(GenerateFileButton)
		Me.Frame4.Controls.Add(FileNameEdit)
		Me.Frame4.Controls.Add(Label7)
		Me.Frame2.Controls.Add(MaxExecEdit)
		Me.Frame2.Controls.Add(NumDaysEdit)
		Me.Frame2.Controls.Add(Label6)
		Me.Frame2.Controls.Add(Label5)
		Me.Frame1.Controls.Add(CustomName)
		Me.Frame1.Controls.Add(HardIdName)
		Me.Frame1.Controls.Add(CompanyName_Renamed)
		Me.Frame1.Controls.Add(NameEdit)
		Me.Frame1.Controls.Add(Label4)
		Me.Frame1.Controls.Add(Label3)
		Me.Frame1.Controls.Add(Label2)
		Me.Frame1.Controls.Add(Label1)
	End Sub
#End Region 
#Region "Upgrade Support "
	Private Shared m_vb6FormDefInstance As Form1
	Private Shared m_InitializingDefInstance As Boolean
	Public Shared Property DefInstance() As Form1
		Get
			If m_vb6FormDefInstance Is Nothing OrElse m_vb6FormDefInstance.IsDisposed Then
				m_InitializingDefInstance = True
				m_vb6FormDefInstance = New Form1()
				m_InitializingDefInstance = False
			End If
			DefInstance = m_vb6FormDefInstance
		End Get
		Set
			m_vb6FormDefInstance = Value
		End Set
	End Property
#End Region


	Const LicenseHash = "yuhsdf873hJHslk99423jhdsfhGSDKURKCFNB78934hGDMNF5634GfghwyIPahfurH6394hfJfhUYfikfhu8whj3yHYFIOOFhNFAPWRE"

    Private Sub GenerateFileButton_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles GenerateFileButton.Click

        Dim UserName As String
        Dim Organization As String
        Dim HardId As String
        Dim Custom As String
        Dim NumDays As Short
        Dim NumExec As Short

        If NameEdit.Text = "" Then

            UserName = vbNullString

        Else

            UserName = NameEdit.Text

        End If

        If CompanyName_Renamed.Text = "" Then

            Organization = vbNullString

        Else

            Organization = CompanyName_Renamed.Text

        End If

        If CustomName.Text = "" Then

            Custom = vbNullString

        Else

            Custom = CustomName.Text

        End If

        If HardIdName.Text = "" Then

            HardId = vbNullString

        Else

            HardId = HardIdName.Text

        End If

        If NumDaysEdit.Text = "" Then

            NumDays = 0

        Else

            NumDays = CShort(NumDaysEdit.Text)

        End If

        If MaxExecEdit.Text = "" Then

            NumExec = 0

        Else

            NumExec = CShort(MaxExecEdit.Text)

        End If

        ' create the file key

        WLGenLicenseFileKey(LicenseHash, UserName, Organization, Custom, HardId, NumDays, NumExec, 0, 0, 0, 0, GlobalBuffer.Value)

        'store key in file

        FileOpen(1, VB6.GetPath & "\" & FileNameEdit.Text, OpenMode.Output)
        PrintLine(1, GlobalBuffer.Value)
        FileClose(1)

        MsgBox("A license key file key has been generated", MsgBoxStyle.Information + MsgBoxStyle.OKOnly, "WinLicense SDK")

    End Sub

    Private Sub GenerateSmartButton_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles GenerateSmartButton.Click

        Dim UserName As String
        Dim Organization As String
        Dim HardId As String
        Dim Custom As String
        Dim NumDays As Short
        Dim NumExec As Short

        If NameEdit.Text = "" Then

            UserName = vbNullString

        Else

            UserName = NameEdit.Text

        End If

        If CompanyName_Renamed.Text = "" Then

            Organization = vbNullString

        Else

            Organization = CompanyName_Renamed.Text

        End If

        If CustomName.Text = "" Then

            Custom = vbNullString

        Else

            Custom = CustomName.Text

        End If

        If HardIdName.Text = "" Then

            HardId = vbNullString

        Else

            HardId = HardIdName.Text

        End If

        If NumDaysEdit.Text = "" Then

            NumDays = 0

        Else

            NumDays = CShort(NumDaysEdit.Text)

        End If

        If MaxExecEdit.Text = "" Then

            NumExec = 0

        Else

            NumExec = CShort(MaxExecEdit.Text)

        End If

        ' create the file key

        WLGenLicenseSmartKey(LicenseHash, UserName, Organization, Custom, HardId, NumDays, NumExec, 0, GlobalBuffer.Value)

        ' show key on GUI

        SmartKeyEdit.Text = GlobalBuffer.Value


    End Sub

    Private Sub GenerateTextButton_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles GenerateTextButton.Click
        Dim UserName As String
        Dim Organization As String
        Dim HardId As String
        Dim Custom As String
        Dim NumDays As Short
        Dim NumExec As Short

        If NameEdit.Text = "" Then

            UserName = vbNullString

        Else

            UserName = NameEdit.Text

        End If

        If CompanyName_Renamed.Text = "" Then

            Organization = vbNullString

        Else

            Organization = CompanyName_Renamed.Text

        End If

        If CustomName.Text = "" Then

            Custom = vbNullString

        Else

            Custom = CustomName.Text

        End If

        If HardIdName.Text = "" Then

            HardId = vbNullString

        Else

            HardId = HardIdName.Text

        End If

        If NumDaysEdit.Text = "" Then

            NumDays = 0

        Else

            NumDays = CShort(NumDaysEdit.Text)

        End If

        If MaxExecEdit.Text = "" Then

            NumExec = 0

        Else

            NumExec = CShort(MaxExecEdit.Text)

        End If

        ' create the file key

        WLGenLicenseTextKey(LicenseHash, UserName, Organization, Custom, HardId, NumDays, NumExec, 0, 0, 0, 0, GlobalBuffer.Value)

        ' show key on GUI

        TextKeyEdit.Text = GlobalBuffer.Value

    End Sub
End Class
