lista = []
listaMedia = []
contador = 0
listaFinal = []
respuesta = ""

with open('INFO.txt') as f:
    lines = f.readlines()

for i in lines:
    lista.append(i)

for i in lista:
    listaMedia.append(i)

for u in listaMedia:
    for i in lista:
        if u == i:
            contador += 1
        if contador >= 1:
            if " " in u:
                u = u.replace(" ", "")
            if u not in listaFinal:
                listaFinal.append(u)
            contador = 0

for u in listaFinal:
    respuesta = '"%s",' % u
    if "\n" in respuesta:
        respuesta = respuesta.replace("\n", "")
    print(respuesta)