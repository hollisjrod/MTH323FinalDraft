function [roadGap] = calculateRoadGap(roads, round)

RoadCount = size(roads, 1);
RoadLength = size(roads, 2);

roadGap = zeros(size(roads));

for j = 1:RoadCount
    for k = 1:RoadLength
        if roads(j, k).position == 1
            if k == RoadLength
                SegmentLength = length(round) / RoadCount;
                for l = 1:SegmentLength
                    if round((j - 1) * SegmentLength + l).position == 1
                        roadGap(j, k) = l - 1;
                    end
                    if l == SegmentLength
                        roadGap(j, k) = inf;
                    end
                end
            end
            for l = (k + 1):RoadLength
                if roads(j, l).position == 1
                    roadGap(j, k) = l - k - 1;
                    break;
                end
                if l == RoadLength
                    roadGap(j, k) = inf;
                end
            end
        end
    end
end