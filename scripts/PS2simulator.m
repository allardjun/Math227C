
numSamples = 400;

% states
% start = 1
% E1 = 2
% E2 = 3
% E3 = 4
% I = 5
% end = 6

% parameters
p4to5 = 0.42;
p4to2 = 0.45;
p5to5 = 0.8;

% data holder
basepairLength = zeros(1,numSamples);

% begin sampling!
for iSample=1:numSamples
    
    state = 1; % initial condition
   
    numBasepairs = 0; % "timestep" but measured in basepairs
    
    % "time" loop! (loop across basepairs)
    while state ~= 6
        
        if state == 1
            state = 2;
        elseif state == 2 
            state = 3;
        elseif state == 3
            state = 4;
        elseif state == 4
            randomProb = rand();
            if randomProb<p4to5
                state = 5;
            elseif randomProb < p4to5+p4to2
                state = 2;
            else % this should say "elseif randomProb < p4to5 + p4to2 + p4to6" but 
                state = 6;
            end
        elseif state == 5
            randomProb = rand();
            if randomProb<p5to5
                state = 5;
            else
                state = 2;
            end
        end
                        
        numBasepairs = numBasepairs + 1;
        
    end % finished looping across gene
    
    display(numBasepairs);
    basepairLength(iSample)=numBasepairs;
        
end % finished samples

%% analysis

figure(1);
histogram(basepairLength);

