from Box import Box
from Pyramid import Pyramid
from Sphere import Sphere

#Box
box1=Box(Box)
print(box1.calcVol)
box1.l = float(input('entervalue for box length: '))
print(box1.l)
box1.w = float(input('enter value for box width: '))
print(box1.w)
box1.h = float(input('enter value for box height: '))
print('Box Volume: ', box1.calcVol())
print('Box Surface Area: ', box1.calcSA())

#Pyramid 
p1= Pyramid(Pyramid)
p1.l = float(input('enter value for pyramid length: '))
print(p1.l)
p1.w = float(input('enter value for pyramid width: '))
print(p1.w)
p1.h = float(input('enter value for pyramid height: '))
print(p1.h)
print('Pyramid Volume: ' + str(p1.calcVol()))
print('Pyramid Surface Area: ' + str(p1.calcSA()))

#Sphere 
s1 = Sphere (Sphere)
s1.r = float(input('enter value for sphere radius : '))
print(s1.r)
print('Pyramid Volume: ' + str(s1.calcVol()))
print('Pyramid Surface Area: ' + str(s1.calcSA()))

