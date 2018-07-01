#!/usr/bin/env ruby
require 'pry'

def run(command)
    puts command
    system command
end

puts 'Enter the email address associated with your Github acccount (e.g. jsmith@example.com):'
email = gets.strip
puts 'Enter the name you want associated with your code changes (e.g. John H. Smith):'
name = gets.strip
puts 'Enter the login you use for your Github account (e.g. jhsmith):'
login = gets.strip


run "git config --global user.name \"#{name}\""
run "git config --global user.email \"#{email}\""
run "git remote set-url origin https://github.com/FreeUKGen/MyopicVicar.git"
run "git pull"
run "bundle install"


mysql_running = `ps -ef | grep mysql | grep -v grep`
unless mysql_running.match 'mysql'
    puts "MySQL not running -- starting it now"
    system "sudo /etc/init.d/mysql start"
end


mongo_running = `ps -ef | grep mongod`
unless mongo_running.match 'mongod --bind_ip'
    puts "MongoDB not running -- starting it now"
    run "./mongod"
    puts "Waitng 20s for MongoDB to finish setup"
    sleep 20
end

mongo_host = `mongo --quiet --eval 'hostname()'`.strip
run "sed -e 's/localhost:27017/#{mongo_host}:27017/g' config/mongoid.example.yml > config/mongoid.yml"


