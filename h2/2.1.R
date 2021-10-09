install.packages('astsa')

library(astsa)
t=time(jj) - 1970
Q= factor(cycle(jj))
reg=lm(log(jj)~0+t+Q, na.action=NULL)
summary(reg)

plot(log(jj))
lines(fitted(reg),col="green")  

#b
estimated = reg$fit
estimated
sum = 0
v = seq(1,77,4)
for(i in v){
  pre = estimated[i]+estimated[i+1]+estimated[i+2]+estimated[i+3]
  post = estimated[i+4]+estimated[i+5]+estimated[i+6]+estimated[i+7]
  sum = sum + post - pre
}
ave = sum/20
ave

#c
estimated = reg$fit
sum = 0
v = seq(3,83,4)
for(i in v){
  pre = estimated[i]
  post = estimated[i+1]
  percent = (post-pre)/pre
  sum = sum + percent
}
ave = sum/21
ave

plot.ts(resid(reg)) 
acf(resid(reg),20)

t=time(jj) - 1970
Q= factor(cycle(jj))
reg2=lm(log(jj)~t+Q, na.action=NULL)
summary(reg2)

plot(log(jj))
lines(fitted(reg),col="green")  


