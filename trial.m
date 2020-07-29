clear
load restingstate64chans.mat
EEG.data = double(EEG.data);
chanpowr=( 2*abs(fft(EEG.data,[],2)/EEG.pnts) ).^2;
chanpowr = mean(chanpowr,3);
hz = linspace(0,EEG.srate/2,floor(EEG.pnts/2)+1);
figure(15), clf
plot(hz,chanpowr(:,1:length(hz)),'linew',2)
xlabel('Frequency (Hz)'), ylabel('Power (\muV)')
set(gca,'xlim',[0 30],'ylim',[0 50])
alphabounds = [ 8 12 ]';
freqidx = dsearchn(hz',alphabounds);
alphapower = mean(chanpowr(:,freqidx(1):freqidx(2)),2);
figure(16), clf
topoplotIndie(alphapower,EEG.chanlocs,'numcontour',0);
set(gca,'clim',[0 6])
colorbar