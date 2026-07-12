# Servidor local para o Calendário da Agência
# Execute este arquivo com: powershell -ExecutionPolicy Bypass -File server.ps1

$port = 8080
$root = $PSScriptRoot
$url = "http://localhost:$port/"

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($url)
$listener.Start()

Write-Host ""
Write-Host "  ======================================" -ForegroundColor Cyan
Write-Host "  🗓  Calendário da Agência - Servidor" -ForegroundColor Cyan
Write-Host "  ======================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  ✅ Servidor rodando em: $url" -ForegroundColor Green
Write-Host "  📱 Para acessar no celular, use o IP da sua rede Wi-Fi" -ForegroundColor Yellow
Write-Host "     Ex: http://192.168.1.X:$port" -ForegroundColor Yellow
Write-Host ""
Write-Host "  Pressione CTRL+C para parar o servidor" -ForegroundColor Gray
Write-Host ""

# Open browser
Start-Process $url

while ($listener.IsListening) {
    $context = $listener.GetContext()
    $request = $context.Request
    $response = $context.Response

    $localPath = $request.Url.LocalPath
    if ($localPath -eq "/") { $localPath = "/index.html" }

    $filePath = Join-Path $root $localPath.TrimStart('/')

    if (Test-Path $filePath -PathType Leaf) {
        $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
        $mime = switch ($ext) {
            ".html" { "text/html; charset=utf-8" }
            ".css"  { "text/css; charset=utf-8" }
            ".js"   { "application/javascript; charset=utf-8" }
            ".json" { "application/json; charset=utf-8" }
            ".png"  { "image/png" }
            ".jpg"  { "image/jpeg" }
            ".ico"  { "image/x-icon" }
            default { "application/octet-stream" }
        }
        $content = [System.IO.File]::ReadAllBytes($filePath)
        $response.ContentType = $mime
        $response.ContentLength64 = $content.Length
        $response.OutputStream.Write($content, 0, $content.Length)
    } else {
        $response.StatusCode = 404
        $msg = [System.Text.Encoding]::UTF8.GetBytes("404 - Not Found")
        $response.OutputStream.Write($msg, 0, $msg.Length)
    }
    $response.OutputStream.Close()
}
