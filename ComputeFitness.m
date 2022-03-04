function [fitness, idxFitness] = ComputeFitness(individuals, objects, maxWeight, maxVolumn)
    fitness = sum([objects.value].*individuals, 2);                               
    overweight = sum([objects.weight].*individuals, 2) > maxWeight;                   
    overvolumn = sum([objects.volumn].*individuals, 2) > maxVolumn;
    fitness(overweight | overvolumn) = -fitness(overweight | overvolumn);                           
    [~, idxFitness] = sort(fitness,'descend');
end 