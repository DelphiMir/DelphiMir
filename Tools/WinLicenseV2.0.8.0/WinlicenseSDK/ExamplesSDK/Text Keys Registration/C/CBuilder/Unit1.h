//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TLabel *Label2;
    TButton *Button1;
    TGroupBox *GroupBox1;
    TMemo *TextKeyEdit;
    TPanel *Panel1;
    TLabel *Label3;
    TGroupBox *GroupBox2;
    TLabel *Label4;
    TEdit *NameEdit;
    TLabel *Label5;
    TEdit *CompanyEdit;
    TLabel *Label6;
    TEdit *ExtradataEdit;
    void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
