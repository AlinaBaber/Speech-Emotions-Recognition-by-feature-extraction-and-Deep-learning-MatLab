function [Average_Power] = average_power(result, windowsize)
% average_power
[Average_Energy] = average_energy(result);
Average_Power = Average_Energy/windowsize;