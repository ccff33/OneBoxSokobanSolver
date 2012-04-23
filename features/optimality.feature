Feature: Optimality
	Should find optimal path with min robot steps
	
	Scenario: Small space and easy solution
		Given I have the following input:
		"""
		-  -  W  -  -  -
		-  R  -  B  -  G
		-  W  -  -  W  -
		-  -  -  -  -  -
		-  -  -  -  -  -
		-  -  -  -  -  -
		"""
		
		And I run AStarSearch
		Then the robot should make 3 steps
		
	Scenario: Big space and walking around
		Given I have the following input:
		"""
		-  -  -  -  -  -  -  -  -  -
		-  -  -  -  -  -  -  -  -  -
		-  -  -  -  -  -  -  -  -  -
		-  -  -  -  -  -  -  -  -  -
		-  -  -  -  -  -  -  -  -  -
		-  -  -  -  W  -  -  -  -  -
		-  -  -  -  W  -  -  -  -  -
		-  -  G  R  -  W  B  -  -  -
		-  -  -  -  -  W  -  -  -  -
		-  -  -  -  -  -  -  -  -  -
		"""
		And I run AStarSearch
		Then the robot should make 20 steps
		
	Scenario: Big space and many walls
		Given I have the following input:
		"""
		-  -  -  -  -  -  -  -  -  -
		-  -  W  -  -  -  -  W  -  -
		-  -  -  -  W  -  -  -  -  -
		-  R  -  W  -  W  -  W  W  -
		-  -  -  -  -  -  -  -  -  -
		-  -  -  -  W  -  B  -  -  -
		-  W  -  W  -  -  -  W  -  -
		-  -  -  -  -  -  -  -  W  -
		-  -  -  -  -  W  -  -  -  -
		-  -  -  -  -  -  -  -  G  -
		"""
		And I run AStarSearch
		Then the robot should make 18 steps
		
	Scenario: Big Space and the robot is close to the goal
		Given I have the following input:
		"""
		-  -  -  -  -  -  -  -  -  -
		-  -  -  -  -  -  -  W  -  -
		-  -  -  -  W  -  -  -  -  -
		-  W  -  W  -  -  -  W  W  W
		-  -  -  -  -  -  -  -  W  W
		-  -  -  -  W  -  B  -  -  -
		-  W  -  -  -  -  -  W  -  -
		-  -  -  -  -  -  -  -  W  -
		-  -  -  -  -  W  -  -  R  -
		-  -  -  -  -  -  -  -  G  -
		"""
		And I run AStarSearch
		Then the robot should make 20 steps
