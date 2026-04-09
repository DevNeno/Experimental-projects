from node2 import Node

node = Node(23457)

node.start()

while True:
    print("LOOPED")
    inp = input()
    if inp == '1':
        node.connect(23456)
    elif inp == '2':
        mess = input("Ingrese el mensaje: ")
        node.send_message(mess)
