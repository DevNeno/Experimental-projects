import socket
import threading

class Node:
    
    def __init__(self, port):
        self.server = socket.socket()
        self.client = socket.socket()
        self.aux = None
        self.port = port
        self.threads = []

    def start(self):
        self.server.bind(('127.0.0.1', self.port))
        self.server.listen(5)
        listener = threading.Thread(target=self.listen)
        self.threads.append(listener)
        listener.start()
        print("NODE STARTED")

        
    def connect(self, port):
        if not self.client.fileno() == -1:
            self.client.connect(('127.0.0.1', port))
            print("CONNECT")

    def listen(self):
        while True:
            if not self.client.fileno() == -1:
                c, addr = self.server.accept()
                self.aux = c
                self.client.connect(('127.0.0.1', 23457))
                print("CONNECT [LISTEN VERSION]")
                reader = threading.Thread(target=self.read)
                self.threads.append(reader)
                reader.start()

    def read(self):
        while True:
            print("[REMOTE]", self.client.recv(1024).decode())

    def send_message(self, message):
        self.aux.send(message.encode())
        print("MESSAGE SENDED!")

