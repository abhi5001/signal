clc;
clear all;
close all;
rs=0.05;%input('Please Enter Stop Band Ripple r(s) :');
rp=0.04;%input('Please Enter Pass Band Riplle r(p) :');
fp=1500;%input('Please Enter Pass Band Frequency :');
fs=2000;%input('Please Enter Stop Band Frequency :');
f=8000;%input('Please Enter Sampling Frequency :'); 
wp=2*(fp/f);
ws=2*(fs/f);
num=-20*log10(sqrt(rs*rp))-13;
den=14.3*(fs-fp)/f;
n=ceil(num/den);
if (mod(n,2)==0)
    n1=n+1;
else
    n1=n;
end
y=boxcar(n1);
b=fir1(n,wp,y);
[h,p]=freqz(b,1,512);
h=20*log10(abs(h));
subplot(2,1,1);
plot((p/pi),h);
xlabel('Normalised Frequency');
ylabel('Gain');
title('LPF Design of FIR Filter using Rectangular Window');
y=bartlett(n1);
b=fir1(n,wp,y);
[h,p]=freqz(b,1,512);
h=20*log10(abs(h));
subplot(2,1,2);
plot((p/pi),h);
xlabel('Normalised Frequency');
ylabel('Gain');
title('LPF Design of FIR Filter using Triangular Window');

