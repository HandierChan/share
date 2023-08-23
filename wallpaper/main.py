import ctypes
import time
import requests
import os


def create_AppData_path(folder_name):
    appdataPath=os.getenv('appdata')
    pathName=os.path.normpath(f'{appdataPath}/{folder_name}')
    if not os.path.exists(pathName):
        try:os.makedirs(pathName)
        except:pass
    else:return pathName

def download_jpg(file_name):
    # response = requests.get('http://img.nsmc.org.cn/CLOUDIMAGE/FY4B/AGRI/GCLR/FY4B_DISK_GCLR.JPG')
    response = requests.get('http://img.nsmc.org.cn/CLOUDIMAGE/FY4B/AGRI/GCLR/FY4B_REGC_GCLR.JPG')
    with open(file_name,"wb") as file:
        file.write(response.content)

def set_wallpaper(file_name):
    ctypes.windll.user32.SystemParametersInfoW(0x0014,0,file_name,3)



image_path=create_AppData_path('Wallpaper')

while True:
    try:
        download_jpg(image_path+'/FY4B.jpg')
        set_wallpaper(image_path+'/FY4B.jpg')
        time.sleep(3600)
    except:
        # time.sleep(600)
        pass
