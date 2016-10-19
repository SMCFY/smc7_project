%deviceReader = audioDeviceReader;
deviceReader = dsp.AudioFileReader('Dude.wav');
deviceWriter = audioDeviceWriter('SampleRate',deviceReader.SampleRate);
deviceReader.SamplesPerFrame = 64;

fs = deviceReader.SampleRate;

delay = Delay();
disp('Begin Signal Input...')
audioTestBench(delay);
tic
while toc<50
   
    mySignal = deviceReader();
    myProcessedSignal = process(delay, mySignal);
    deviceWriter(myProcessedSignal);
    
  %  C = centroid(mySignal, deviceReader.SampleRate);
  %  delay.DelayTime = C/fs; % Adaptive part with some mapping 
    
    %disp(C);
    
end

release(deviceReader)
release(deviceWriter)
