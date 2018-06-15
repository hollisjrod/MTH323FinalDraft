function [regulation] = calculateRegulatedGap(roads, t, RegulationPeriod, RegulationDuty)

RoadCount = size(roads, 1);
RoadLength = size(roads, 2);

regulation = zeros(size(roads));

for j = 1:RoadCount
    for k = 1:RoadLength
        if roads(j, k).position == 1
            if mod(t, RegulationPeriod) < RegulationDuty
                regulation(j, k) = RoadLength - k;
            else
                regulation(j, k) = inf;
            end
        end
    end
end