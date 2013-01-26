# Spiel

Spiel has helper methods and classes to make your code clean.
The main concepts come from Scala and Haskell and other languages which
has embraced the functional paradigm in different degrees

It contains very lightweight solutions with no extra dependencies on
other gems.


## Installation

Add this line to your application's Gemfile:

    gem 'spiel'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spiel

## Usage

### Maybe

Ruby's maybe inspired by Haskell's Maybe.

Imagine you want to do know who of your friends boss is richer:
```Ruby
User.find_by_name(name).boss.credit_card(:main).balance(:credit)
```

But find_by_name, parent, credit_card or balance can be nil, you will
get a NoMethodError and your program will die. 

You can check for nil on each step:
```Ruby
 user = User.find_by_name(name)
 parent &&= user.parent
 card &&= parent.credit_card(:main)
 balance &&= card.balance(:credit)
```

But your buggy first version read almost like English and now this looks so
much .... like C.

You can also use ActiveSupport and its try method: 
```Ruby
 User.find_by_name(name).try(:parent).try(:credit_card, :main).try(:balance, :credit)
```

That was long! And it kind of repetitive and, what is going on with
those double symbols on these methods. Ugly, ugly.

So you try this gem and you get this awesome line:
```Ruby
Maybe(User.find_by_name(name)).parent.credit_card(:main).balance(:credit)
```

And that's it, this will get you an object that works as balance and the
chain will never explote because of some nil on the line.

You can even do
```Ruby
substracted = Maybe(User.find_by_name(name)).parent.credit_card(:main).balance(:credit).get_or_else(0)
```

Maybe objects has one method only 'get_or_else' it will return the
object at that point of your chain or some default you pass as param if the chain got
broken



## Contributing

1. Fork it
2. Do your changes, the specs pass
3. Send a pull request
