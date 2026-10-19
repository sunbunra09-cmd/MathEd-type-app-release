# Install MathEd Type Publisher Certificate into CurrentUser Trusted Root Authorities
$certFile = Join-Path $PSScriptRoot "MathEdType-Publisher-Root.cer"
if (Test-Path $certFile) {
    certutil.exe -user -addstore Root "$certFile"
    certutil.exe -user -addstore TrustedPublisher "$certFile"
    Write-Host "MathEd Type Publisher Certificate registered into Trusted Root Authorities." -ForegroundColor Green
}