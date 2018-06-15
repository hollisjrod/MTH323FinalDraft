function [roads] = incrementRoadVelocity(roads, MaxVelocity)

for j = 1:size(roads, 1)
    for k = 1:size(roads, 2)
        if roads(j, k).position == 1
            roads(j, k).velocity = min(roads(j, k).velocity + 1, MaxVelocity);
        end
    end
end

