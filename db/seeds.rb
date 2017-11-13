# Put data creation code here
# Initiate the data by running 'rake db:seed'
# in the command line after running migrations (rake db:migrate)

# e.g.
# User.create(f_name: 'Bobby', l_name: 'McBobberson')
User.destroy_all

user = User.create(username: 'nwitte', f_name: 'Nikki', l_name: 'Witte', email: 'nwitte@gmail.com')
user = User.create(username: 'nmp4', f_name: 'Natalie', l_name: "Portman", email: 'natport@gmail.com')
user = User.create(username: 'sean')
user = User.create(username: 'ss71')
user = User.create(username: 'natalietate')
user = User.create(username: 'natalie')
