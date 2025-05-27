# Basic begin/rescue/else block
# "ensure" block and StandardError
# "retry" block




# Basic begin/rescue/else block
a = 10
b = 42

#a + b => Error

begin
  a + b
rescue
  puts "Could not add variables a (#{a.class}) and b (#{b.class})."
else
  puts a + b
end


print "Enter a number: "
#num = Kernel.gets.match(/\d+/)[0] # Entering something other than a number crashes the program

begin
  num = Kernel.gets.match(/\d+/)[0]
rescue
  puts "Please enter a number."
else
  puts "Input received."
end




# "ensure" block and StandardError
require 'open-uri'
require 'timeout'

remote_base_url = "http://en.wikipedia.org/wiki"

start_year = 1990
end_year = 2000

(start_year..end_year).each do |yr|
 begin
   rpage = open("#{remote_base_url}/#{yr}")
 rescue StandardError=>e
   puts "Error: #{e}"
 else
   rdata = rpage.read
 ensure   # Always executes whether the rescue branch triggered or not
   puts "sleeping"
   sleep 5
 end
     
 if rdata
   File.open("copy-of-#{yr}.html", "w"){|f| f.write(rdata) }
 end
end   





# "retry" block
for i in 'A'..'C'
  retries = 2
  begin
    puts "Executing command #{i}"
    raise "Exception: #{i}"
  rescue Exception=>e
    puts "\tCaught: #{e}"
    if retries > 0
      puts "\tTrying #{retries} more times\n"
      retries -= 1
      sleep 2
      retry # Go back to "begin" using the same data as the previous attempt. Will skip any "ensure" blocks later in the program flow
    end  
  end
end