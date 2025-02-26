%pd = makedist('beta','a',2,'b',5)
%pd = makedist('normal','mu',2,'sigma',0.5)
%pd = makedist('triangular','a',0,'b',7,'c',10)
pd = makedist('exponential','mu',10)
%pd = makedist('uniform','lower',1,'upper',10)
%pd = makedist('lognormal','mu',2,'sigma',0.5)

x = 0:.001:30;
y = pdf(pd,x);
plot(x,y,'LineWidth',2)

%pd = makedist('normal','mu',5,'sigma',2)
%pd1 = makedist('normal','mu',10,'sigma',1)
%x1 = 0:.001:15;
%x2 = 0:.001:15;
%y = pdf(pd,x);
%z = pdf(pd1,x);
%a=[y z]
%x=[x1 x2]
%plot(x,a,'LineWidth',2)