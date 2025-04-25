# Send side
import socket

SEND_ID = '192.168.1.20'    # 受信PCのIPアドレス
SEND_PORT = 50001           # 受信PCのポート番号

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect((SEND_ID, SEND_PORT))
    print("Connected to server.")
    
    while True:
        message = input("Send to server: ")
        s.sendall(message.encode())
        data = s.recv(1024)
        print("Received:", data.decode())
