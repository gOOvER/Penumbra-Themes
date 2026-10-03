$toolbox = if (Test-Path "$env:LOCALAPPDATA\Playnite\Toolbox.exe") {
    "$env:LOCALAPPDATA\Playnite\Toolbox.exe"
} elseif (Test-Path "C:\Users\goove\AppData\Local\Playnite\Toolbox.exe") {
    "C:\Users\goove\AppData\Local\Playnite\Toolbox.exe"
} else {
    "Toolbox.exe"
}

Push-Location $PSScriptRoot
try {
    & $toolbox pack PenumbraNight .
    & $toolbox pack PenumbraBlur .
    & $toolbox pack PenumbraDawn .
} finally {
    Pop-Location
}
