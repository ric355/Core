{
Ultibo CP1257 (ANSI) interface unit.

Copyright (C) 2016 - SoftOz Pty Ltd.

Arch
====

 <All>

Boards
======

 <All>

Licence
=======

 LGPLv2.1 with static linking exception (See COPYING.modifiedLGPL.txt)
 
Credits
=======

 Information for this unit was obtained from:

 
References
==========


CP1257 ANSI (Baltic)
============================

 Note: This unit automatically includes CP775OEM as the matching OEM code page.

}

{$mode delphi} {Default to Delphi compatible syntax}
{$H+}          {Default to AnsiString}
{$inline on}   {Allow use of Inline procedures}

unit CP1257ANSI;

interface

uses GlobalConfig,GlobalConst,GlobalTypes,Locale;

{==============================================================================}
{Global definitions}
{$INCLUDE ..\core\GlobalDefines.inc}
        
{==============================================================================}
{const}
 {CP1257ANSI specific constants}

{==============================================================================}
{type}
 {CP1257ANSI specific types}

{==============================================================================}
{var}
 {CP1257ANSI specific variables}

{==============================================================================}
{Initialization Functions}
procedure CP1257ANSIInit;
 
{==============================================================================}
{CP1257ANSI Functions}
 
{==============================================================================}
{CP1257ANSI Helper Functions}
 
{==============================================================================}
{==============================================================================}

implementation

uses CP775OEM;

