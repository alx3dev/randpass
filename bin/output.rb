require_relative '../lib/randpass/version' unless defined? Randpass::VERSION

require 'optimist'

# Check if password should be printed and/or copied
module Output
  # @param [String] pass **Required**. Password
  def self.[](txt)
    txt = txt.join("\n") if txt.is_a?(Array)
    STDOUT.puts(txt) unless Randpass.noprint?
    Clipboard.copy(txt) unless Randpass.nocopy?
  end
end

BANNER =
  <<~DESC
    randpass
    randpass 33
    randpass -n 25 -r 5 --dir 'output/directory'
    :
  DESC

SETUP_DESCRIPTION =
  <<~DESC
    Install gem dependencies
      xsel or xclip on linux (for clipboard manipulation)
  DESC

NUMBER_DESCRIPTION =
  <<~DESC
    Number of password characters
      randpass -n 20 -l github rubygems

    ----------------------------------
  DESC

LIST_DESCRIPTION =
  <<~DESC
    Save list of passwords for given comments
      randpass -l GitHub GitLab StackOverflow

    ----------------------------------
  DESC

RANDOM_DESCRIPTION =
  <<~DESC
    Save list of passwords (number of passwords to generate)
      randpass -r 5
      randpass -r 5 -n 25

    ----------------------------------
  DESC

PATH_DESCRIPTION =
  <<~DESC
    Path to directory where to save password list
      default: gem directory
  DESC

CLIPBOARD_DESCRIPTION =
  <<~DESC
    Empty clipboard
  DESC

NO_COPY_DESCRIPTION =
  <<~DESC
    Do not copy password to clipboard
  DESC

NO_PRINT_DESCRIPTION =
  <<~DESC
    Do not print output to stdout
  DESC

NO_SAVE_DESCRIPTION =
  <<~DESC
    Do not save list output as txt file
  DESC
