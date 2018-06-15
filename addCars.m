function [roads, currentCarCount] = addCars(roads, currentCarCount, t, InitialVelocity, CarEntranceInterval)

if mod(t, CarEntranceInterval) == 0
    for j = 1:size(roads, 1)
        if roads(j, 1).position == 0
            roads(j, 1).position = 1;
            roads(j, 1).velocity = InitialVelocity;
            roads(j, 1).time = 0;
            currentCarCount = currentCarCount + 1;
        end
    end
end