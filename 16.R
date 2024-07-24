library(ggplot2)
x<-c(2015,2016,2017,2018,2019)
y<-c(30,35,40,45,50)
df=data.frame(x,y)
print(df)
ggplot(df,aes(x=x,y=y))+
geom_area(fill='green',alpha=0.5)+
labs(title="yearly revenue",x="years",y="revenue")+
  theme_minimal()
