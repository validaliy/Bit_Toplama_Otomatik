----------------------------------------------
----------------  ayarlar  ------------------
----------------------------------------------



----------------------------------------------
------------ayarlar  bitis  ------------------
----------------------------------------------



----------------------------------------------
----------------  converter  -----------------
----------------------------------------------

local xEkran, yEkran = getScreenResolution();


function tap2(x, y)
	usleep(1000);
	tap(x*xEkran/750, y*yEkran/1334);
	usleep(1000);
end

function bass(id, x, y)
	touchDown(id, x*xEkran/750, y*yEkran/1334);
	usleep(1000000);
	touchUp(id, x*xEkran/750, y*yEkran/1334);
	usleep(1000);
end




----------------------------------------------
----------- converter bitis  -----------------
----------------------------------------------



----------------------------------------------
-------------- Check Fonksiyonu --------------
----------------------------------------------

function check()
	while true do
		appActivate("com.vodafone.datahunters");

		-- bit toplama ekranı bit topla butonu
		local bittoplaa = getColor(163*xEkran/750, 107*yEkran/1334);
		if bittoplaa == 16765440 then
			tap2(260, 780);
			bittopla();
		end


		-- mağazaya git ekranı
		local magaza = getColor(100*xEkran/750, 1200*yEkran/1334);
		if magaza == 14369535 then
			tap2(673, 164); -- çarpı
		end


		-- seviye atladınız ekranı
		local seviye = getColor(345*xEkran/750, 350*yEkran/1334);
		if seviye == 0 then
			tap2(100, 1038);-- devam et
		end


		--oyun başla butonu
		local oyunbasla = getColor(100*xEkran/750, 1200*yEkran/1334);
		if oyunbasla == 15073280 then
			tap2(100, 1200);
		end




		usleep(4000000);
		local bityok = getColor(100*xEkran/750, 1200*yEkran/1334);
		if bityok == 6690107 then
			usleep(10000);
			appActivate("cn.tinyapps.XGPSFree");
			usleep(100000);
			fakegpsbekle();
			ortala2();
			sagbas();
		end -- if bit yok





		usleep(1000000);
	end -- while
end 
----------------------------------------------
-------------- Check Fonksiyonu --------------
----------------------------------------------





----------------------------------------------
----------- bit topla -----------
----------------------------------------------
function bittopla()
	while true do --bitleri toplama

		local bitler = findColor(11862016, 1, {1, yEkran/14, xEkran, yEkran}); --bitleri arama

		for i, v in pairs(bitler) do
			tap(v[1], v[2]);
			usleep(10);
		end


		local bitis = getColor(16*xEkran/750, 15*yEkran/1334); -- 15539492
		if bitis == 15539492 then
			break
		end -- mağaza butonunu görünce döngüyü surdur

	end --while döngü bitişi
end -- bit topla fonksiyon




function bittopla_sirali()
	while true do



	for x = 1, xEkran, 100 do
		for y = 150, yEkran, 150 do
			local bitis = getColor(16*xEkran/750, 15*yEkran/1334); -- 15539492
		if bitis == 15539492 then
			break
		end -- mağaza butonunu görünce döngüyü surdur



			tap(x, y);
			usleep(10);
		end
	end



	end --while döngü bitişi
end -- bit topla fonksiyon






function bittopla_random()
	while true do

		x = math.random(1, xEkran);
		y = math.random(150, yEkran);
		tap(x, y);




		local bitis = getColor(16*xEkran/750, 15*yEkran/1334); -- 15539492
		if bitis == 15539492 then
			break
		end -- mağaza butonunu görünce döngüyü surdur

	end --while döngü bitişi
end -- bit topla fonksiyon
----------------------------------------------
----------- bit topla biti -----------
----------------------------------------------






----------------------------------------------
----------- fake location -----------
----------------------------------------------
function ortala()
	tap2(50, 1290); -- lokasyon tuşu
end

function ortala2()
	tap2(700, 1280);
end

function basla()
	local durmus = getColor(375, 1290);
	if durmus == 31487 then
		tap2(375, 1290);
	end
end


function durdur()
	local acik = getColor(375, 1290);
	if acik == 16316404 then
		tap2(375, 1290);
	end
end


function sagbas()
	bass(0, 627, 795);
end


function solbas()
	bass(0, 127, 795);
end


function yukaribas()
	bass(0, 127, 543);
end


function asagibas()
	bass(0, 375, 1047);
end


function fakegpsbekle()
	while true do
		local fakegpsbekle = getColor(700, 1275);
		if fakegpsbekle == 31487 then
			break
		end -- if
		usleep(100000);
	end -- while


	while true do -- while 2 başlatma
		local acik = getColor(375, 1290);
		if acik == 16316404 then --if1
			break -- zaten açık
		else
			usleep(3000000);
			basla();
			usleep(100000);
			local ok = getColor(366, 753); 
			if ok == 31487 then --if2
				tap(369, 763); --ok
				usleep(100000);
			else
				break
			end --if2
		end-- if1
	end --while 2


end -- function


----------------------------------------------
----------- fake location bitis. -----------
----------------------------------------------

local f=io.open("/Applications/XGPSFree.app","r")

if f~=nil then 
	io.close(f);
	check();
else
	alert("XGPSFree uygulaması bulunamadı");
	openURL("http://cydia.saurik.com/package/cn.tinyapps.xgpsfree/")
end