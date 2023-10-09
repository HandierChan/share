import ctypes
import time
import requests
import os


def get_current_time():
    epoch_time = time.time()
    current_time = time.strftime("%Y%m%d%H%M", time.localtime(epoch_time))
    return current_time

def create_AppData_path(folder_name):
    tempPath=os.getenv('temp')
    pathName=os.path.normpath(f'{tempPath}/{folder_name}')
    if not os.path.exists(pathName):
        try:os.makedirs(pathName)
        except:pass
    return pathName

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
    download_path=create_AppData_path('Wallpaper')
    image_file=download_path+'/FY4B_'+get_current_time()+'.jpg'
    download_jpg(image_file)
    set_wallpaper(image_file)
    time.sleep(3600)
