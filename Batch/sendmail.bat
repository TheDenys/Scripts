set RECIPIENT=%1

@for /R %%f in (*.rar) do (
  @rem :retry
  @echo sending: %%f
  @"c:\Program Files\CSSMTP\CSSMTP.exe" -f+%%f -hsmtp.mail.ru -mLOGIN -nmail@cc.net -ppassowrd -r%RECIPIENT% -omail@cc.net -ssubj -q || @echo %%f >> log.txt
  @rem if not %ERRORLEVEL% 0 goto retry
)