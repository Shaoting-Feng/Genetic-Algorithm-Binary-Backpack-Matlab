clear

%% Custom Parameter
maxNumGenerations = 100;
numIndividuals = 1000;
cullRate = 0.5;
mutationRate = 0.2;
initRate  = 0.8;

%% Initialization
load("objects.mat");
maxWeight = 86;
maxVolumn = 95;
numGen = 0;
numObjects = numel(objects);
individuals = rand(numIndividuals, numObjects) < initRate;                      
numBest = floor(cullRate * numIndividuals); % choose how many individuals to reproduce;

%% Reproduce
while (numGen < maxNumGenerations)                                         
    % Compute fitness
    [fitness, idxFitness] = ComputeFitness(individuals, objects, maxWeight, maxVolumn); % returns fitness and rank 
    
    % Cull
    individuals = individuals(idxFitness(1:numBest), :);                            
    totalFitness = sum(fitness(idxFitness(1:numBest)));                   
    probabilities = fitness(idxFitness(1:numBest)) / totalFitness;
    
    % Custom procedure
    % Select the best individual as the king
    % The king must survive till next generation 
    % and "consume" a random new individual
    % I don't know if this is eligible in Genetic Algorithm
    % but it surely improves performance
    king = individuals(1, :);
    
    % Select alive individuals    
    trials = rand(numIndividuals,1);        
    sumP = cumsum(probabilities);                                  
    SelectIndividuals = @(r) find(r < sumP, 1, 'first'); 
    idxIndividual = arrayfun(SelectIndividuals, trials);                          
    idxCrossoverLocation = randi([1, numObjects-1], numIndividuals / 2, 1);     
    
    % Crossover
    individuals = PerformCrossover(individuals, idxIndividual, idxCrossoverLocation);
    
    % Mutate
    mutationMap = rand(numIndividuals, numObjects) < mutationRate; 
    individuals = xor(individuals, mutationMap);                            

    individuals(1, :) = king;
    
    numGen = numGen + 1;  
end 

%% Solution
[~, idxFitness] = ComputeFitness(individuals, objects, maxWeight, maxVolumn);         

solution.individual = individuals(idxFitness(1),:);
solution.fitness = sum([objects.value] .* individuals(idxFitness(1), :));
solution.total_weight = sum([objects.weight] .* individuals(idxFitness(1), :));
solution.total_volumn = sum([objects.volumn] .* individuals(idxFitness(1), :));
solution.value = [objects.value] .* individuals(idxFitness(1), :);
solution.weight = [objects.weight] .* individuals(idxFitness(1), :);
solution.volumn = [objects.volumn] .* individuals(idxFitness(1), :);
    
solution
