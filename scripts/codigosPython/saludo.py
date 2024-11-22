import numpy as np
import matplotlib.pyplot as plt

#F
y1 = np.linspace(-1, 1, 100)
x1 = -1 * np.ones_like(y1)
x2 = np.linspace(-1, 0, 100)
y2 = np.ones_like(x2)
x3 = np.linspace(-1, 0, 100)
y3 = np.zeros_like(x3)

#E
y4 = np.linspace(-1, 1, 100)
x4 =  0.5 * np.ones_like(y4)
x5 = np.linspace(0.5, 1.5, 100)
y5 = np.ones_like(x5)
x6 = np.linspace(0.5, 1.5, 100)
y6 = np.zeros_like(x6)
x7 = np.linspace(0.5, 1.5, 100)
y7 = -1 * np.ones_like(x7)

#L
y8 = np.linspace(-1, 1, 100)
x8 = 2* np.ones_like(y8)
x9 = np.linspace(2, 3, 100)
y9 = -1 * np.ones_like(x9)

#I
y10 = np.linspace(-1, 1, 100)
x10 = 3.5 * np.ones_like(y10)

#Z
x11 = np.linspace(4, 5.5, 100)
y11 = np.ones_like(x11)
x12 = np.linspace(4, 5.5, 100)
y12 = -1 * np.ones_like(x12)
x13 = np.linspace(4, 5.5, 100)
y13 = (2/1.5) *(x13-5.5) + 1

#C
x14 = np.linspace(7.5, 9, 100)
y14 = np.ones_like(x14)
y15 = np.linspace(-1, 1, 100)
x15 = 7.5 * np.ones_like(y10)
x16 = np.linspace(7.5, 9, 100)
y16 = -1 * np.ones_like(x16)

#U
y17 = np.linspace(-1, 1, 100)
x17 = 9.5 * np.ones_like(y17)
y18 = np.linspace(-1, 1, 100)
x18 = 11 * np.ones_like(y17)
x19 = np.linspace(9.5, 11, 100)
y19 = -1 * np.ones_like(x19)

#M
y20 = np.linspace(-1, 1, 100)
x20 = 11.5 * np.ones_like(y20)
y21 = np.linspace(-1, 1, 100)
x21 = 13 * np.ones_like(y20)
x22 = np.linspace(11.5, 12.25, 100)
y22 = -2 * (x22 - 11.5) + 1
x23 = np.linspace(12.25, 13, 100)
y23 = 2 * (x23 - 12.25) -0.5

#P
y24 = np.linspace(-1, 1, 100)
x24 = 13.5 * np.ones_like(y24)
x25 = np.linspace(13.5, 14.5, 100)
y25 = 1 * np.ones_like(x25)
y26 = np.linspace(0, 1, 100)
x26 = 14.5 * np.ones_like(y26)
x27 = np.linspace(13.5, 14.5, 100)
y27 = 0 * np.ones_like(x27)

#L
y28 = np.linspace(-1, 1, 100)
x28 = 15* np.ones_like(y28)
x29 = np.linspace(15, 16, 100)
y29 = -1 * np.ones_like(x29)

#E
y30 = np.linspace(-1, 1, 100)
x30 =  16.5 * np.ones_like(y30)
x31 = np.linspace(16.5, 17.5, 100)
y31 = np.ones_like(x31)
x32 = np.linspace(16.5, 17.5, 100)
y32 = np.zeros_like(x32)
x33 = np.linspace(16.5, 17.5, 100)
y33 = -1 * np.ones_like(x33)

#T
x34 = np.linspace(19, 20.5, 100)
y34 = 1 * np.ones_like(x34)
y35 = np.linspace(-1, 1, 100)
x35 = 19.75 * np.ones_like(y35)

#I
y36 = np.linspace(-1, 1, 100)
x36 = 21 * np.ones_like(y36)

#O
y37 = np.linspace(-1, 1, 100)
x37 = 21.5 * np.ones_like(y37)
y38 = np.linspace(-1, 1, 100)
x38 = 23 * np.ones_like(y38)
x39 = np.linspace(21.5, 23, 100)
y39 = -1 * np.ones_like(x39)
x40 = np.linspace(21.5, 23, 100)
y40 = 1 * np.ones_like(x40)

plt.plot(x1, y1, label="")
plt.plot(x2, y2, label="")
plt.plot(x3, y3, label="")
plt.plot(x4, y4, label="")
plt.plot(x5, y5, label="")
plt.plot(x6, y6, label="")
plt.plot(x7, y7, label="")
plt.plot(x8, y8, label="")
plt.plot(x9, y9, label="")
plt.plot(x10, y10, label="")
plt.plot(x11, y11, label="")
plt.plot(x12, y12, label="")
plt.plot(x13, y13, label="")
plt.plot(x14, y14, label="")
plt.plot(x15, y15, label="")
plt.plot(x16, y16, label="")
plt.plot(x16, y16, label="")
plt.plot(x17, y17, label="")
plt.plot(x18, y18, label="")
plt.plot(x19, y19, label="")
plt.plot(x20, y20, label="")
plt.plot(x21, y21, label="")
plt.plot(x22, y22, label="")
plt.plot(x23, y23, label="")
plt.plot(x24, y24, label="")
plt.plot(x25, y25, label="")
plt.plot(x26, y26, label="")
plt.plot(x27, y27, label="")
plt.plot(x28, y28, label="")
plt.plot(x29, y29, label="")
plt.plot(x30, y30, label="")
plt.plot(x31, y31, label="")
plt.plot(x32, y32, label="")
plt.plot(x33, y33, label="")
plt.plot(x34, y34, label="")
plt.plot(x35, y35, label="")
plt.plot(x36, y36, label="")
plt.plot(x37, y37, label="")
plt.plot(x38, y38, label="")
plt.plot(x39, y39, label="")
plt.plot(x40, y40, label="")


plt.xlim([-5, 40])
plt.ylim([-2, 2])
plt.gca().set_aspect('equal', adjustable='box')
plt.grid(False)
plt.title("")
plt.show()

