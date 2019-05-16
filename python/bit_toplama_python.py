
# -*- coding: utf-8 -*-
# 505 X 65 /  860 X 680 pixeller
# 776x96 sola git / 836x96 sağa git / 808x67 yukarı / 808x132 aşağı
# çarpi x = 838, y = 138
import pyautogui
import time
import random
import win32api, win32con

ekran_bekleme = 10
yontem = "sıralı"
yon = "sağ"

""" dizide 0 x konumu, 1 y konumu, 2 3"""
# Butonlar
carpi =[838, 138]
sari_x = [554, 105, 241, 176, 12]
tamam = [587, 404, 250, 0, 0] # günlük bit toplama bitti veya konum doğrulanmadı hatası

#konum
konum_sag = [836, 96]
konum_sol = [776, 96]
konum_yukari = [808, 67]
konum_asagi = [808, 132]
konum_saniye = 1 # konum değiştirme tuşuna basılı tutma süresi

#istatistik
toplandi = 0
def tikla(x,y):
    win32api.SetCursorPos((x,y))
    win32api.mouse_event(win32con.MOUSEEVENTF_LEFTDOWN,x,y,0,0)
    win32api.mouse_event(win32con.MOUSEEVENTF_LEFTUP,x,y,0,0)
    #time.sleep(0.00001)
def git(yon = "sağ"):
    if yon == "sağ":
        pyautogui.mouseDown(konum_sag[0], konum_sag[1])
        time.sleep(konum_saniye)
        pyautogui.mouseUp(konum_sag[0], konum_sag[1])
    elif yon == "sol":
        pyautogui.mouseDown(konum_sol[0], konum_sol[1])
        time.sleep(konum_saniye)
        pyautogui.mouseUp(konum_sol[0], konum_sol[1])
    elif yon == "yukarı":
        pyautogui.mouseDown(konum_yukari[0], konum_yukari[1])
        time.sleep(konum_saniye)
        pyautogui.mouseUp(konum_yukari[0], konum_yukari[1])
    elif yon == "aşağı":
        pyautogui.mouseDown(konum_asagi[0], konum_asagi[1])
        time.sleep(konum_saniye)
        pyautogui.mouseUp(konum_asagi[0], konum_asagi[1])

    else:
        print(saat(), " yukarı, aşağı, sol ve sağ yönler vardır sadece")

def bittopla(yontem = "random"):
    global toplandi
    toplandi += 1
    print(saat(), " ", str(toplandi),". kez bit toplanmaya başlandı. yöntem: ", yontem)
    time.sleep(3)
    tikla(690, 420)
    if yontem == "random":
        while True:
            if bittimi():
                print(saat(), " random bit toplama bitti.")
                break
            x = random.randint(505, 860)
            y = random.randint(137, 680)
            tikla(x, y)
    elif yontem == "ara":
        while True:
            if bittimi():
                print(saat(), " ara bit toplama bitti.")
                break
            x = random.randint(505, 860)
            y = random.randint(137, 680)
            eslesme = pyautogui.pixelMatchesColor(x, y, (0, 0, 0))
            if eslesme:
                tikla(x, y)
    elif yontem == "ara_resimli":
        while True:
            try:
                if bittimi():
                    print(saat(), " ara_resimli bit toplama bitti.")
                    break
                x, y = pyautogui.locateCenterOnScreen('.\\ekler\\bit.png', region=(505, 137, 250, 543), grayscale=True)
                tikla(x, y)
            except TypeError:
                pass
    elif yontem == "sıralı":
        bitis = 0
        while bitis == 0:
            for x in range(517, 860, 60):
                if bitis == 1:
                    break
                for y in range(137, 680, 60):
                    if bittimi():
                        print(saat(), " sıralı bit toplama bitti.")
                        bitis = 1
                        break
                    tikla(x, y)

    else:
        pyautogui.alert(text="sadece random, ara, ara_resimli ve sıralı yöntemleri var.", title="Uyarı", button="Tamam")

def saat():
    return (str(time.strftime('%X')))

def bittimi():
    x_isareti = pyautogui.pixelMatchesColor(sari_x[0], sari_x[1], (sari_x[2], sari_x[3], sari_x[4]))
    if x_isareti:
        return False
    else:
        return True



def check():
    while True:
        bekleniyor = pyautogui.pixelMatchesColor(700, 389, (36, 8, 16))
        if bekleniyor: # ana ekranda bir şey dönüyor. onun bitmesini bekliyor
            print(saat(), " bekleniyo")
            time.sleep(10)
            continue

        paylas = pyautogui.pixelMatchesColor(580, 580, (250, 0, 0)) #arkadaşınla paylaş (tebrikler ekranı)
        if paylas:
            tikla(carpi[0], carpi[1])
            print(saat(), " tebrikler ekranında çarpıya basıldı")
            time.sleep(3)
            continue
        devam_et = pyautogui.pixelMatchesColor(580, 580, (156, 42, 160))
        if devam_et: #seviye atladınız ekranı
            print(saat(), " devam et butonuna tıklanacak")
            tikla(580, 580)
            time.sleep(3)
            continue


        oyunbasla_btn = pyautogui.pixelMatchesColor(550, 650, (250, 0, 0))
        if oyunbasla_btn:
            print(saat(), " oyun basla btn bulundu ve tıklanacak")
            tikla(550, 650)
            time.sleep(4)
            bittopla(yontem)
            time.sleep(3)
            continue

        bit_yok = pyautogui.pixelMatchesColor(639, 668, (255, 255, 255))
        if bit_yok:
            print(saat(), " bit yok yön değişecek")
            git(yon)
            time.sleep(4)
            continue

        bittoplamaEkrani = pyautogui.pixelMatchesColor(sari_x[0], sari_x[1], (sari_x[2], sari_x[3], sari_x[4])) # sari_x var
        if bittoplamaEkrani:
            bittopla(yontem)
            continue
        hata = pyautogui.pixelMatchesColor(tamam[0], tamam[1], (tamam[2], tamam[3], tamam[4]))
        if hata:
            print(saat(), " HATA: Günlük bittoplama sınırına ulaşıldı veya konumun doğrulanmadı.")
            break

        print(saat(), " Tanıdık ekrana rastlanmadı. ", str(ekran_bekleme), " saniye beklenecek")
        time.sleep(ekran_bekleme)
check()