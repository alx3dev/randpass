## [0.2.0] - 2022-12-12

**[UPDATE]:**
- Default number of characters is 25
- Add clipboard gem to copy password
- Add option to clear clipboard
- Add option to disable clipboard copy
- Add option do disable stdout
- Add setup file, and allow call from randpass executable

**[ERROR]:**
- (fixed) Error when using 1 or 2 characters (now return default - 25)


## [in-development] - 2022-03-12

**[UPDATE]:**
- Number of characters is not required in `Randpass#randpass` - default is **22**.

**[ERROR]:**
- (fixed): `Randpass` return different number of characters (due to `SecureRandom#base64`)


## [0.1.3] - 2022-02-21

**[UPDATE]:**
- Add array of allowed special characters
- Write comments and fix some typos

**[ERROR]:**
- (fixed): `NoMethodError` when including module, due to lack of instance method.


## [0.1.1] - 2022-02-20

- Remove attribute `:pass`


## [0.1.0] - 2022-02-20

- Initial release
