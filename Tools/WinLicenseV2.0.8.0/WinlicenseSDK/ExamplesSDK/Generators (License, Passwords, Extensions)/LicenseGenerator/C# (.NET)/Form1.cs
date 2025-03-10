using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.Runtime.InteropServices;
using System.Text;
using System.IO;



namespace WindowsApplication1
{
    [StructLayout(LayoutKind.Sequential)]
    public class SystemTime
    {
        public short wYear;
        public short wMonth;
        public short wDayOfWeek;
        public short wDay;
        public short wHour;
        public short wMinute;
        public short wSecond;
        public short wMilliseconds;
    }

	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class Form1 : System.Windows.Forms.Form
	{
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.DateTimePicker dateTimePicker1;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.GroupBox groupBox6;
        private System.Windows.Forms.TextBox textBox9;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.GroupBox groupBox7;
        private System.Windows.Forms.Button GenerateSmartButton;
        private System.Windows.Forms.Button GenerateRegButton;
        private System.Windows.Forms.Button GenerateTextButton;
        private System.Windows.Forms.Button GenerateFileButton;
        private System.Windows.Forms.TextBox CustomEdit;
        private System.Windows.Forms.TextBox HardIdEdit;
        private System.Windows.Forms.TextBox OrgEdit;
        private System.Windows.Forms.TextBox NameEdit;
        private System.Windows.Forms.TextBox NumExecEdit;
        private System.Windows.Forms.TextBox NumDaysEdit;
        private System.Windows.Forms.TextBox SmartEdit;
        private System.Windows.Forms.TextBox RegFileNameEdit;
        private System.Windows.Forms.TextBox RegValueNameEdit;
        private System.Windows.Forms.TextBox RegNameEdit;
        private System.Windows.Forms.TextBox TextEdit;
        private System.Windows.Forms.TextBox FileNameEdit;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;
        private System.Windows.Forms.CheckBox ExpDateEnabledCheck;
        private const string LicenseHash = "yuhsdf873hJHslk99423jhdsfhGSDKURKCFNB78934hGDMNF5634GfghwyIPahfurH6394hfJfhUYfikfhu8whj3yHYFIOOFhNFAPWRE";


		public Form1()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if (components != null) 
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.CustomEdit = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.HardIdEdit = new System.Windows.Forms.TextBox();
            this.OrgEdit = new System.Windows.Forms.TextBox();
            this.NameEdit = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.ExpDateEnabledCheck = new System.Windows.Forms.CheckBox();
            this.label7 = new System.Windows.Forms.Label();
            this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
            this.NumExecEdit = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.NumDaysEdit = new System.Windows.Forms.TextBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.groupBox7 = new System.Windows.Forms.GroupBox();
            this.SmartEdit = new System.Windows.Forms.TextBox();
            this.GenerateSmartButton = new System.Windows.Forms.Button();
            this.groupBox6 = new System.Windows.Forms.GroupBox();
            this.GenerateRegButton = new System.Windows.Forms.Button();
            this.RegFileNameEdit = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.RegValueNameEdit = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.RegNameEdit = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.textBox9 = new System.Windows.Forms.TextBox();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.GenerateTextButton = new System.Windows.Forms.Button();
            this.TextEdit = new System.Windows.Forms.TextBox();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.GenerateFileButton = new System.Windows.Forms.Button();
            this.FileNameEdit = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox7.SuspendLayout();
            this.groupBox6.SuspendLayout();
            this.groupBox5.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
                                                                                    this.CustomEdit,
                                                                                    this.label4,
                                                                                    this.HardIdEdit,
                                                                                    this.OrgEdit,
                                                                                    this.NameEdit,
                                                                                    this.label3,
                                                                                    this.label2,
                                                                                    this.label1});
            this.groupBox1.Location = new System.Drawing.Point(32, 24);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(472, 128);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "User\'s Information";
            // 
            // CustomEdit
            // 
            this.CustomEdit.Location = new System.Drawing.Point(328, 24);
            this.CustomEdit.Multiline = true;
            this.CustomEdit.Name = "CustomEdit";
            this.CustomEdit.Size = new System.Drawing.Size(100, 88);
            this.CustomEdit.TabIndex = 7;
            this.CustomEdit.Text = "";
            // 
            // label4
            // 
            this.label4.Location = new System.Drawing.Point(232, 24);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(80, 32);
            this.label4.TabIndex = 6;
            this.label4.Text = "Custom Data:";
            // 
            // HardIdEdit
            // 
            this.HardIdEdit.Location = new System.Drawing.Point(96, 88);
            this.HardIdEdit.Name = "HardIdEdit";
            this.HardIdEdit.TabIndex = 5;
            this.HardIdEdit.Text = "";
            // 
            // OrgEdit
            // 
            this.OrgEdit.Location = new System.Drawing.Point(96, 56);
            this.OrgEdit.Name = "OrgEdit";
            this.OrgEdit.TabIndex = 4;
            this.OrgEdit.Text = "";
            // 
            // NameEdit
            // 
            this.NameEdit.Location = new System.Drawing.Point(96, 24);
            this.NameEdit.Name = "NameEdit";
            this.NameEdit.TabIndex = 3;
            this.NameEdit.Text = "";
            // 
            // label3
            // 
            this.label3.Location = new System.Drawing.Point(16, 96);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(72, 16);
            this.label3.TabIndex = 2;
            this.label3.Text = "Hardware ID:";
            // 
            // label2
            // 
            this.label2.Location = new System.Drawing.Point(16, 64);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(72, 16);
            this.label2.TabIndex = 1;
            this.label2.Text = "Organization:";
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(48, 32);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(40, 16);
            this.label1.TabIndex = 0;
            this.label1.Text = "Name:";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.AddRange(new System.Windows.Forms.Control[] {
                                                                                    this.ExpDateEnabledCheck,
                                                                                    this.label7,
                                                                                    this.dateTimePicker1,
                                                                                    this.NumExecEdit,
                                                                                    this.label6,
                                                                                    this.label5,
                                                                                    this.NumDaysEdit});
            this.groupBox2.Location = new System.Drawing.Point(32, 176);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(472, 152);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Key Expiration Information";
            // 
            // ExpDateEnabledCheck
            // 
            this.ExpDateEnabledCheck.Location = new System.Drawing.Point(112, 112);
            this.ExpDateEnabledCheck.Name = "ExpDateEnabledCheck";
            this.ExpDateEnabledCheck.Size = new System.Drawing.Size(176, 24);
            this.ExpDateEnabledCheck.TabIndex = 6;
            this.ExpDateEnabledCheck.Text = "Enable Expiration Date";
            this.ExpDateEnabledCheck.CheckedChanged += new System.EventHandler(this.ExpDateEnabledCheck_CheckedChanged);
            // 
            // label7
            // 
            this.label7.Location = new System.Drawing.Point(16, 96);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(88, 23);
            this.label7.TabIndex = 5;
            this.label7.Text = "Expiration Date:";
            // 
            // dateTimePicker1
            // 
            this.dateTimePicker1.Enabled = false;
            this.dateTimePicker1.Location = new System.Drawing.Point(112, 88);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(208, 20);
            this.dateTimePicker1.TabIndex = 4;
            // 
            // NumExecEdit
            // 
            this.NumExecEdit.Location = new System.Drawing.Point(112, 56);
            this.NumExecEdit.Name = "NumExecEdit";
            this.NumExecEdit.TabIndex = 3;
            this.NumExecEdit.Text = "";
            // 
            // label6
            // 
            this.label6.Location = new System.Drawing.Point(16, 64);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(100, 24);
            this.label6.TabIndex = 2;
            this.label6.Text = "Max. Executions:";
            // 
            // label5
            // 
            this.label5.Location = new System.Drawing.Point(32, 32);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(80, 23);
            this.label5.TabIndex = 1;
            this.label5.Text = "Number Days:";
            // 
            // NumDaysEdit
            // 
            this.NumDaysEdit.Location = new System.Drawing.Point(112, 24);
            this.NumDaysEdit.Name = "NumDaysEdit";
            this.NumDaysEdit.TabIndex = 0;
            this.NumDaysEdit.Text = "";
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.AddRange(new System.Windows.Forms.Control[] {
                                                                                    this.groupBox7,
                                                                                    this.groupBox6,
                                                                                    this.groupBox5,
                                                                                    this.groupBox4});
            this.groupBox3.Location = new System.Drawing.Point(32, 352);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(472, 280);
            this.groupBox3.TabIndex = 2;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Type Generated Key";
            // 
            // groupBox7
            // 
            this.groupBox7.Controls.AddRange(new System.Windows.Forms.Control[] {
                                                                                    this.SmartEdit,
                                                                                    this.GenerateSmartButton});
            this.groupBox7.Location = new System.Drawing.Point(240, 176);
            this.groupBox7.Name = "groupBox7";
            this.groupBox7.Size = new System.Drawing.Size(216, 88);
            this.groupBox7.TabIndex = 3;
            this.groupBox7.TabStop = false;
            this.groupBox7.Text = "SmartActivate Key";
            // 
            // SmartEdit
            // 
            this.SmartEdit.Location = new System.Drawing.Point(16, 56);
            this.SmartEdit.Name = "SmartEdit";
            this.SmartEdit.ReadOnly = true;
            this.SmartEdit.Size = new System.Drawing.Size(184, 20);
            this.SmartEdit.TabIndex = 9;
            this.SmartEdit.Text = "";
            // 
            // GenerateSmartButton
            // 
            this.GenerateSmartButton.Location = new System.Drawing.Point(40, 24);
            this.GenerateSmartButton.Name = "GenerateSmartButton";
            this.GenerateSmartButton.Size = new System.Drawing.Size(128, 20);
            this.GenerateSmartButton.TabIndex = 8;
            this.GenerateSmartButton.Text = "Generate Smart Key";
            this.GenerateSmartButton.Click += new System.EventHandler(this.GenerateSmartButton_Click);
            // 
            // groupBox6
            // 
            this.groupBox6.Controls.AddRange(new System.Windows.Forms.Control[] {
                                                                                    this.GenerateRegButton,
                                                                                    this.RegFileNameEdit,
                                                                                    this.label11,
                                                                                    this.RegValueNameEdit,
                                                                                    this.label10,
                                                                                    this.RegNameEdit,
                                                                                    this.label9,
                                                                                    this.textBox9});
            this.groupBox6.Location = new System.Drawing.Point(232, 24);
            this.groupBox6.Name = "groupBox6";
            this.groupBox6.Size = new System.Drawing.Size(224, 144);
            this.groupBox6.TabIndex = 2;
            this.groupBox6.TabStop = false;
            this.groupBox6.Text = "Registry key";
            // 
            // GenerateRegButton
            // 
            this.GenerateRegButton.Location = new System.Drawing.Point(40, 104);
            this.GenerateRegButton.Name = "GenerateRegButton";
            this.GenerateRegButton.Size = new System.Drawing.Size(152, 24);
            this.GenerateRegButton.TabIndex = 7;
            this.GenerateRegButton.Text = "Generate Reg File Key";
            this.GenerateRegButton.Click += new System.EventHandler(this.GenerateRegButton_Click);
            // 
            // RegFileNameEdit
            // 
            this.RegFileNameEdit.Location = new System.Drawing.Point(112, 72);
            this.RegFileNameEdit.Name = "RegFileNameEdit";
            this.RegFileNameEdit.Size = new System.Drawing.Size(96, 20);
            this.RegFileNameEdit.TabIndex = 6;
            this.RegFileNameEdit.Text = "License.reg";
            // 
            // label11
            // 
            this.label11.Location = new System.Drawing.Point(16, 80);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(96, 23);
            this.label11.TabIndex = 5;
            this.label11.Text = "File Name  (*.reg)";
            // 
            // RegValueNameEdit
            // 
            this.RegValueNameEdit.Location = new System.Drawing.Point(112, 48);
            this.RegValueNameEdit.Name = "RegValueNameEdit";
            this.RegValueNameEdit.Size = new System.Drawing.Size(96, 20);
            this.RegValueNameEdit.TabIndex = 4;
            this.RegValueNameEdit.Text = "reg_value";
            // 
            // label10
            // 
            this.label10.Location = new System.Drawing.Point(16, 56);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(96, 23);
            this.label10.TabIndex = 3;
            this.label10.Text = "Key Value Name:";
            // 
            // RegNameEdit
            // 
            this.RegNameEdit.Location = new System.Drawing.Point(120, 24);
            this.RegNameEdit.Name = "RegNameEdit";
            this.RegNameEdit.Size = new System.Drawing.Size(88, 20);
            this.RegNameEdit.TabIndex = 2;
            this.RegNameEdit.Text = "Software\\Mysoft";
            // 
            // label9
            // 
            this.label9.Location = new System.Drawing.Point(8, 24);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(64, 23);
            this.label9.TabIndex = 1;
            this.label9.Text = "Key Name:";
            // 
            // textBox9
            // 
            this.textBox9.Location = new System.Drawing.Point(72, 24);
            this.textBox9.Name = "textBox9";
            this.textBox9.ReadOnly = true;
            this.textBox9.Size = new System.Drawing.Size(48, 20);
            this.textBox9.TabIndex = 0;
            this.textBox9.Text = "HKLM\\";
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.AddRange(new System.Windows.Forms.Control[] {
                                                                                    this.GenerateTextButton,
                                                                                    this.TextEdit});
            this.groupBox5.Location = new System.Drawing.Point(24, 128);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(200, 136);
            this.groupBox5.TabIndex = 1;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "Text Key";
            // 
            // GenerateTextButton
            // 
            this.GenerateTextButton.Location = new System.Drawing.Point(32, 24);
            this.GenerateTextButton.Name = "GenerateTextButton";
            this.GenerateTextButton.Size = new System.Drawing.Size(120, 24);
            this.GenerateTextButton.TabIndex = 3;
            this.GenerateTextButton.Text = "Generate Text Key";
            this.GenerateTextButton.Click += new System.EventHandler(this.GenerateTextButton_Click);
            // 
            // TextEdit
            // 
            this.TextEdit.Location = new System.Drawing.Point(24, 64);
            this.TextEdit.Multiline = true;
            this.TextEdit.Name = "TextEdit";
            this.TextEdit.ReadOnly = true;
            this.TextEdit.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.TextEdit.Size = new System.Drawing.Size(152, 64);
            this.TextEdit.TabIndex = 1;
            this.TextEdit.Text = "";
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.AddRange(new System.Windows.Forms.Control[] {
                                                                                    this.GenerateFileButton,
                                                                                    this.FileNameEdit,
                                                                                    this.label8});
            this.groupBox4.Location = new System.Drawing.Point(24, 24);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(200, 96);
            this.groupBox4.TabIndex = 0;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "File Key";
            // 
            // GenerateFileButton
            // 
            this.GenerateFileButton.Location = new System.Drawing.Point(24, 56);
            this.GenerateFileButton.Name = "GenerateFileButton";
            this.GenerateFileButton.Size = new System.Drawing.Size(120, 24);
            this.GenerateFileButton.TabIndex = 2;
            this.GenerateFileButton.Text = "Generate File Key";
            this.GenerateFileButton.Click += new System.EventHandler(this.GenerateFileButton_Click);
            // 
            // FileNameEdit
            // 
            this.FileNameEdit.Location = new System.Drawing.Point(72, 16);
            this.FileNameEdit.Name = "FileNameEdit";
            this.FileNameEdit.TabIndex = 1;
            this.FileNameEdit.Text = "License.dat";
            // 
            // label8
            // 
            this.label8.Location = new System.Drawing.Point(8, 24);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(64, 23);
            this.label8.TabIndex = 0;
            this.label8.Text = "File Name:";
            // 
            // Form1
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(536, 645);
            this.Controls.AddRange(new System.Windows.Forms.Control[] {
                                                                          this.groupBox3,
                                                                          this.groupBox2,
                                                                          this.groupBox1});
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "License Key Generator SDK";
            this.groupBox1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox3.ResumeLayout(false);
            this.groupBox7.ResumeLayout(false);
            this.groupBox6.ResumeLayout(false);
            this.groupBox5.ResumeLayout(false);
            this.groupBox4.ResumeLayout(false);
            this.ResumeLayout(false);

        }
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main() 
		{
			Application.Run(new Form1());
		}


        private void ExpDateEnabledCheck_CheckedChanged(object sender, System.EventArgs e)
        {
            if (this.ExpDateEnabledCheck.Checked == false)
            {
                this.dateTimePicker1.Enabled = false;
            }
            else
            {
                this.dateTimePicker1.Enabled = true;
            }

        }

        private void button1_Click(object sender, System.EventArgs e)
        {
        
        }

        private void GenerateFileButton_Click(object sender, System.EventArgs e)
        {

            byte[]          LicenseKeyBuff = new byte [1000];
            string          pNameEdit = (this.NameEdit.Text.Length == 0)? null : this.NameEdit.Text;
            string          pOrgEdit = (this.OrgEdit.Text.Length == 0)? null : this.OrgEdit.Text;
            string          pCustomEdit = (this.CustomEdit.Text.Length == 0)? null : this.CustomEdit.Text;
            string          pHardIdEdit = (this.HardIdEdit.Text.Length == 0)? null : this.HardIdEdit.Text;
            int             mNumDays = (this.NumDaysEdit.Text.Length == 0)? 0 : Convert.ToInt32(NumDaysEdit.Text); 
            int             mNumExec = (this.NumExecEdit.Text.Length == 0)? 0 :  Convert.ToInt32(NumExecEdit.Text);
            SystemTime      ExpDateSysTime = new SystemTime();
            SystemTime      NullExpDateSysTime = null;
            int             SizeKey;

            // get the current date from dateTimePicker1

            ExpDateSysTime.wYear = (short)dateTimePicker1.Value.Year;
            ExpDateSysTime.wMonth = (short)dateTimePicker1.Value.Month;
            ExpDateSysTime.wDay = (short)dateTimePicker1.Value.Day;

            // generate license file

            if (this.ExpDateEnabledCheck.Checked == false)
            {
                SizeKey = WinlicenseSDK.WLGenLicenseFileKey(LicenseHash, pNameEdit, pOrgEdit, pCustomEdit, pHardIdEdit, mNumDays, mNumExec, ref NullExpDateSysTime, 0, 0, 0, LicenseKeyBuff);
            }
            else
            {
                SizeKey = WinlicenseSDK.WLGenLicenseFileKey(LicenseHash, pNameEdit, pOrgEdit, pCustomEdit, pHardIdEdit, mNumDays, mNumExec, ref ExpDateSysTime, 0, 0, 0, LicenseKeyBuff);
            }

            // Create file to store the generated key

            FileStream fs = new FileStream(this.FileNameEdit.Text, FileMode.Create);
        
            BinaryWriter w = new BinaryWriter(fs);
        
            // Write data to file

            for (int i = 0; i < SizeKey; i++)
            {
                w.Write((byte)LicenseKeyBuff[i]);
            }

            // Close file
        
            w.Close();
            fs.Close();

            MessageBox.Show("A License key has been generated", "Winlicense");
        }

        private void GenerateTextButton_Click(object sender, System.EventArgs e)
        {
            StringBuilder   LicenseKeyBuff = new StringBuilder(1000);
            string          pNameEdit = (this.NameEdit.Text.Length == 0)? null : this.NameEdit.Text;
            string          pOrgEdit = (this.OrgEdit.Text.Length == 0)? null : this.OrgEdit.Text;
            string          pCustomEdit = (this.CustomEdit.Text.Length == 0)? null : this.CustomEdit.Text;
            string          pHardIdEdit = (this.HardIdEdit.Text.Length == 0)? null : this.HardIdEdit.Text;
            int             mNumDays = (this.NumDaysEdit.Text.Length == 0)? 0 : Convert.ToInt32(NumDaysEdit.Text); 
            int             mNumExec = (this.NumExecEdit.Text.Length == 0)? 0 :  Convert.ToInt32(NumExecEdit.Text);
            SystemTime      ExpDateSysTime = new SystemTime();
            SystemTime      NullExpDateSysTime = null;
            int             SizeKey;

            // get the current date from dateTimePicker1

            ExpDateSysTime.wYear = (short)dateTimePicker1.Value.Year;
            ExpDateSysTime.wMonth = (short)dateTimePicker1.Value.Month;
            ExpDateSysTime.wDay = (short)dateTimePicker1.Value.Day;

            // generate license file

            if (this.ExpDateEnabledCheck.Checked == false)
            {
                SizeKey = WinlicenseSDK.WLGenLicenseTextKey(LicenseHash, pNameEdit, pOrgEdit, pCustomEdit, pHardIdEdit, mNumDays, mNumExec, ref NullExpDateSysTime, 0, 0, 0, LicenseKeyBuff);
            }
            else
            {
                SizeKey = WinlicenseSDK.WLGenLicenseTextKey(LicenseHash, pNameEdit, pOrgEdit, pCustomEdit, pHardIdEdit, mNumDays, mNumExec, ref ExpDateSysTime, 0, 0, 0, LicenseKeyBuff);
            }

            // show the generated key on the GUI
                        
            TextEdit.Text = LicenseKeyBuff.ToString();
        }

        private void GenerateSmartButton_Click(object sender, System.EventArgs e)
        {

            StringBuilder   LicenseKeyBuff = new StringBuilder(1000);
            string          pNameEdit = (this.NameEdit.Text.Length == 0)? null : this.NameEdit.Text;
            string          pOrgEdit = (this.OrgEdit.Text.Length == 0)? null : this.OrgEdit.Text;
            string          pCustomEdit = (this.CustomEdit.Text.Length == 0)? null : this.CustomEdit.Text;
            string          pHardIdEdit = (this.HardIdEdit.Text.Length == 0)? null : this.HardIdEdit.Text;
            int             mNumDays = (this.NumDaysEdit.Text.Length == 0)? 0 : Convert.ToInt32(NumDaysEdit.Text); 
            int             mNumExec = (this.NumExecEdit.Text.Length == 0)? 0 :  Convert.ToInt32(NumExecEdit.Text);
            SystemTime      ExpDateSysTime = new SystemTime();
            SystemTime      NullExpDateSysTime = null;
            int             SizeKey;

            // get the current date from dateTimePicker1

            ExpDateSysTime.wYear = (short)dateTimePicker1.Value.Year;
            ExpDateSysTime.wMonth = (short)dateTimePicker1.Value.Month;
            ExpDateSysTime.wDay = (short)dateTimePicker1.Value.Day;

            // generate license file

            if (this.ExpDateEnabledCheck.Checked == false)
            {
                SizeKey = WinlicenseSDK.WLGenLicenseSmartKey(LicenseHash, pNameEdit, pOrgEdit, pCustomEdit, pHardIdEdit, mNumDays, mNumExec, NullExpDateSysTime, LicenseKeyBuff);
            }
            else
            {
                SizeKey = WinlicenseSDK.WLGenLicenseSmartKey(LicenseHash, pNameEdit, pOrgEdit, pCustomEdit, pHardIdEdit, mNumDays, mNumExec, ExpDateSysTime, LicenseKeyBuff);
            }

            // show the generated key on the GUI
                        
            SmartEdit.Text = LicenseKeyBuff.ToString();

        }

        private void GenerateRegButton_Click(object sender, System.EventArgs e)
        {
            byte[]          LicenseKeyBuff = new byte [4000];
            string          pNameEdit = (this.NameEdit.Text.Length == 0)? null : this.NameEdit.Text;
            string          pOrgEdit = (this.OrgEdit.Text.Length == 0)? null : this.OrgEdit.Text;
            string          pCustomEdit = (this.CustomEdit.Text.Length == 0)? null : this.CustomEdit.Text;
            string          pHardIdEdit = (this.HardIdEdit.Text.Length == 0)? null : this.HardIdEdit.Text;
            int             mNumDays = (this.NumDaysEdit.Text.Length == 0)? 0 : Convert.ToInt32(NumDaysEdit.Text); 
            int             mNumExec = (this.NumExecEdit.Text.Length == 0)? 0 :  Convert.ToInt32(NumExecEdit.Text);
            SystemTime      ExpDateSysTime = new SystemTime();
            SystemTime      NullExpDateSysTime = null;
            int             SizeKey;
            string          RegName = "HKEY_LOCAL_MACHINE\\" + this.RegNameEdit.Text;

            // get the current date from dateTimePicker1

            ExpDateSysTime.wYear = (short)dateTimePicker1.Value.Year;
            ExpDateSysTime.wMonth = (short)dateTimePicker1.Value.Month;
            ExpDateSysTime.wDay = (short)dateTimePicker1.Value.Day;

            // generate license file

            if (this.ExpDateEnabledCheck.Checked == false)
            {
                SizeKey = WinlicenseSDK.WLGenLicenseRegistryKey(LicenseHash, pNameEdit, pOrgEdit, pCustomEdit, pHardIdEdit, mNumDays, mNumExec, ref NullExpDateSysTime, 0, 0, 0, RegName, this.RegValueNameEdit.Text, LicenseKeyBuff);
            }
            else
            {
                SizeKey = WinlicenseSDK.WLGenLicenseRegistryKey(LicenseHash, pNameEdit, pOrgEdit, pCustomEdit, pHardIdEdit, mNumDays, mNumExec, ref ExpDateSysTime, 0, 0, 0, RegName, this.RegValueNameEdit.Text, LicenseKeyBuff);
            }

            // Create file to store the generated key

            FileStream fs = new FileStream(this.RegFileNameEdit.Text, FileMode.Create);
        
            BinaryWriter w = new BinaryWriter(fs);
        
            // Write data to file

            for (int i = 0; i < SizeKey; i++)
            {
                w.Write((byte)LicenseKeyBuff[i]);
            }

            // Close file
        
            w.Close();
            fs.Close();

            MessageBox.Show("A Registry file key has been generated", "Winlicense");
    
        }

  
 	}

    /****************************************************************************** 
    /* Class: WinlicenseSDK
    /*
    /* Description: Wrapper for the Winlicense SDK APIs
    /*
    /******************************************************************************/

    class WinlicenseSDK
    {
        [DllImport( "WinlicenseSDK.dll", EntryPoint="WLGenPassword", CallingConvention = CallingConvention.StdCall )]
        public static extern int WLGenPassword(string PassHash, string Name, StringBuilder PasswordBuffer);

        [DllImport( "WinlicenseSDK.dll", EntryPoint="WLGenLicenseFileKey", CallingConvention = CallingConvention.StdCall )]
        public static extern int WLGenLicenseFileKey(string LicenseHash, string UserName, string Organization, string CustomData, string MachineID,
                             int NumDays, int NumExec, ref SystemTime NewDate, int CountryId, int Runtime, int GlobalTime, byte[] LicenseBuffer);

        [DllImport( "WinlicenseSDK.dll", EntryPoint="WLGenLicenseRegistryKey", CallingConvention = CallingConvention.StdCall )]
        public static extern int WLGenLicenseRegistryKey(string LicenseHash, string UserName, string Organization, string CustomData, string MachineID,
            int NumDays, int NumExec, ref SystemTime NewDate, int CountryId, int Runtime, int GlobalTime, string RegName, string RegValueName, byte[] LicenseBuffer);

          [DllImport( "WinlicenseSDK.dll", EntryPoint="WLGenLicenseTextKey", CallingConvention = CallingConvention.StdCall )]
        public static extern int WLGenLicenseTextKey(string LicenseHash, string UserName, string Organization, string CustomData, string MachineID,
            int NumDays, int NumExec, ref SystemTime NewDate, int CountryId, int Runtime, int GlobalTime, StringBuilder LicenseBuffer);

        [DllImport( "WinlicenseSDK.dll", EntryPoint="WLGenLicenseSmartKey", CallingConvention = CallingConvention.StdCall )]
        public static extern int WLGenLicenseSmartKey(string LicenseHash, string UserName, string Organization, string CustomData, string MachineID,
            int NumDays, int NumExec, SystemTime NewDate, StringBuilder LicenseBuffer);
    
    }


}


