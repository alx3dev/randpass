# Randpass

Create random password with ruby. Use `SecureRandom#base64` + few random special characters.

## How to install

 - install from rubygems

```
gem install randpass
```
 - download from github with ssh

```
git clone git@github.com:alx3dev/randpass \
cd randpass && bundle install
```
 - download from github with https

```
git clone https://www.github.com/alx3dev/randpass \
cd randpass && bundle install
```

To build your own gem, run `rake bundle`, and install it locally with `gem install pkg/randpass-0.1.1.gem`

## How to use:

 - use from terminal

```
# default 18 characters
randpass
 => 3!J_GApnCy4Mor1hMPbI?LhT

# or add number of characters as argument
randpass 30
 => zBv2BXVB/X2WJMqzSE%VRe#Sg!/0_wYpvJC1gyHU
 
 # install from rubygems, or build your own version, otherwise you need to run:
 bin/randpass
```
 - use as library

```ruby
require 'randpass'

Randpass[20]
# or
Randpass.randpass 20
 => "0!ZNiAUZCbjo!#hHeX+XX$eAC=!p"
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
