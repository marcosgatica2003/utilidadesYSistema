# import os
# from pytube import YouTube

# def download(link):
#     yt = YouTube(link)
#     yt = yt.streams.get_highest_resolution()
#     directorioActual = os.getcwd()

#     try:
#         yt.download(output_path = directorioActual)

#     except:
#         print("Error con la descarga!")

#     print("Hecho")

# if __name__ == "__main__":
#     link = input("Link: ")
#     download(link)


import os
import yt_dlp

def download(link):
    try:
        directorioActual = os.getcwd()
        ydl_opts = {
            'outtmpl': f'{directorioActual}/%(title)s.%(ext)s',
            'format': 'bestvideo[height<=720]+bestaudio/best[height<=720]',  
            'merge_output_format': 'mp4'
        }
        with yt_dlp.YoutubeDL(ydl_opts) as ydl:
            ydl.download([link])
        print("Hecho")

    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    link = input("Link: ")
    download(link)

