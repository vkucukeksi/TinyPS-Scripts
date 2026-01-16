$PokemonNum = 250
if($PokemonNum -ge 0 -and $PokemonNum -le 151) {
    Write-Host "Your Pokemon is from Kanto!"
} Elseif ($PokemonNum -ge 152 -and $PokemonNum -le 251) {
    Write-Host "Your Pokemon is from Johto!" 
} Elseif ($PokemonNum -ge 252 -and $PokemonNum -le 386) {
    Write-Host "Your Pokemon is from Hoenn!" 
    }