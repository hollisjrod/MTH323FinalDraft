function [roundGap] = calculateRoundGap(round, RoadCount)

roundGap = zeros(size(round));
RoundLength = length(round);
SegmentLength = RoundLength / RoadCount;

for j = 1:RoundLength
    if round(j).position == 1
        for k = 1:RoundLength
            currentIndex = mod(j + k - 1, RoundLength) + 1;
            if round(currentIndex).position == 1
                if mod(round(currentIndex).direction - 2, RoadCount) + 1 == currentIndex / SegmentLength
                    roundGap(j) = inf;
                else
                    roundGap(j) = k - 1;
                end
                break
            end
            if k == RoundLength
                roundGap(j) = inf;
            end
        end
    end
end