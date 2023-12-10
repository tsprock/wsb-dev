# Definieren Sie die Liste der URLs
$urls = @(
    "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user",
    "https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/Git-2.43.0-64-bit.exe"
    # Fügen Sie weitere URLs hinzu...
)

foreach ($url in $urls) {
    # Extrahieren Sie den Dateinamen aus der URL
    $filename = [System.IO.Path]::GetFileName($url)

    # Definieren Sie den Pfad, an dem die Datei gespeichert werden soll
    $outfile = "$env:TEMP\$filename"

    # Laden Sie die Datei herunter
    Invoke-WebRequest -Uri $url -OutFile $outfile

    # Führen Sie die heruntergeladene Datei im Hintergrund aus
    Start-Process -FilePath $outfile -ArgumentList "/verysilent /suppressmsgboxes /norestart" -NoNewWindow
}
