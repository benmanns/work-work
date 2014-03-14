require "date"

message = <<END
x  x x xxx  xxxx   x     x xxxx   xxx  x    xxxx
x  x x x  x x      x x x x x      x  x x      xx
x  x x x  x x      x  x  x x      x  x x      x 
xxxx x xxx  xxx    x     x xxx    xxx  x     xx 
x  x x x  x x      x     x x      x    x     x  
x  x x x  x x      x     x x      x    x    xx  
x  x x x  x xxxx   x     x xxxx   x    xxxx xxxx
END

rows = message.split("\n")
columns = rows.map { |row| row.split(//) }.transpose.map(&:join)

today = Date.today
last_sunday = today - today.wday

day = last_sunday - (columns.length + 1) * 7

days = []
columns.each do |column|
  column.chars do |char|
    days << day if char != " "
    day += 1
  end
end

days.each do |day|
  time = day.to_time + 12 * 60 * 60
  system({ "GIT_COMMITTER_DATE" => time.to_s, "GIT_AUTHOR_DATE" => time.to_s }, "git commit -q -m 'work work' --allow-empty")
  puts "work work #{time}."
end

puts "jobs done."
