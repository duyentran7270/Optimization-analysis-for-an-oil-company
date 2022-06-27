clc
clear 
close all

% Comments 
% x1: Low Crude oil to Australia, from Brunei
% x2: High Crude oil to Australia, from Brunei
% x3: Low Crude oil to Australia, from Iran
% x4: High Crude oil to Australia, from Iran
% x5: Low Crude oil to Japan, from Brunei
% x6: High Crude oil to Japan, from Brunei
% x7: Low Crude oil to Japan, from Iran
% x8: High Crude oil to Japan, from Iran
% x9: Gasoline from Australia to New Zealand
% x10: Gasoline from Australia to Philippines
% x11: Gasoline from Japan to New Zealand
% x12: Gasoline from Japan to Philippines
% x13: Distillate from Australia to New Zealand
% x14: Distillate from Australia to Philippines
% x15: Distillate from Japan to New Zealand
% x16: Distillate from Japan to Philippines
% x17: Distillate from United States to New Zealand
% x18: Distillate from United States to Philippines
% x19: Number of additional independent tankers
% x20: Demand of gasoline for Australia
% x21: Demand of distillate for Australia 
% x22: Demand of gasoline for Japan
% x23: Demand of distillate for Japan 


f=365*[21.64 22.12 20.81 21.26 21.7 22.24 20.87 21.44 0.3 0.45 0.3 0.6 0.3 0.45 0.3 0.6 21.9 21.4 8.6 0 0 0 0]';
A=[
0 0 1 1 0 0 1 1 zeros(1,15)
1 1 1 1 0 0 0 0 zeros(1,15)
0 0 0 0 1 1 1 1 zeros(1,15)
-0.259 -0.365 -0.186 -0.312 0 0 0 0 1 1 zeros(1,9) 1 0 0 0
-0.688 -0.573 -0.732 -0.608 0 0 0 0 0 0 0 0 1 1 zeros(1,6) 1 0 0
0 0 0 0 -0.259 -0.350 -0.186 -0.300 0 0 1 1 zeros(1,9) 1 0
0 0 0 0 -0.688 -0.588 -0.732 -0.620 0 0 0 0 0 0 1 1 zeros(1,6) 1
0 0 0 0 0 0 0 0 -1 0 -1 0 zeros(1,11)
0 0 0 0 0 0 0 0 0 0 0 0 -1 0 -1 0 -1 0 zeros(1,5)
0 0 0 0 0 0 0 0 0 -1 0 -1 zeros(1,11)
0 0 0 0 0 0 0 0 0 0 0 0 0 -1 0 -1 0 -1 zeros(1,5)
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 zeros(1,5)
0.05 0.05 0.12 0.12 0.045 0.045 0.11 0.11 0.01 0.02 0.06 0.01 0.01 0.02 0.06 0.01 0 0 -1 0 0 0 0
zeros(1,19) -1 0 0 0
zeros(1,20) -1 0 0
zeros(1,21) -1 0 
zeros(1,22) -1
];
b=[60000 50000 30000 zeros(1,4) -5400 -8700 -5000 -8000 12000 6.9 -9000 -21000 -3000 -12000]';

Aeq=[1 1 0 0 1 1 zeros(1,17)];
beq=[40000];

lb=zeros(23,1);
[x,fval]=linprog(f,A,b,Aeq,beq,lb);

% checking the values for the report
values_for_report = [    
    "Total cost";
    "Oil crude from Brunei";
    "Oil crude from Iran";
    "Gasoline sent to New Zealand"
    "Gasoline sent to Philippines"
    "Distillate sent to New Zealand"
    "Distillate sent to Philippines"
    "Distillate bought from US"
    ];

values_for_report(1,2) = fval % Total cost
values_for_report(2,2) = x(1)+x(2)+x(5)+x(6) % Oil crude from Brunei
values_for_report(3,2) = x(3)+x(4)+x(7)+x(8) % Oil crude from Iran
values_for_report(4,2) = x(9)+x(11) % Gasoline sent to New Zealand
values_for_report(5,2) = x(10)+x(12) % Gasoline sent to Philippines
values_for_report(6,2) = x(13)+x(15)+x(17) % Distillate sent to New Zealand
values_for_report(7,2) = x(14)+x(16)+x(18) % Distillate sent to Philippines
values_for_report(8,2) = x(17)+x(18) % Distillate bought from US









