# Randpass

Create random password with ruby. Use `SecureRandom#base64` + few random special characters.

V-0.2.0 - copy password with clipboard gem

## How to install

 - install from rubygems

```
gem install randpass
```
 - download from github with ssh

```
git clone git@github.com:alx3dev/randpass \
cd randpass && bin/setup
```
 - download from github with https

```
git clone https://www.github.com/alx3dev/randpass \
cd randpass && bin/setup
```

To build your own gem, run `rake bundle`, and install it locally with `gem install pkg/randpass-0.1.3.gem`

## How to use:

 - use from terminal

```
# default 22 characters
randpass
 => W4fkGVdXx6pzk$O?VP11!wWs

# or add number of characters as argument
randpass 33
 => etkK$YW1R_PXK8FsjnGHr+%w2cTBbMTOTej3s8je?2ya
 
 # install from rubygems, or build your own version, otherwise you need to run:
 bin/randpass
```
 - use as library

```ruby
require 'randpass'

Randpass[20]
# or
Randpass.randpass 20
 => "1L3Jk$S850Np=ikQ7zeqb44qaBC9"
```

Randpass is a module with both class and instance methods `#randpass`, so you can include/extend it in your class.

```ruby
require 'randpass'
include Randpass

class MyClass
  def some_method
    random_string = randpass 33
  end
end
```

Tested on:
 - ruby `2.7.5`
 - ruby `3.0.3`
 - ruby `3.1.0-preview1`
 - jruby `9.3.2.0`
