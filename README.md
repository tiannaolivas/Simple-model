# Simple-model

### Purpose: 
In this agent-based model, we want to explore and understand the dynamics of a hypothetical ecosystem with the following question in focus, "Does an ecosystem that contains only the highest quality foods always support a large and stable population for a species that relies on this resource?" Using this model, we will assess how food quality, individual size, and searching behavior affect the population dynamics of a herbivore species.

### Entities, State Variables, and Scales: 
Entities: In the model, individual herbivores are the agents within the ecosystem that contain various food sources. Variables: One attribute of each herbivore is size, this is related to their willingness to search for high-quality food. Each food source has a specific quality dependent on the accessibility of the finding and its nutritional benefit for the herbivore. Scales: The model has both spatial and temporal scales. On a spacial scale, where the herbivores interact with their surrounding ecosystem. On a temporal scale, the amount of time it takes for the herbivore to search and obtain food.

### Process Overview and Scheduling: 
Growth: Herbivores grow over a certain amount of time, which can influence their size and willingness to search for high-quality food. Food Resource Replication: There will be a variety of food with a range of the ecosystem. Search behaviors are dependent on herbivore size and the quality of the food available. Larger herbivores are more likely to search for high-quality food, while smaller individuals may seek out less-quality food.

### Design Concepts
### Basic Principles: 
The model uses the landscape of fear framework in ecology, this looks at how food quality, individual traits (specifically size), and searching behavior interact to affect herbivore population dynamics. The assumption is that larger individuals are more likely to search for high-quality food but may expend more energy in the process.

### Emergence: 
The model aims to look at how population size can fluctuate and how individual species' size can vary.

### Adaptation: 
Agents, which are herbivores change their searching behavior based on their size and the quality of available food resources.

### Objectives: 
The primary objective of herbivores is to maximize their reproductive success, which is influenced by food quality and individual size.

### Details
### Initialization: 
There will be a defined number of herbivores with random sizes and reproductive statuses. Food resources with varying quality are randomly available in the ecosystem.

### Submodels: 
Submodels will include herbivore growth and the dynamics of the food resource.

### Parameters: 
Model parameters include the herbivore's growth rates based on the food quality and the relationship of size and probability of searching for high-quality food.

### Observations: 
The model's output analyzes population size, herbivore size and how it varies, and food resources and its availability over time.

### Initialization and Termination: 
The simulation begins at time step one and continues for 100 steps.
### Stochasticity: 
Stochastic elements (i.e. noise around a defined mean or optimum) can be placed in the model to represent randomness in the food available and herbivore searching behavior.

