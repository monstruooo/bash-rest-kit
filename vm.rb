#!/usr/bin/ruby

require 'rubygems'
require 'rbvmomi'
require 'pp'
#require 'alchemist'


#print "User: "
#user = gets

#print "Password: "
#require 'io/console'
#pass = STDIN.noecho(&:gets).chomp
#puts

creds = [ 'vmcenter', 'vmuser' , 'vmpass' ]
creds.each do |cred|
        unless  ENV[cred] =~ /[a-zA-Z]/
                puts "Define \"#{cred}\" in your shell"
                #cred == 'vmpass' ? (puts "\tExample: read -r -s #{cred} ; export #{cred}") : (puts "\tExample: export #{cred}=<#{cred}>")
                cred == 'vmpass' ?
                        (puts "\tExample: read -r -s #{cred} ; export #{cred}")
                        :
                        (print " \t Example: export #{cred}=" ; puts "<#{cred.sub(/^vm/,'')}> ")
                exit
        end
end

hyper = ENV['vmcenter']
user = ENV['vmuser']
pass = ENV['vmpass']

puts "Connecting..."
vim = RbVmomi::VIM.connect :host => hyper, :user => user, :password => pass, :insecure => true

puts "getting time"

#
# get current time
#
puts "Time on #{hyper}: " + vim.serviceInstance.CurrentTime.to_s

