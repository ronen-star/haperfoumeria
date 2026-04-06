# חיתוך שיר הפרפומריה: 1:53 עד 3:18 → audio/background.mp3
# הרצה: powershell -ExecutionPolicy Bypass -File cut_audio.ps1 "שם_הקובץ.mp3"

param(
    [Parameter(Mandatory=$true)]
    [string]$InputFile
)

$inputPath  = Join-Path $PSScriptRoot $InputFile
$outputPath = Join-Path $PSScriptRoot "audio\background.mp3"

if (-not (Test-Path $inputPath)) {
    Write-Host "שגיאה: הקובץ '$InputFile' לא נמצא בתיקיית הפרויקט"
    exit 1
}

Write-Host "חותך מ-1:53 עד 3:18 ..."
ffmpeg -y -i "$inputPath" -ss 00:01:53 -to 00:03:18 -c copy "$outputPath"

if ($LASTEXITCODE -eq 0) {
    Write-Host "הקובץ נשמר: audio\background.mp3"
    $duration = [math]::Round((3*60+18) - (1*60+53))
    Write-Host "אורך: $duration שניות"
} else {
    Write-Host "שגיאה בחיתוך"
}
