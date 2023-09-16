unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TMainForm = class(TForm)
    GameImage: TImage;
    GameTimerGraphics: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure GameTimerGraphicsTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  ball_x, ball_y, ball_center_x, ball_center_y, ball_w, ball_h, ball_size: integer;
  ball_speed_x, ball_speed_y: integer;
  ball_color: TColor;
  player1_x, player1_y, player1_w, player1_h, player1_center_y, player1_center_x: integer;
  player1_width, player1_height: integer;
  player2_x, player2_y, player2_w, player2_h, player2_center_y, player2_center_x: integer;
  player2_width, player2_height: integer;
  player1_score, player2_score: integer;
  player1_move, player2_move: integer;   //Переменные определяющие, нажата ли клавиша для движения.
  bot_mode, bonus_mode: integer;
  bonus_cube_x, bonus_cube_y, bonus_cube_w, bonus_cube_h: integer;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ball_color := rgb(random(255), random(255), random(255));
  ball_size := 50;
  ball_center_x := GameImage.Width div 2;
  ball_center_y := GameImage.Height div 2;
  ball_x := ball_center_x - ball_size div 2;
  ball_y := ball_center_y - ball_size div 2;
  ball_w := ball_x + ball_size;
  ball_h := ball_y + ball_size;
  ball_speed_x := 10;
  ball_speed_y := 10;

  player1_width := 20;
  player1_height := 100;
  player1_center_x := 15;
  player1_center_y := 100;
  player1_x := player1_center_x - player1_width div 2;
  player1_y := player1_center_y - player1_height div 2;
  player1_w := player1_x + player1_width;
  player1_h := player1_y + player1_height;

  player2_width := 20;
  player2_height := 100;
  player2_center_x := MainForm.Width - 55;
  player2_center_y := 105;
  player2_x := player2_center_x - player2_width div 2;
  player2_y := player2_center_y - player2_height div 2;
  player2_w := player2_x + player2_width;
  player2_h := player2_y + player2_height;

  player1_score := 0;
  player2_score := 0;

  player1_move := 0;
  player2_move := 0;
  bot_mode := 1;

  bonus_mode := 0;
end;

