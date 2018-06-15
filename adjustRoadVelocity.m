function [roads, round] = adjustRoadVelocity(roads, round, roadGap, regulation)

for j = 1:size(roads, 1)
    for k = 1:size(roads, 2)
        if roads(j, k).position == 1
            roads(j, k).velocity = min([roadGap(j, k), regulation(j, k), roads(j, k).velocity]);
        end
    end
end