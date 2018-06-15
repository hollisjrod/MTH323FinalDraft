function [round] = incrementRoundVelocity(round, MaxVelocity)

for j = 1:length(round)
    if round(j).position == 1
        round(j).velocity = min(round(j).velocity + 1, MaxVelocity);
    end
end

