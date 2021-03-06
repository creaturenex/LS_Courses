The assignment itself didn't change much from the procedural Twenty-One game. Review that first, but skip the part about implementation steps. We'll take a more OO approach here.

We'll follow our familiar pattern on tackling the OO Twenty-One game:

Write a description of the problem and extract major nouns and verbs.
Make an initial guess at organizing the verbs into nouns and do a spike to explore the problem with temporary code.
Optional - when you have a better idea of the problem, model your thoughts into CRC cards.
Nouns and Verbs
Let's write a short description of the game.

```
Twenty-One is a card game consisting of a dealer and a player, where the participants try to get as close to 21 as possible without going over.

Here is an overview of the game:
- Both participants are initially dealt 2 cards from a 52-card deck.
- The player takes the first turn, and can "hit" or "stay".
- If the player busts, he loses. If he stays, it's the dealer's turn.
- The dealer must hit until his cards add up to at least 17.
- If he busts, the player wins. If both player and dealer stays, then the highest total wins.
- If both totals are equal, then it's a tie, and nobody wins.
```
Let's write down the nouns and verbs.

```
Nouns: card, player, dealer, participant, deck, game, total
Verbs: deal, hit, stay, busts
```
The "total" there is obviously not going to be a class, but is actually an attribute within a class. In other words, it's not a noun that perform actions, but a property of some other noun. You can also think of it as a verb: "calculate_total".

Another thing to note is that the verb "busts" is not an action anyone is performing. Rather, it's a state -- is the player/dealer busted?

Let's write out the classes and organize the verbs.

```
Player
- hit
- stay
- busted?
- total
Dealer
- hit
- stay
- busted?
- total
- deal (should this be here, or in Deck?)
Participant
Deck
- deal (should this be here, or in Dealer?)
Card
Game
- start
```

First thing to notice is that there is a lot of redundancy in the Player and Dealer classes. A natural place to extract that redundancy seems to be a super class -- perhaps Participant? In our reference implementation, we're going to introduce a module called Hand that will capture this redundancy. Remember, this isn't the only way, and you can extract to a super class as well.

## Spike
Let's write up some code and start exploring this design. We can think and design all we want, but until we start coding, we won't know for certain.

```
class Player
  def initialize
    # what would the "data" or "states" of a Player object entail?
    # maybe cards? a name?
  end

  def hit
  end

  def stay
  end

  def busted?
  end

  def total
    # definitely looks like we need to know about "cards" to produce some total
  end
end

class Dealer
  def initialize
    # seems like very similar to Player... do we even need this?
  end

  def deal
    # does the dealer or the deck deal?
  end

  def hit
  end

  def stay
  end

  def busted?
  end

  def total
  end
end

class Participant
  # what goes in here? all the redundant behaviors from Player and Dealer?
end

class Deck
  def initialize
    # obviously, we need some data structure to keep track of cards
    # array, hash, something else?
  end

  def deal
    # does the dealer or the deck deal?
  end
end

class Card
  def initialize
    # what are the "states" of a card?
  end
end

class Game
  def start
    # what's the sequence of steps to execute the game play?
  end
end

Game.new.start
```

This is obviously just a skeleton, and lots of details still need to be fleshed out. Let's start by taking a stab at the Game#start method, and that will drive the implementation of the other classes. We'll start by writing some methods we wished existed.

```
class Game
  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end
```

Take a shot at working through the solution. In the reference implementation, we use a Hand module that is mixed into Player and Dealer, but you don't have to do that.

We'll show the reference implementation in the next assignment.
