function [average] = simulation(RegulationPeriod, RegulationDuty, CarEntranceInterval)

RoadLength = 10; % length of approaching road segments
RoadCount = 4; % number of roads approaching the intersection
RoundLength = 20; % length of roundabout

InitialVelocity = 0;
MaxVelocity = 4; % maximum discretized velocity on the road

TerminalCarCount = 100;

roads(1:RoadCount, 1:RoadLength) = struct;
for j = 1:RoadCount
    for k = 1:RoadLength
        roads(j, k).position = 0;
        roads(j, k).velocity = 0;
        roads(j, k).time = 0;
    end
end

round(1:RoundLength) = struct;
for j = 1:RoundLength
    round(j).position = 0;
    round(j).velocity = 0;
    round(j).direction = 0;
    round(j).time = 0;
end

OutputResults = [];

t = 0;
currentCarCount = 0;

while length(OutputResults) < TerminalCarCount
    [roads, currentCarCount] = addCars(roads, currentCarCount, t, InitialVelocity, CarEntranceInterval);
    
    round = incrementRoundVelocity(round, MaxVelocity);
    
    roundGap = calculateRoundGap(round, RoadCount);
    round = adjustRoundVelocity(round, roundGap);
    
    [round, OutputResults] = incrementRoundPosition(round, OutputResults, RoadCount);
    
    roads = incrementRoadVelocity(roads, MaxVelocity);
    
    roadGap = calculateRoadGap(roads, round);
    regulation = calculateRegulatedGap(roads, t, RegulationPeriod, RegulationDuty);
    [roads, round] = adjustRoadVelocity(roads, round, roadGap, regulation);
    
    [roads, round] = incrementRoadPosition(roads, round);
    
    [roads, round] = incrementTime(roads, round);
    t = t + 1;
    
end

sum = 0;
for j = 1:TerminalCarCount
    sum = sum + OutputResults(j).time;
end
average = sum ./ TerminalCarCount;
