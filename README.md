# Randpass

**Under Development**

V-0.2.0:
  - copy password with clipboard gem
  - add storage module


Ruby random password generator.  
Generate password and copy into clipboard, or generate list and save as `.txt` file.  
File is saved as plain text, it up to end-user to decide how to keep it safe.  


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
