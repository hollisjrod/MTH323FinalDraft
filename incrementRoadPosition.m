function [roads, round] = incrementRoadPosition(roads, round)

RoadCount = size(roads, 1);
RoadLength = size(roads, 2);
RoundLength = length(round);

for j = 1:RoadCount
    for k = RoadLength:-1:1
        if roads(j, k).position == 1 && roads(j, k).velocity > 0
            if roads(j, k).velocity + k <= RoadLength
                newPosition = k + roads(j, k).velocity;
                roads(j, newPosition) = roads(j, k);
                roads(j, k).position = 0;
                roads(j, k).velocity = 0;
                roads(j, k).time = 0;
            elseif roads(j, k).velocity > 0
                newPosition = k + roads(j, k).velocity - RoadLength + (j - 1) * RoundLength / RoadCount;
                round(newPosition).position = roads(j, k).position;
                round(newPosition).velocity = roads(j, k).velocity;
                round(newPosition).time = roads(j, k).time;
                round(newPosition).direction = j;
                roads(j, k).position = 0;
                roads(j, k).velocity = 0;
                roads(j, k).time = 0;
            end
        end
    end
end