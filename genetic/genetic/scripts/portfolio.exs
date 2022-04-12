defmodule Portfolio do
  @behaviour Problem
  alias Types.Chromosome

  @impl true
  def genotype do
    genes = for _ <- 1..10, do: {:rand.uniform(10), :rand.uniform(10)}
    %Chromosome{genes: genes, size: 10}
  end

  @impl true
  def fitness_function(chromosome) do
    chromosome
    |> Enum.map(fn {roi, risk} -> 2 *roi - risk end)
    |> Enum.sum()
  end

  @impl true
  def terminate?(population, generation, temperature) do
     # temperature < 25
     max_value = Enum.max_by(population, &Portfolio.fitness_function/1)
     max_value > @target_fitness
  end
  # def terminate?(population, generation), do: generation == 100
  #def terminate?([best | _]), do: best.fitness == 42
end

soln = Genetic.run(OneMax)
IO.write("\n")
IO.inspect(soln)
