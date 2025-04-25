# server.py
import socket

HOST = '192.168.1.20'  # サーバ側のIP
PORT = 50001           # 適当な非Well-knownポート番号

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen(1)
    print(f"Server listening on {HOST}:{PORT}")
    conn, addr = s.accept()
    with conn:
        print(f"Connected by {addr}")
        while True:
            data = conn.recv(1024)
            if not data:
                break
            print("Received:", data.decode())
            conn.sendall(data)
