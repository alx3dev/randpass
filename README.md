# Randpass v0.3.0

Ruby random password generator.  
Generate password and copy in clipboard, or generate list and/or save as `.txt` file.  
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

 - add `-k` or `--noc` to disable clipboard copy  
    `randpass 35 --noc`  

 - add `-p` or `--nop` to disable STDOUT  
    `randpass 20 -p`  
    
 - generate password list from comments (20 characters long password)  
    `randpass -n 20 -l GitHub RubyGems AnotherWebSite`  

 - generate password list with 10 passwords - without comments  
    `randpass -r 10`  
    `randpass -n 20 -r 10`  

 - add `-s` or `--nos` to disable saving list as a file  
    - `randpass -n 20 -r 5 --nos` 
    - `randpass -r 10 --nos --noc`  

 - add custom path where to store password list  
    `randpass -r 10 --path 'my_path/directory'`  




## How to install

 - install from rubygems

```
gem install randpass && randpass -i
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
Linux users should run: `bin/setup`  

To build your own gem, run `rake build`, and install it locally with `gem install pkg/randpass-0.3.0.gem`


Tested on:
 - ruby `2.7.5`
 - ruby `3.0.3`
 - ruby `3.1.0-preview1`
 - jruby `9.3.2.0`
