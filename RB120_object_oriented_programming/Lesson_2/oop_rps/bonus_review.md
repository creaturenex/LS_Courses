# OOP RPS Review

## User Experience / Gameplay
- I suggest not allowing for whitespace as a valid name; makes for a weird
  prompt later on
  - *fixed*

- The welcome message and the amount of wins to aim for are immediately cleared;
  I can only see them by scrolling upwards after being asked to choose a move
  - *fixed*

- I suggest allowing abbreviated options for a move as an easier way of typing
  for the user
  - *fixed*

- I suggest using a goodbye message at the end so that the game doesn't look
  like it ended abruptly
  - *fixed*
  - *My goodbye message was displayed inside the inner loop before exiting the program with user input. I moved it outside of the loop so when prompting to play again and the user says no, the good bye message is displayed.*


## Rubocop

12 cop complaints:
- MethodLength of most/all of the available_choices methods, winner. Will address this in your source code.

- AbcSize & MethodLength of play. Will address this in your source code.

- Quite a few RedundantSelf. This means that it's best to not use self unless it's absolutely needed. E.g. on line 136, it's unnecessary. You usually only need to use self if you're (a) defining a class method or (b) assigning an instance variable (like on line 137, that's a good usage of self). I suggest reading through your code and removing others that are unneeded.
    - *fixed, but please view, per your comment only self with assigning instance variable should have remained. Please let me know if any are incorrect.*
    - *This something I reviewed before submitting code for review but still have issues when do use the following*
      - self.method ie        *human.name*
      - method ie             *name*
      - instance variable ie  *@name*

## Source Code

- In the available_choices methods, I suggest setting an instance variable in the initialization that is choices and it's assigned to an array of those choices.
- The available_choices methods, right now, seem a bit overcomplicated for their purpose.
  - *fixed*
  - *honestly that was my first idea but didn't think that was how this problem wanted to be handled, as in effect each @choice for each AI is still a based on the master list in Moves::VALUES*

- For example, for Hal, it could be:
  ``` ruby
  def initialize
    super
    @choices = ['rock', 'scissors', 'scissors', 'scissors', 'lizard']
  end
  ```

- I see in the Scoreboard that both human and computer start at 8 points. Why is that?
  - *fixed*
  - *Used for testing purposes, to make the game go faster during testing, corrected to zero*

- I think it would make more sense to make Messages a module, and then rename all of the methods to be prepend with display_ (e.g. display_welcome instead of welcome), then including this module in TTTGame for usage.
  - *fixed*
  - *Why prepend display_? to the methods. I was thinking along the lines that I would be repeating myself on every method. [OOP Coding Tips](https://launchschool.com/lessons/dfff5f6b/assignments/d632a90f)*


- I suggest implementing some access control throughout your code. For example, the vast majority of the methods inside RPSGame can be private. See where else you can make methods private or protected throughout your program.
  - *fixed*
  - *If you have the time can you view my code on how I implemented the access control.*
  - *For example in the human class the choose method on line 112 is public, but would it be better to make it private because it is actually assigning/changing data? Is that the expectation of all the programs we write at LS?*
  - *Should I have moved the choose method contents to another private method and just have the choose method call the private method?*
  -  *Module Messages - Private works because all these methods are not called directly in the RPSclass but within the play method inside the RPSclass. Is that a correct statement?*

- I suggest extracting the usages of 10 into a constant: GOAL_WINS, or TOURNAMENT, etc. Makes the usages of that number clear.
  - *fixed*

- play_again can just end with answer == 'y' since that will return the appropriate boolean.
  - *fixed*
  - *Originally had it like that but per OOP video chris explicitly has it as the return. [OO RPS Design Choice 1](https://launchschool.com/lessons/dfff5f6b/assignments/47ace186)*

- play can be broken up into other methods: e.g. lines 332-340 could be put into a method called play_full_round.
  - *fixed*

- I suggest extracting methods out of winner to be display_player_won and display_computer_won and then allowing winner to navigate which one should be used.
  - *fixed*
