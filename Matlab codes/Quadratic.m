
%% code for Quadratic Data Curve Fitting
clear
clc
%data points 
x1 = [1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 ]; %number of years
y1 = [66 68.5 70.9 73.4 76 78.6 81.1 83.7 86.3 88.9 91.5 94.2 96.9 99.7 102.6 105.5 108.4 111.3 114.3 117.3 120.3 123.4 ];% population in million

%% The Algoritms
X=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ; 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020;1999^2 2000^2 2001^2 2002^2 2003^2 2004^2 2005^2 2006^2 2007^2 2008^2 2009^2 2010^2 2011^2 2012^2 2013^2 2014^2 2015^2 2016^2 2017^2 2018^2 2019^2 2020^2];
Y=y1;
Xnew = inv((X*transpose(X)));
ynew= X*transpose(Y);
coff = Xnew * ynew;
f=@(x) coff(1) + coff(2)*x + coff(3)*x^2; % the function 

%% Error calculation 
for i=1:size(y1,2)
    eror(i)=abs(y1(i)-f(x1(i)))/y1(i);
end
fprintf('The error is %f %% \n ',norm(eror,Inf)*100)

%% Graphical representation

% Plot the function
fplot(@(x) coff(1) + coff(2)*x + coff(3)*x^2,[1999 2020],'b')
hold on % Hold the graph to add scatter plot
% Add the scatter plot
scatter(x1, y1)
% Add axis labels and legend
xlabel('Years')
ylabel('population in milion * (10^6)')
legend('Function', 'Data Points')

% Add title
title('linear regression graph of by using quadratic function and data points')
