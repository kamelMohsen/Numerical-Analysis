clc;
clear;
Y= zeros(0,150);  
Y1= zeros(0,150); % Y1=Y'
Y2= zeros(0,150); % Y2=Y1'=Y''
Y3= zeros(0,150); % Y3=Y2'=Y'''
Y4= zeros(0,150); % Y4=Y3'=Y''''
X= zeros(0,150);  
% Set intial values
Y(1)=1;
Y1(1)=1;
Y2(1)=-1;
Y3(1)=1;
Y4(1)=-1;
X(1)=0;
h= 0.01; % step given
k = 2;% to Acess the value of the next state
  

for i=0:0.01:1.5
%set the peridictive values
X(k) = i+0.01;
Y(k) =Y(k-1)+h*Y1(k-1);
Y1(k) =Y1(k-1)+h*Y2(k-1);
Y2(k) =Y2(k-1)+h*Y3(k-1);
Y3(k) =Y3(k-1)+h*Y4(k-1);
Y4(k) =cos(2*X(k))-4*Y2(k); % given
% begin to calculate the corrective value with 10 iterations
for j=0:1:10
Y3(k)=Y3(k-1)+h*((Y4(k-1)+Y4(k))/2);
Y2(k)=Y2(k-1)+h*((Y3(k-1)+Y3(k))/2);
Y1(k)=Y1(k-1)+h*((Y2(k-1)+Y2(k))/2);
Y(k)=Y(k-1)+h*((Y1(k-1)+Y1(k))/2);
end 
k=k+1;
end 
plot(X,Y)
xlabel('X')                      %Labeling Horizontal Axis
ylabel('Y')                      %Labeling Vertical Axis
grid on
set(gca,'Fontsize',15)           %Changing the font size of the labels