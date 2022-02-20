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

## How to use:

 - use from terminal
```
# default 18 characters
randpass
 => 3!J_GApnCy4Mor1hMPbI?LhT

# or add number of characters as argument
randpass 30
 => zBv2BXVB/X2WJMqzSE%VRe#Sg!/0_wYpvJC1gyHU
 
 # if you not install from rubygems, you need to run
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
Randpass is a module, so you can include/extend it in your class, to call `randpass` method.
