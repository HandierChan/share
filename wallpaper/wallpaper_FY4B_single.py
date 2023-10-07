import ctypes
import time
import requests
import os


def download_jpg(file_name):
    try:
        # response = requests.get('http://img.nsmc.org.cn/CLOUDIMAGE/FY4B/AGRI/GCLR/FY4B_DISK_GCLR.JPG')
        response = requests.get('http://img.nsmc.org.cn/CLOUDIMAGE/FY4B/AGRI/GCLR/FY4B_REGC_GCLR.JPG',timeout=120)
        with open(file_name,'wb') as file:
            file.write(response.content)
    except:pass

def set_wallpaper(file_name):
    ctypes.windll.user32.SystemParametersInfoW(0x0014,0,file_name,3)

while True:
    image_file=os.getcwd()+'/wallpaper_FY4B.jpg'
    download_jpg(image_file)
    set_wallpaper(image_file)
    time.sleep(3600)
