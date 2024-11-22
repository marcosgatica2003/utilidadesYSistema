datos = [65, 36, 49, 84, 79, 56, 38, 43, 67, 36,
         43, 78, 37, 40, 68, 72, 55, 62, 32, 82,
         88, 50, 60, 56, 57, 46, 39, 57, 73, 65,
         59, 48, 76, 74, 70, 51, 40, 75, 56, 45,
         35, 62, 58, 49, 76, 38, 53, 43, 42, 51]

sumatoria = sum(datos)
print(f"La sumatoria es {sumatoria}")

media = 55.9
s = 15.11
numerador = sum((x - media) ** 3 for x in datos)
resultado = (numerador/50)/((s)*(s)*(s))

#print(f"Numerador {numerador}")
#print(f"resultado {resultado}")

r = 3
k = media
momento = sum(x ** r for x in datos) / len(datos)
momentoRespectoALaMedia = sum((x-k))** r for x in datos)/len(datos)
print(f"MOmento de orden {r} es igual a {momentoRespectoALaMedia}")

