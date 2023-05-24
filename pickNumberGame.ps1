
$NumberToGuess = 1..100 | Get-Random
do {
  $UserGuess = Read-Host -Prompt "Please enter a number between 1 and 100"
  if ($UserGuess -lt $NumberToGuess) {write-host "Pick a higher number"}
  elseif ($UserGuess -gt $NumberToGuess) {write-host "Pick a lower number"}
  else {write-host "Congrats! You picked the right number"}
} until ($NumberToGuess -eq $UserGuess)