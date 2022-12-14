require_relative '../lib/randpass/version' unless defined? Randpass::VERSION

require 'optimist'

BANNER =
  <<~DESC
    randpass
      >> generate 25 chars long password

    randpass 33
      >> generate 33 chars long password

    ----------------------------------------
  DESC

SETUP_DESCRIPTION =
  <<~DESC
    Install gem dependencies
      xsel or xclip on linux (for clipboard manipulation)

    ----------------------------------------
  DESC

NUMBER_DESCRIPTION =
  <<~DESC
    Number of password characters
      randpass -n 20 -l github rubygems

    ----------------------------------------
  DESC

LIST_DESCRIPTION =
  <<~DESC
    Save list of passwords for given comments
      randpass -l GitHub GitLab StackOverflow

    ----------------------------------------
  DESC

RANDOM_DESCRIPTION =
  <<~DESC
    Save list of passwords (number of passwords to generate)
      randpass -r 5
      randpass -r 5 -n 25

    ----------------------------------------
  DESC

CLIPBOARD_DESCRIPTION =
  <<~DESC
    Empty clipboard
  DESC

NO_COPY_DESCRIPTION =
  <<~DESC
    Do not copy password into clipboard
  DESC

NO_PRINT_DESCRIPTION =
  <<~DESC
    Do not print output in stdout
  DESC

  
module Output

  def self.[](password)
    pass = Randpass[password]
    STDOUT.puts(pass) unless Randpass.noprint?
    Clipboard.copy(pass) unless Randpass.nocopy?
  end
end