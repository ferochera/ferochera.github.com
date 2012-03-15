    'script que muestra un msgbox para confirmar que se quiere apagar 
    ' el equipo linux remoto (llamado equipolinux y usando el usuario
    ' apagador) a traves de plink.
    ' Si la respuesta es afirmativa (OK) se envía la petición (apagar)
    ' El usuario apagador ya está configurado en el equipo de destino

    ' 4401 --> msgbox modal, defaultbutton = 2o. (cancel), icono-peligro, botones OK-cancel

    Option Explicit
    Dim ws, VarApplication
    Dim strMbox
    'On Error Resume Next
    strMbox = "."

    strMbox = MsgBox("Vas a apagar el equipo.linux ¿Quieres continuar?",4401,"Apagando EquipoLinux...")
    If strMbox = 1 Then
    Set ws = CreateObject("WScript.Shell")
    Set VarApplication = ws.Exec("""C:\Archivos de programa\PuTTY\plink.exe"" " & _
	"-T apagador@equipolinux " & _
	"-i ""C:\Documents and Settings\localusr\apagador\apagador_privkey.ppk"" " &_ 
	"sudo /sbin/shutdown -h -P now")
    Wscript.Sleep 1000
    ws.AppActivate "Apagando EquipoLinux"
    End If

    WScript.Quit
    ' End of example VBScript
