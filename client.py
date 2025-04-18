# Cliet : Send side
import socket

SERVER_IP = '192.168.x.x'  # Replace with the server's IP on LAN
PORT = 12345

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect((SERVER_IP, PORT))
    print("Connected to server.")
    
    while True:
        message = input("Send to server: ")
        s.sendall(message.encode())
        data = s.recv(1024)
        print("Received:", data.decode())
