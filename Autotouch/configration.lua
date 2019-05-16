local xEkran, yEkran = getScreenResolution();



if xEkran == 1242 then -- 6p/ 6sp/ 7p içindir.
	--ana ekrandaki oyun başla butonu x, y, renk
	local oyunbasla_btn = {633, 2086, 15073280}

	-- bit toplama ekranındaki oyun başla butonu
	local oyunbasla_btn2 = {660, 1280, 16777215}

	-- bit toplama ekranindaki x harfi
	local sari_x = {257, 159, 16765440}

	-- seviye atlayınca çıkan buton
	local devamet_btn = {200, 1800, 14369535}

	-- arkadaşınla paylaş butonu her toplama sonu
	local paylas = {200, 1800, 15073280}


	--çarpi,  oyun sonunda cikar
	local carpi = {1130, 245, 16777215}


	-- bit yoktaki k harfi
	local bityok = {585, 1945, 16777215}

	-- fake gps ackapa butonu açıksa renk= 16316404 kapalıysa renk= 31487
	local gps_ackapa_btn = {620, 2140, 16316404}

	-- fake gps ortala butonu rengi= 31487
	local gps_ortala_btn = {1150, 2150}


elseif xEkran == 750 then --6, 6s, 7, modelleri içindir.
	--ana ekrandaki oyun başla butonu
	local oyunbasla_btn = {380, 1250, 15073280}

	--bit toplama ekranındaki oyunbaşla butonu "B"
	local oyunbasla_btn2 = {401, 783, 16777215}

	-- bit toplama ekranindaki x harfi
	local sari_x = {164, 106, 16765440}

	-- seviye atlayınca çıkan buton
	local devamet_btn = {90, 1090, 14369535}

	-- arkadaşınla paylaş butonu her toplama sonu
	local paylas = {90, 1090, 15073280}


	-- çarpi,  oyun sonunda cikar
	local carpi = {674, 164, 16777215}


	-- bit yoktaki "k" harfi
	local bityok = {352, 1158, 16777215}

	-- fake gps ackapa butonu açıksa renk= 16316404 kapalıysa renk= 31487
	local gps_ackapa_btn = {375, 1290, 16316404}

	-- fake gps ortala butonu rengi= 31487
	local gps_ortala_btn_x = {700, 1275, 31487}

else
	alert("herhangi bir cihaz tespit edilemedi. ekran boyutu: " .. xEkran .. " " .. yEkran)
end



