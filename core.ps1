param(
    [string]$acao,
    [string]$caminho
)

function Limpar-NodeModules {
    param([string]$raiz)
    Get-ChildItem -Path $raiz -Recurse -Directory -Force -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -eq "node_modules" } |
    ForEach-Object {
        Write-Output "Removendo: $($_.FullName)"
        Remove-Item $_.FullName -Recurse -Force -ErrorAction SilentlyContinue
    }
    Write-Output "Limpeza concluída."
}

function Organizar-Pasta {
    param([string]$pasta)

    $extensoes = @{
        'videos' = @('.mp4', '.mkv')
        'images' = @('.jpg', '.jpeg', '.png', '.gif')
        'pdfs'   = @('.pdf')
        'docs'   = @('.docx', '.txt')
    }

    foreach ($chave in $extensoes.Keys) {
        $destino = Join-Path $pasta $chave
        if (!(Test-Path $destino)) {
            New-Item -ItemType Directory -Path $destino | Out-Null
        }
    }
    $outros = Join-Path $pasta "others"
    if (!(Test-Path $outros)) {
        New-Item -ItemType Directory -Path $outros | Out-Null
    }

    Get-ChildItem -Path $pasta -File | ForEach-Object {
        $ext = $_.Extension.ToLower()
        $movido = $false
        foreach ($chave in $extensoes.Keys) {
            if ($extensoes[$chave] -contains $ext) {
                Move-Item $_.FullName -Destination (Join-Path $pasta $chave)
                Write-Output "Movido: $($_.Name) → $chave"
                $movido = $true
                break
            }
        }
        if (-not $movido) {
            Move-Item $_.FullName -Destination $outros
            Write-Output "Movido: $($_.Name) → others"
        }
    }
    Write-Output "Organização concluída."
}

if ($acao -eq "limpar") {
    Limpar-NodeModules -raiz $caminho
}
elseif ($acao -eq "organizar") {
    Organizar-Pasta -pasta $caminho
}
else {
    Write-Output "Ação inválida: $acao"
}