procedure TMainForm.GameTimerGraphicsTimer(Sender: TObject);
begin
  ball_center_x := ball_center_x + ball_speed_x;
  ball_center_y := ball_center_y + ball_speed_y;
  ball_x := ball_center_x - ball_size div 2;
  ball_y := ball_center_y - ball_size div 2;
  ball_w := ball_x + ball_size;
  ball_h := ball_y + ball_size;

  player1_width := 20;
  player1_height := 100;
  player1_center_x := 45;

  if (player1_move = -1) and (player1_y > 0) Then
    player1_center_y := player1_center_y + 10 * player1_move;
  if (player1_move = 1) and (player1_h < GameImage.Height) Then
    player1_center_y := player1_center_y + 10 * player1_move;

  if (player2_move = -1) and (player2_y > 0) Then
    player2_center_y := player2_center_y + 10 * player2_move;
  if (player2_move = 1) and (player2_h < GameImage.Height) Then
    player2_center_y := player2_center_y + 10 * player2_move;

  player1_x := player1_center_x - player1_width div 2;
  player1_y := player1_center_y - player1_height div 2;
  player1_w := player1_x + player1_width;
  player1_h := player1_y + player1_height;

  player2_width := 20;
  player2_height := 100;
  player2_x := player2_center_x - player2_width div 2;
  player2_y := player2_center_y - player2_height div 2;
  player2_w := player2_x + player2_width;
  player2_h := player2_y + player2_height;

  GameImage.Canvas.Brush.Color := clWhite;
  GameImage.Canvas.FillRect(GameImage.Canvas.ClipRect);
  GameImage.Canvas.Brush.Color := ball_color;
  GameImage.Canvas.Ellipse(ball_x, ball_y, ball_w, ball_h);
  if bonus_mode = 1 Then begin
    GameImage.Canvas.Rectangle(bonus_cube_x, bonus_cube_y, bonus_cube_w, bonus_cube_h);
    if ((ball_w > bonus_cube_x) and (ball_w < bonus_cube_w) and (ball_h > bonus_cube_y) and (ball_h < bonus_cube_h)) then begin
      bonus_mode := 0;
      if player1_score < player2_score then
        player1_score := player1_score + 5
      else
       player2_score := player2_score + 5;
      end;
       if ((ball_x > bonus_cube_x) and (ball_x < bonus_cube_w) and (ball_y > bonus_cube_y) and (ball_y < bonus_cube_h)) then begin
      bonus_mode := 0;
       if player1_score < player2_score then
        player1_score := player1_score + 5
      else
       player2_score := player2_score + 5;
      end;
  end;
  GameImage.Canvas.Brush.Color := clBlue;
  GameImage.Canvas.Rectangle(player1_x, player1_y, player1_w, player1_h);
  GameImage.Canvas.Rectangle(player2_x, player2_y, player2_w, player2_h);
  GameImage.Canvas.Brush.Color := clWhite;
  GameImage.Canvas.Font.Size := 20;
  GameImage.Canvas.TextOut(10, 10, IntToStr(player1_score));
  GameImage.Canvas.TextOut(GameImage.Width - 50, 10, IntToStr(player2_score));
  GameImage.Canvas.Font.Size := 10;
  if bot_mode = 1 Then
    GameImage.Canvas.TextOut(GameImage.Width div 2 - 180, GameImage.Height - 20, 'Для выключения режима Бота нажмите <<Enter>>...')
  else
    GameImage.Canvas.TextOut(GameImage.Width div 2 - 180, GameImage.Height - 20, 'Для включения режима Бота нажмите <<Enter>>...');


  if (ball_x <= GameImage.Left) then begin
    ball_speed_x := -ball_speed_x;
    ball_color := rgb(random(255), random(255), random(255));
    inc(player2_score);
    ball_center_x := ball_center_x + ball_speed_x;
  ball_center_y := ball_center_y + ball_speed_y;
  ball_center_x := GameImage.Width div 2;
  ball_center_y := GameImage.Height div 2;
  end;

  if (ball_w >= GameImage.Width) then begin
    ball_speed_x := -ball_speed_x;
    ball_color := rgb(random(255), random(255), random(255));
    inc(player1_score);
      ball_center_x := ball_center_x + ball_speed_x;
  ball_center_y := ball_center_y + ball_speed_y;
  ball_center_x := GameImage.Width div 2;
  ball_center_y := GameImage.Height div 2;
  end;

  if (ball_y <= GameImage.Top) or (ball_h >= GameImage.Height) then begin
    ball_speed_y := -ball_speed_y;
    ball_color := rgb(random(255), random(255), random(255));
  end;

  if (ball_x <= player1_w) and ((ball_y <= player1_h) and (ball_h >= player1_y)) then begin
    ball_speed_x := -ball_speed_x;
    ball_color := rgb(random(255), random(255), random(255));
      ball_center_x := ball_center_x + 2 * ball_speed_x;
  ball_center_y := ball_center_y + 2 * ball_speed_y;
  end;

  if (ball_w >= player2_x) and ((ball_y <= player2_h) and (ball_h >= player2_y)) then begin
    ball_speed_x := -ball_speed_x;
    ball_color := rgb(random(255), random(255), random(255));
      ball_center_x := ball_center_x + ball_speed_x;
  ball_center_y := ball_center_y + ball_speed_y;
  end;

  if (random(3) = 1) and (bot_mode = 1) then
  if ball_center_y  >= player2_center_y then
    player2_center_y := player2_center_y + random(5) + 5
  else
    player2_center_y := player2_center_y - random(5) - 5;


  if (bonus_mode = 0) and (random(100)= random(100)) Then begin
    bonus_mode := 1;
    bonus_cube_x := random(GameImage.Width - 200) + 100;
    bonus_cube_y := random(GameImage.Height - 200) + 100;
    bonus_cube_w := bonus_cube_x + 50;
    bonus_cube_h := bonus_cube_y + 50;
  end;
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 87 Then
    player1_move := -1;
  if key = 83 Then
    player1_move := 1;

  if bot_mode = 1 Then Begin
  if key = 38 Then
    player1_move := -1;
  if key = 40 Then
    player1_move := 1;
  end
  else Begin
    if key = 38 Then
    player2_move := -1;
  if key = 40 Then
    player2_move := 1;
  end;

  if key = 13 Then
    if bot_mode = 1 Then
      bot_mode := 0
    else
      bot_mode := 1;
end;

procedure TMainForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = 87 Then
    player1_move := 0;
  if key = 83 Then
    player1_move := 0;

  if bot_mode = 1 Then Begin
  if key = 38 Then
    player1_move := 0;
  if key = 40 Then
    player1_move := 0;
  end
  else Begin
    if key = 38 Then
    player2_move := 0;
  if key = 40 Then
    player2_move := 0;
  end;
end;

end.
