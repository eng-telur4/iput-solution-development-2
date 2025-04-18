# Server : Receive side
import socket

HOST = '0.0.0.0'  # Listen on all network interfaces
PORT = 12345      # Any port above 1024

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen(1)
    print(f"Server listening on port {PORT}...")

    conn, addr = s.accept()
    with conn:
        print('Connected by', addr)
        while True:
            data = conn.recv(1024)
            if not data:
                break
            print("Received:", data.decode())
            response = input("Reply to client: ")
            conn.sendall(response.encode())
