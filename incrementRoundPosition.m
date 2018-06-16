function [round, OutputResults] = incrementRoundPosition(round, OutputResults, RoadCount)

RoundLength = length(round);
SegmentLength = RoundLength / RoadCount;

for j = 1:RoadCount
    for k = SegmentLength:-1:1
        currentIndex = (j - 1) * SegmentLength + k;
        if round(currentIndex).position == 1 && round(currentIndex).velocity > 0
            if k + round(currentIndex).velocity <= SegmentLength || round(currentIndex).direction ~= mod(j - 2, RoadCount) + 1
                newIndex = mod(currentIndex + round(currentIndex).velocity - 1, RoundLength) + 1;
                round(newIndex) = round(currentIndex);
                round(currentIndex).position = 0;
                round(currentIndex).velocity = 0;
                round(currentIndex).direction = 0;
                round(currentIndex).time = 0;
            else
                OutputResults = [OutputResults, round(currentIndex)];
                round(currentIndex).position = 0;
                round(currentIndex).velocity = 0;
                round(currentIndex).direction = 0;
                round(currentIndex).time = 0;
            end
        end
    end
end