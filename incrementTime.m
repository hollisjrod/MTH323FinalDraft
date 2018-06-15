function [roads, round] = incrementTime(roads, round)

for j = 1:size(roads, 1)
    for k = 1:size(roads, 2)
        if roads(j, k).position == 1
            roads(j, k).time = roads(j, k).time + 1;
        end
    end
end

for j = 1:length(round)
    if round(j).position == 1
        round(j).time = round(j).time + 1;
    end
end