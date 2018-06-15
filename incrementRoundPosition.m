function [round, OutputResults] = incrementRoundPosition(round, OutputResults, RoadCount)

RoundLength = length(round);
SegmentLength = RoundLength / RoadCount;

for j = 0:(RoadCount - 1)
    for k = SegmentLength:-1:1
        currentIndex = j * SegmentLength + k;
        if round(currentIndex).position == 1 && round(currentIndex).velocity > 0
            if k + round(currentIndex).velocity <= SegmentLength
                newIndex = currentIndex + round(currentIndex).velocity;
                round(newIndex) = round(currentIndex);
                round(currentIndex).position = 0;
                round(currentIndex).velocity = 0;
                round(currentIndex).direction = 0;
                round(currentIndex).time = 0;
            elseif round(currentIndex).velocity > 0
                OutputResults = [OutputResults, round(currentIndex)];
                round(currentIndex).position = 0;
                round(currentIndex).velocity = 0;
                round(currentIndex).direction = 0;
                round(currentIndex).time = 0;
            end
        end
    end
end