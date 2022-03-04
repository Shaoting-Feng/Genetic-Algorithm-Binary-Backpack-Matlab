function individuals = PerformCrossover(individuals, idxIndividual, idxCrossoverLocation)
    for n = 1:numel(idxCrossoverLocation)
        idxA = idxIndividual(2 * n - 1);                                       
        idxB = idxIndividual(2 * n);                                            
        individuals(2 * n - 1, :) = [individuals(idxB, 1:idxCrossoverLocation(n)), individuals(idxA, idxCrossoverLocation(n) + 1:end)];
        individuals(2 * n, :) = [individuals(idxA, 1:idxCrossoverLocation(n)), individuals(idxB, idxCrossoverLocation(n) + 1:end)];
    end
end 