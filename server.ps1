# server.ps1 - Lightweight Local Web Server for TruthScan AI
$Port = 4173
$Root = $PSScriptRoot

# Check if environment GEMINI_API_KEY is present
if (-not $env:GEMINI_API_KEY) {
    $env:GEMINI_API_KEY = "AQ.Ab8RN6Kzz2fpjNgcZ967IC_VGYAu8WckzxFWxB1E9lyk69s8Iw"
}
$HasEnvKey = [bool]$env:GEMINI_API_KEY

$Listener = New-Object System.Net.HttpListener
$Listener.Prefixes.Add("http://localhost:$Port/")
$Listener.Prefixes.Add("http://127.0.0.1:$Port/")

$Listener.Start()

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  ✨ TRUTHSCAN AI - LOCAL SERVER RUNNING" -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  🌐 Web App: http://localhost:$Port" -ForegroundColor Green
if ($HasEnvKey) {
    Write-Host "  🔑 Gemini API Key detected in environment!" -ForegroundColor Green
} else {
    Write-Host "  ℹ️  Tip: You can set `$env:GEMINI_API_KEY or configure it directly in the UI." -ForegroundColor DarkGray
}
Write-Host "  Press Ctrl+C to stop the server.`n" -ForegroundColor DarkGray

Start-Process "http://localhost:$Port"

while ($Listener.IsListening) {
    try {
        $Context = $Listener.GetContext()
        $Request = $Context.Request
        $Response = $Context.Response

        $UrlPath = $Request.Url.LocalPath.TrimStart('/')
        if ([string]::IsNullOrEmpty($UrlPath)) { $UrlPath = "standalone.html" }

        $FilePath = Join-Path $Root $UrlPath

        if (Test-Path $FilePath -PathType Leaf) {
            $Bytes = [System.IO.File]::ReadAllBytes($FilePath)

            if ($FilePath.EndsWith(".html")) { $Response.ContentType = "text/html; charset=utf-8" }
            elseif ($FilePath.EndsWith(".css")) { $Response.ContentType = "text/css" }
            elseif ($FilePath.EndsWith(".js")) { $Response.ContentType = "application/javascript" }
            elseif ($FilePath.EndsWith(".json") -or $FilePath.EndsWith(".webmanifest")) { $Response.ContentType = "application/manifest+json" }
            elseif ($FilePath.EndsWith(".svg")) { $Response.ContentType = "image/svg+xml" }
            elseif ($FilePath.EndsWith(".png")) { $Response.ContentType = "image/png" }
            elseif ($FilePath.EndsWith(".jpg") -or $FilePath.EndsWith(".jpeg")) { $Response.ContentType = "image/jpeg" }
            else { $Response.ContentType = "application/octet-stream" }

            $Response.Headers.Add("Cache-Control", "no-cache")
            $Response.OutputStream.Write($Bytes, 0, $Bytes.Length)
        } else {
            # Fallback to standalone.html
            $FallbackPath = Join-Path $Root "standalone.html"
            $Bytes = [System.IO.File]::ReadAllBytes($FallbackPath)
            $Response.ContentType = "text/html; charset=utf-8"
            $Response.OutputStream.Write($Bytes, 0, $Bytes.Length)
        }
        $Response.Close()
    } catch {
        # ignore context interruptions
    }
}
