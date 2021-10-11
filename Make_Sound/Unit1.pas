unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MMSystem, Math;

type
  TForm1 = class(TForm)
    Button1: TButton;
    RDBSinusoide: TRadioButton;
    RDBCarre: TRadioButton;
    RDBTriangle: TRadioButton;
    RDBDentScie: TRadioButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure MakeSound(Frequency, Duration: Integer; Volume: Integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.MakeSound(Frequency, Duration: Integer; Volume: Integer);
var
  WaveFormatEx: TWaveFormatEx;
  MS: TMemoryStream;
  i, TempInt, DataCount, RiffCount: integer;
  SoundValue: byte;
  t: double;
const
  Mono: Word = $0001;
  SampleRate: Integer = 44100;
  RiffId: string = 'RIFF';
  WaveId: string = 'WAVE';
  FmtId: string = 'fmt ';
  DataId: string = 'data';
begin
  with WaveFormatEx do
   begin
    wFormatTag := WAVE_FORMAT_PCM;
    nChannels := Mono;
    nSamplesPerSec := SampleRate;
    wBitsPerSample := $0008;
    nBlockAlign := (nChannels * wBitsPerSample) div 8;
    nAvgBytesPerSec := nSamplesPerSec * nBlockAlign;
    cbSize := 0;
   end;

  MS := TMemoryStream.Create;

 with MS do
  begin
    DataCount := (Duration * SampleRate) div 1000;
    RiffCount := Length(WaveId) + Length(FmtId) + SizeOf(DWORD) +
    SizeOf(TWaveFormatEx) + Length(DataId) + SizeOf(DWORD) + DataCount;

    Write(RiffId[1], 4);
    Write(RiffCount, SizeOf(DWORD));
    Write(WaveId[1], Length(WaveId));
    Write(FmtId[1], Length(FmtId));

    TempInt := SizeOf(TWaveFormatEx);

    Write(TempInt, SizeOf(DWORD));
    Write(WaveFormatEx, SizeOf(TWaveFormatEx));
    Write(DataId[1], Length(DataId));
    Write(DataCount, SizeOf(DWORD));

    for i := 0 to DataCount - 1 do
     begin
      t := (i * Frequency / SampleRate);

      if RDBSinusoide.Checked then SoundValue := 127 + trunc(Volume * sin(2 * pi * t));
      if RDBCarre.Checked then SoundValue := 127 + trunc(Volume * sign(sin(2 * pi * t)));
      if RDBTriangle.Checked then SoundValue := 127 + trunc(Volume * (2 * abs(2 * t - 2 * floor(t) - 1 ) - 1));
      if RDBDentScie.Checked then SoundValue := 127 + trunc(Volume * (2 * (t - floor(t + 0.5))));

      Write(SoundValue, SizeOf(Byte));
     end;

   sndPlaySound(MS.Memory, SND_MEMORY or SND_SYNC);
   MS.Free;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 MakeSound(440, 1000, 25);
end;

end.
