# Genetic Algorithm Binary Backpack - MATLAB

This repository contains a MATLAB implementation of a Genetic Algorithm for solving the Binary Backpack problem. The algorithm includes traditional genetic operations such as culling, crossover, and mutation, along with an enhanced "King Selection" (KS) method to improve performance.

## Features
- **Cull, Crossover, and Mutation**: Standard genetic operations to evolve solutions.
- **King Selection (KS)**: An additional selection method to enhance the algorithm's performance.
- **GeneticBackpack.m**: Implements the Genetic Algorithm.
- **MatlabBackpack.mlx**: Uses MATLAB's `intlinprog` function for comparison.

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/Shaoting-Feng/Genetic-Algorithm-Binary-Backpack-Matlab.git
   ```
2. Navigate to the project directory:
   ```bash
   cd Genetic-Algorithm-Binary-Backpack-Matlab
   ```

## Usage
1. Run the Genetic Algorithm:
   ```matlab
   GeneticBackpack
   ```
2. Alternatively, run the MATLAB function:
   ```matlab
   MatlabBackpack
   ```

## Files
- `ComputeFitness.m`: Function to compute the fitness of solutions.
- `GeneticBackpack.m`: Main script for the Genetic Algorithm.
- `LICENSE`: License file.
- `MatlabBackpack.mlx`: Script using MATLAB's `intlinprog` function.
- `PerformCrossover.m`: Function to perform crossover operations.
- `README.md`: This file.
- `objects.mat`: Data file containing objects for the backpack problem.
- `task_Chinese.pdf`: Documentation in Chinese.

## License
This project is licensed under the Apache-2.0 License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments
This project is inspired by the work of [HowardGoldowsky/Genetic_Algorithm_for_Backpack](https://github.com/HowardGoldowsky/Genetic_Algorithm_for_Backpack). Modifications and enhancements have been made to improve performance and add the King Selection method.
