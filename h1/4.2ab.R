x1 = 2*cos(2*pi*1:128*6/100) + 3*sin(2*pi*1:128*6/100) 
x2 = 4*cos(2*pi*1:128*10/100) + 5*sin(2*pi*1:128*10/100) 
x3 = 6*cos(2*pi*1:128*40/100) + 7*sin(2*pi*1:128*40/100) 
x =x1+x2+x3
par(mfrow=c(2,2))
plot.ts(x1, ylim=c(-10,10), main=expression(omega==6/100~~~A^2==13))
plot.ts(x2, ylim=c(-10,10), main=expression(omega==10/100~~~A^2==41))
plot.ts(x3, ylim=c(-10,10), main=expression(omega==40/100~~~A^2==85))
plot.ts(x,  ylim=c(-16,16), main="sum")

P = Mod(2*fft(x)/128)^2;  Fr = 0:127/128
plot(Fr, P, type="o", xlab="frequency", ylab="scaled periodogram")