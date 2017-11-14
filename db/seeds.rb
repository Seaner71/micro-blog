# Put data creation code here
# Initiate the data by running 'rake db:seed'
# in the command line after running migrations (rake db:migrate)

# e.g.
# User.create(f_name: 'Bobby', l_name: 'McBobberson')
User.destroy_all

require 'faker'

user = User.create(username: 'nwitte', f_name: 'Nikki', l_name: 'Witte', email: 'nwitte@gmail.com')
user = User.create(username: 'nmp4', f_name: 'Natalie', l_name: "Portman", email: 'natport@gmail.com')
user = User.create(username: 'sean', f_name: 'Sean', l_name: "Smyth", email: 'ssmyth1071@gmail.com')
user = User.create(username: 'pdiddy', f_name: 'Sean', l_name: "Combs", email: 'pdiddy@badboy.com')
user = User.create(username: 'clooney', f_name: 'George', l_name: 'Clooney', email: 'georgec@gmail.com')
user = User.create(username: 'natalie', f_name: 'Natalie', l_name: 'Russo', email: 'martin.nat@gmail.com')
