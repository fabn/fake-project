#!/usr/bin/env ruby

def install_script path  
  File.open(File.join(path, 'keepMine.sh'), 'w') do |f| 
    f.write <<-SH
# I want to keep MY version when there is a conflict
# Nothing to do: %A (the second parameter) already contains my version
# Just indicate the merge has been successfully "resolved" with the exit status
exit 0
SH
    f.chmod(0755)
  end
  puts "Successfully installed script file in #{path}"
  exit 0
end

# Search all paths element (excluding .rvm ones) for a writable one
path = ENV['PATH'].split(":").reject { |el| el.match(/\.rvm/) || !File.writable?(el) }.first

# Try to install the script
install_script(path) unless path.nil?

# print a warning message
puts "A writable path can not be found in your system"
exit 1

