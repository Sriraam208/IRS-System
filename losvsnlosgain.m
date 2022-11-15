close all;
clear;

%% Set parameter values

%Carrier frequency (in GHz)
fc = 3;

%Distances in km
d = 10:0.1:100;

%Defining antenna gains at both the reciever and transmitter ends
antennaGainTdBi = 5;
antennaGainRdBi = 5;

%Channel gain of 3gpp technology for both LOS and Non-LOS
beta_3GPP_LOS = db2pow(antennaGainTdBi+antennaGainRdBi-28-20*log10(fc)-22*log10(d));
beta_3GPP_NLOS = db2pow(antennaGainTdBi+antennaGainRdBi-22.7-26*log10(fc)-36.7*log10(d));
beta_3GPP_IRS = db2pow(antennaGainTdBi+antennaGainRdBi-22.7-26*log10(fc)-36.7*log10(d))+db2pow(antennaGainTdBi+antennaGainRdBi-22.7-26*log10(fc)-36.7*log10(10));
%% Plot simulation results

figure;
hold on; box on; grid on;
plot(d,10*log10(beta_3GPP_LOS),'k-.','LineWidth',2,'Color','b');
plot(d,10*log10(beta_3GPP_NLOS),'r--','LineWidth',2','Color','g');
hold on;
plot(d,10*log10(beta_3GPP_IRS),'r--','LineWidth',2,'Color','r');
xlabel('Distance $d$ [km]','Interpreter','Latex');
ylabel('Channel gain $\beta(d)$ [dB]','Interpreter','Latex');
legend({'UMi-LOS','UMi-NLOS','UMi-IRS'},'Interpreter','Latex');
set(gca,'fontsize',10);
ylim([-110 -40]);
xlim([0 100]);