import numpy as np
import matplotlib.pyplot as plt

def f(t,y):
    result=np.empty((y.shape[0]))
    result[0]=-0.5*y[0]+t*y[1]*y[2]
    result[1]=0.5*y[0]-0.25*y[1]
    result[2]=0.25*y[1]-1/6.0*y[2]
    return result

a,b=0,2
n=20
t=np.linspace(a,b,n)
yi=np.array([0,1,2])
h=(b-a)/n
yi1=np.empty((n,yi.shape[0]))
yi1[0,:]=yi.copy()

for i in range(n-1):
    k1=h*f(t[i],yi)
    k2=h*f(t[i]+h/2,yi+0.5*k1)
    k3=h*f(t[i]+h/2,yi+0.5*k2)
    k4=h*f(t[i+1],yi+k3)
    yi1[i+1,:]=yi+(k1+k2+k3+k4)/6.0
    yi=yi1[i+1,:].copy()

print(yi1)
plt.figure(figsize=(12,12))
plt.subplot(3,1,1)
plt.plot(t,yi1[:,0])
plt.subplot(3,1,2)
plt.plot(t,yi1[:,1]) 
plt.subplot(3,1,3)
plt.plot(t,yi1[:,2])
plt.savefig("results.jpg")