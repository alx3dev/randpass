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
