function [round] = adjustRoundVelocity(round, roundGap)

for j = 1:length(round)
    if round(j).position == 1
        round(j).velocity = min(roundGap(j), round(j).velocity);
    end
end