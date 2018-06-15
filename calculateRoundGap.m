function [roundGap] = calculateRoundGap(round, RoadCount)

roundGap = zeros(size(round));
SegmentLength = (length(round) / RoadCount);

for j = 0:(RoadCount - 1)
    for k = 1:SegmentLength
        if round(j * SegmentLength + k).position == 1
            if k == SegmentLength
                roundGap(j * SegmentLength + k) = inf;
            end
            for l = (k + 1):SegmentLength
                if (round(j * SegmentLength + l).position == 1)
                    roundGap(j * SegmentLength + k) = l - k - 1;
                    break;
                end
                if l == SegmentLength
                    roundGap(j * SegmentLength + k) = inf;
                end
            end
        end
    end
end