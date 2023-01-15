# Randpass v0.3.3

Ruby random password generator.  
Generate password and copy in clipboard, or generate list and/or save as `.txt` file.  
File is saved as plain text, it is up to end-user to decide how to secure it.  

Password is generated with `SecureRandom#base64` and a few (random) special characters `! # * $ % _ @`  


## Dependencies

Randpass use _clipboard-gem_, that require `xsel` or `xclip` on Linux systems.  
Setup script will check and install `xsel` if nothing is found.


## How to use:

 Use from terminal:  

 When generating a single password, you don't need any argument, or you can add number of password characters (default is 25). By default, password is printed in STDOUT and copied to clipboard, but not saved as file.  

 - generate password with 25 characters  
   `randpass`  

 - generate password with 30 characters  
   `randpass 30`  
   `randpass --char 30`

 - clear clipboard  
   `randpass -k`  
   `randpass --clear`  

 - add `-c` or `--noc` to disable clipboard copy  
    `randpass 35 -c`  

 - add `-p` or `--nop` to disable STDOUT  
    `randpass 20 -p`  

 When generating a list of passwords, you need to supply `-n` or `--char` to set number of password characters (default is 25). Passwords will be saved in a current working directory (unless otherwise specified) in format `randpass_#{Time.now.to_i}.txt`. This way we avoid overwrite, and it's possible to get time of file generation with `Time.at TIME_INTEGER`  

 - generate password list from comments (20 characters long password)  
    `randpass -n 20 -l GitHub RubyGems AnotherWebSite`  

 - generate password list with 10 passwords - without comments  
    `randpass -r 10`  
    `randpass -n 20 -r 10`  

 - add `-s` or `--nos` to disable saving list as a file  
    `randpass -n 20 -r 5 -s` 
    `randpass -r 10 --nos --noc`  

 - add `-d` or `--dir` as location to store password list  
    `randpass -r 10 -d 'my_path/directory'`  



## How to install

 - install from rubygems  
> Randpass require gem `Optimist`, install it with `gem install optimist`  
> You need it only when installing from rubygems.  
> Future release will remove it  

```
gem install randpass && randpass -i
```
 - download from github with ssh

```
git clone git@github.com:alx3dev/randpass \
cd randpass && randpass -i
```
 - download from github with https

```
git clone https://www.github.com/alx3dev/randpass \
cd randpass && randpass -i
```  


Tested on:
 - ruby `2.7.5`
 - ruby `3.0.3`
 - ruby `3.1.0`
 - ruby `3.1.3`
 - jruby `9.3.2.0`
