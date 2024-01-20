local coinCount = 0
local life = 0

function verifyCoins()
	while coinCount < 100 do
		local remainingCoin = 100 - coinCount
		print("Faltam " .. remainingCoin .. " moedas para ganhar uma vida")
		coinCount = coinCount + 5

		if coinCount >= 100 then
			life = life + 1
			print("Você ganhou uma vida.")
			print("Moedas coletadas: " .. coinCount .. "\nVidas: " .. life)
		end
	end
end

verifyCoins()