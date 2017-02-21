class Population {
  
  int maxl = 13;
  float mutationRate;
  Rocket[] population;
  ArrayList<Rocket> matingPool;
  int generations;
  
  Population(float mutRate, int num) {
    mutationRate = mutRate;
    
    population = new Rocket[num];
    for (int i = 0; i < population.length; i++) {
      population[i] = new Rocket();
    }
  }
  
  void fitness() {
    for (int i = 0; i < population.length; i++) {
      population[i].fitness();
    }
    generations++;
  }
  
  void selection() {
    matingPool = new ArrayList<Rocket>();
    
    for (int i = 0; i < population.length; i++) {
      //int n = int(map(population[i].fitness, 0, .000001, 0, 1000000));
      float n = pow((float)(13+Math.log10(population[i].fitness)), 4);
      //for (int j = 0; j < maxl; j++) {
      //  m *= 10;
      //}
      //int n = int(m);
      //if (n > 1000) {
      //  if (n > 5000) {
      //    n = 5000;
      //  }
      //  maxl--;
      //} else if (n == 0) n = 1;
      
      //System.out.println(n);
      //System.out.println(maxl);
      for (int j = 0; j < n; j++) {
        matingPool.add(population[i]);
      }
    }
  }
  
  void reproduction() {
    for (int i = 0; i < population.length; i++) {
      int a = int(random(matingPool.size()));
      int b = int(random(matingPool.size()));
      Rocket parentA = matingPool.get(a);
      Rocket parentB = matingPool.get(b);
      Rocket child = parentA.dna.crossover(parentB);
      child.dna.mutate(mutationRate);
      
      population[i] = child;
    }
  }
  
  void live() {
    for (int i = 0; i < population.length; i++) {
      population[i].run();
    }
  }
  
  void render() {
    for (int i = 0; i < population.length; i++) {
      population[i].render();
    }
  }
  
  int getGenerations() {
    return generations;
  }
}