{==============================================================================}
{==============================================================================}
var
 {CP1257ANSI specific variables}
 CP1257ANSIInitialized:Boolean;

 CPANSI1257:TCodeTable = (
  MaxCharSize:1;
  DefaultChar:(
  $3F,$00);
  LeadByte:(
  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00);
  Values:(
  $0000,$0001,$0002,$0003,$0004,$0005,$0006,$0007,
  $0008,$0009,$000A,$000B,$000C,$000D,$000E,$000F,
  $0010,$0011,$0012,$0013,$0014,$0015,$0016,$0017,
  $0018,$0019,$001A,$001B,$001C,$001D,$001E,$001F,
  $0020,$0021,$0022,$0023,$0024,$0025,$0026,$0027,
  $0028,$0029,$002A,$002B,$002C,$002D,$002E,$002F,
  $0030,$0031,$0032,$0033,$0034,$0035,$0036,$0037,
  $0038,$0039,$003A,$003B,$003C,$003D,$003E,$003F,
  $0040,$0041,$0042,$0043,$0044,$0045,$0046,$0047,
  $0048,$0049,$004A,$004B,$004C,$004D,$004E,$004F,
  $0050,$0051,$0052,$0053,$0054,$0055,$0056,$0057,
  $0058,$0059,$005A,$005B,$005C,$005D,$005E,$005F,
  $0060,$0061,$0062,$0063,$0064,$0065,$0066,$0067,
  $0068,$0069,$006A,$006B,$006C,$006D,$006E,$006F,
  $0070,$0071,$0072,$0073,$0074,$0075,$0076,$0077,
  $0078,$0079,$007A,$007B,$007C,$007D,$007E,$007F,
  $20AC,$0081,$201A,$0083,$201E,$2026,$2020,$2021,
  $0088,$2030,$008A,$2039,$008C,$00A8,$02C7,$00B8,
  $0090,$2018,$2019,$201C,$201D,$2022,$2013,$2014,
  $0098,$2122,$009A,$203A,$009C,$00AF,$02DB,$009F,
  $00A0,$F8FC,$00A2,$00A3,$00A4,$F8FD,$00A6,$00A7,
  $00D8,$00A9,$0156,$00AB,$00AC,$00AD,$00AE,$00C6,
  $00B0,$00B1,$00B2,$00B3,$00B4,$00B5,$00B6,$00B7,
  $00F8,$00B9,$0157,$00BB,$00BC,$00BD,$00BE,$00E6,
  $0104,$012E,$0100,$0106,$00C4,$00C5,$0118,$0112,
  $010C,$00C9,$0179,$0116,$0122,$0136,$012A,$013B,
  $0160,$0143,$0145,$00D3,$014C,$00D5,$00D6,$00D7,
  $0172,$0141,$015A,$016A,$00DC,$017B,$017D,$00DF,
  $0105,$012F,$0101,$0107,$00E4,$00E5,$0119,$0113,
  $010D,$00E9,$017A,$0117,$0123,$0137,$012B,$013C,
  $0161,$0144,$0146,$00F3,$014D,$00F5,$00F6,$00F7,
  $0173,$0142,$015B,$016B,$00FC,$017C,$017E,$02D9)
 );
 
 CP1257Lower:TLowerTable = (
  LowerID:1257;
  Values:(
  $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F,
  $10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$1D,$1E,$1F,
  $20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2A,$2B,$2C,$2D,$2E,$2F,
  $30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3A,$3B,$3C,$3D,$3E,$3F,
  $40,$61,$62,$63,$64,$65,$66,$67,$68,$69,$6A,$6B,$6C,$6D,$6E,$6F,
  $70,$71,$72,$73,$74,$75,$76,$77,$78,$79,$7A,$5B,$5C,$5D,$5E,$5F,
  $60,$61,$62,$63,$64,$65,$66,$67,$68,$69,$6A,$6B,$6C,$6D,$6E,$6F,
  $70,$71,$72,$73,$74,$75,$76,$77,$78,$79,$7A,$7B,$7C,$7D,$7E,$7F,
  $80,$81,$82,$83,$84,$85,$86,$87,$88,$89,$8A,$8B,$8C,$8D,$8E,$8F,
  $90,$91,$92,$93,$94,$95,$96,$97,$98,$99,$9A,$9B,$9C,$9D,$9E,$9F,
  $A0,$A1,$A2,$A3,$A4,$A5,$A6,$A7,$B8,$A9,$BA,$AB,$AC,$AD,$AE,$BF,
  $B0,$B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$BA,$BB,$BC,$BD,$BE,$BF,
  $E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9,$EA,$EB,$EC,$ED,$EE,$EF,
  $F0,$F1,$F2,$F3,$F4,$F5,$F6,$D7,$F8,$F9,$FA,$FB,$FC,$FD,$FE,$DF,
  $E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9,$EA,$EB,$EC,$ED,$EE,$EF,
  $F0,$F1,$F2,$F3,$F4,$F5,$F6,$F7,$F8,$F9,$FA,$FB,$FC,$FD,$FE,$FF)
 );
 
 CP1257Upper:TUpperTable = (
  UpperID:1257;
  Values:(
  $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F,
  $10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$1D,$1E,$1F,
  $20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2A,$2B,$2C,$2D,$2E,$2F,
  $30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3A,$3B,$3C,$3D,$3E,$3F,
  $40,$41,$42,$43,$44,$45,$46,$47,$48,$49,$4A,$4B,$4C,$4D,$4E,$4F,
  $50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$5A,$5B,$5C,$5D,$5E,$5F,
  $60,$41,$42,$43,$44,$45,$46,$47,$48,$49,$4A,$4B,$4C,$4D,$4E,$4F,
  $50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$5A,$7B,$7C,$7D,$7E,$7F,
  $80,$81,$82,$83,$84,$85,$86,$87,$88,$89,$8A,$8B,$8C,$8D,$8E,$8F,
  $90,$91,$92,$93,$94,$95,$96,$97,$98,$99,$9A,$9B,$9C,$9D,$9E,$9F,
  $A0,$A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A9,$AA,$AB,$AC,$AD,$AE,$AF,
  $B0,$B1,$B2,$B3,$B4,$B5,$B6,$B7,$A8,$B9,$AA,$BB,$BC,$BD,$BE,$AF,
  $C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$C9,$CA,$CB,$CC,$CD,$CE,$CF,
  $D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$DE,$DF,
  $C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$C9,$CA,$CB,$CC,$CD,$CE,$CF,
  $D0,$D1,$D2,$D3,$D4,$D5,$D6,$F7,$D8,$D9,$DA,$DB,$DC,$DD,$DE,$FF)
 );
 
 CP1257TO775:TTransTable = (
  TransID:775;
  Values:(
  $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F,
  $10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$1D,$1E,$1F,
  $20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2A,$2B,$2C,$2D,$2E,$2F,
  $30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3A,$3B,$3C,$3D,$3E,$3F,
  $40,$41,$42,$43,$44,$45,$46,$47,$48,$49,$4A,$4B,$4C,$4D,$4E,$4F,
  $50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$5A,$5B,$5C,$5D,$5E,$5F,
  $60,$61,$62,$63,$64,$65,$66,$67,$68,$69,$6A,$6B,$6C,$6D,$6E,$6F,
  $70,$71,$72,$73,$74,$75,$76,$77,$78,$79,$7A,$7B,$7C,$7D,$7E,$7F,
  $5F,$5F,$27,$5F,$F7,$07,$C5,$C5,$5F,$25,$5F,$3C,$5F,$5F,$5F,$5F,
  $5F,$27,$EF,$F2,$A6,$07,$2D,$2D,$5F,$74,$5F,$3E,$5F,$C4,$5F,$5F,
  $FF,$5F,$96,$9C,$9F,$5F,$A7,$F5,$9D,$A8,$8A,$AE,$AA,$F0,$A9,$92,
  $F8,$F1,$FD,$FC,$5F,$E6,$F4,$FA,$9B,$FB,$8B,$AF,$AC,$AB,$F3,$91,
  $B5,$BD,$A0,$80,$8E,$8F,$B7,$ED,$B6,$90,$8D,$B8,$95,$E8,$A1,$EA,
  $BE,$E3,$EE,$E0,$E2,$E5,$99,$9E,$C6,$AD,$97,$C7,$9A,$A3,$CF,$E1,
  $D0,$D4,$83,$87,$84,$86,$D2,$89,$D1,$82,$A5,$D3,$85,$E9,$8C,$EB,
  $D5,$E7,$EC,$A2,$93,$E4,$94,$F6,$D6,$88,$98,$D7,$81,$A4,$D8,$5F)
 );
 
{==============================================================================}
{==============================================================================}
{Initialization Functions}
procedure CP1257ANSIInit;
begin
 {}
 {Check Initialized}
 if CP1257ANSIInitialized then Exit;

 {Load Default Code Pages}
 LoadPage(CP_ANSI_1257,@CPANSI1257,@CP1257Lower,@CP1257Upper);
 InstallTrans(CP_ANSI_1257,@CP1257TO775);

 CP1257ANSIInitialized:=True;
end;

{==============================================================================}
{==============================================================================}
{CP1257ANSI Functions}

{==============================================================================}
{==============================================================================}
{CP1257ANSI Helper Functions}

{==============================================================================}
{==============================================================================}

initialization
 CP1257ANSIInit;
 
{==============================================================================}
 
finalization
 {Nothing}

{==============================================================================}
{==============================================================================}

end.