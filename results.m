RegulationPeriod = 10;
RegulationDuty = 0:7;
CarEntranceInterval = 1:2;
AverageThroughput = zeros(length(RegulationDuty), length(CarEntranceInterval));

for j = 1:length(RegulationDuty)
    for k = 1:length(CarEntranceInterval)
        fprintf("j: %d k: %d\n", j, k);
        AverageThroughput(j, k) = simulation(RegulationPeriod, RegulationDuty(j), CarEntranceInterval(k));
    end
end

%surf(CarEntranceInterval, RegulationDuty, AverageThroughput)

plot(RegulationDuty, AverageThroughput);