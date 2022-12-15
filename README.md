### UNDER DEVELOPMENT

# Randpass

V-0.2.0:
  - copy password in clipboard
  - add storage module


Ruby random password generator.  
Generate password and copy in clipboard, or generate list and save as `.txt` file.  
File is saved as plain text, it is up to end-user to decide how to secure it.  

Password is generated with `SecureRandom#base64` and a few special characters `! # * $ % _ @`  


## Dependencies

Randpass use _clipboard-gem_, that require `xsel` or `xclip` on Linux systems.  
Setup script will check and install `xsel` if nothing is found.


## How to use:

 Use from terminal:  

 - generate password with 25 characters  
   `randpass`  

 - generate password with 30 characters  
   `randpass 30`  

 - clear clipboard  
   `randpass -c`  

 - generate password list from comments (20 characters long password)  
    `randpass -n 20 -l password1 password2 password3`  

 - generate password list with 10 passwords - without comments  
    `randpass -r 10`  
    `randpass -n 20 -r 10`

 - add `--noc` and/or `--nop` to diasable copy and stdout, respectively  
    `randpass 35 --noc`  
    `randpass -r 10 --noc --nop`  


## How to install

 - install from rubygems

```
gem install randpass && randpass -s
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

To build your own gem, run `rake bundle`, and install it locally with `gem install pkg/randpass-0.2.0.gem`


Tested on:
 - ruby `2.7.5`
 - ruby `3.0.3`
 - ruby `3.1.0-preview1`
 - jruby `9.3.2.0`
