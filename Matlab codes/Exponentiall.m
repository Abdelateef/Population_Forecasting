format long g
clear
clc
data = [1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 ];
x1 = [1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 ];
y1 = [66 68.5 70.9 73.4 76 78.6 81.1 83.7 86.3 88.9 91.5 94.2 96.9 99.7 102.6 105.5 108.4 111.3 114.3 117.3 120.3 123.4 ];
y2=log(y1);
x1=reshape(x1,22,1);
y2=reshape(y2,22,1);
x2=1;
for c=1:21
    x2(end+1)=1;
end
x2=reshape(x2,22,1);
x1=[x2 x1];
m1=transpose(x1)*x1;
m2=transpose(x1)*y2;
m3=inv(m1)*m2;

a=exp(m3(1));

b=m3(2);
syms y(r)
y(r)=a*exp(b*r);
x3=1999:1:2020;
plot(x3,y(x3),'g')
hold on
scatter(data,y1)
xlabel("Years")
ylabel("Population * 10^6")
legend("error = 2.61%")
numerical_year=vpa(y(x3));
numerical_year=reshape(numerical_year,22,1);
y1=transpose(y1);
error=(numerical_year-y1)./y1;
error=transpose(error);
real_error=norm(error,Inf)*100;