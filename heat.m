function [] = heat()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
x=0:0.001:1;
t=0;
n=1:2:31;

for t=0:1000
    u=(4./n/pi.*exp(-(pi.*n).^2.*t/100000))*sin((pi.*n.'*x));
    plot(x,u);
   
    ylim ([0 2])
    figure(1)
    if(t==0)
        legend 'initial condition, now simulation starts'
        pause(5)
     end
            
    xlabel distance
    ylabel temperature
    pause(0.001);
end
end

