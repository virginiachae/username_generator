# Make sure to run the tests in your /spec folder
# Run `rspec /spec/username_spec.rb` to get started.
$usernames = Hash.new

def format_name(first, last)
  if first == "" || last == ""
    return nil
  else
  first = first.gsub(/(\W|\d)/, "")
  last = last.gsub(/(\W|\d)/, "")
  un = (first[0]+last)
  un.downcase
  end
end

def format_year(year)
  yy = year.to_s
  return nil if yy.length !=4
  yy[-2..-1]
end

def check_privilege(level = 0)
  level = level.floor
  return "user" if level == 0
  return "seller" if level == 1
  return "manager" if level == 2
  return "admin" if level >=3
end

def user_type_prefix(level = 0)
  return "" if level == 0
  return "seller-" if level == 1
  return "manager-" if level == 2
  return "admin-" if level >=3
end

def build_username(first, last, year, level = 0)
  username = user_type_prefix(level) + format_name(first, last) + format_year(year)
end

def generate_username(first, last, year, level = 0)
  username = user_type_prefix(level) + format_name(first, last) + format_year(year)
  if $usernames.has_key?(username)
    $usernames[username] += 1
    username = username + "_" + $usernames[username].to_s
  else
    $usernames[username] = 0
    username
  end
end
