## Seed Data ##
BreweryType.create( :name => 'Homebrew' )
BreweryType.create( :name => 'Commercial' )
BreweryType.create( :name => 'Brew Pub' )

MembershipType.create( :name => 'Admin' )
MembershipType.create( :name => 'Brewer' )
MembershipType.create( :name => 'Owner' )

## Test Data ##
test_user_1 = User.create( :login => 'test1', :password => 'test', :password_confirmation => 'test' )
test_user_2 = User.create( :login => 'test2', :password => 'test', :password_confirmation => 'test' )

test_brewery = Brewery.create( :name => 'Test Brewery 1', :brewery_type => BreweryType.find_by_name('Homebrew') )

test_user_1.memberships << Membership.create( :brewery => test_brewery, :membership_type => MembershipType.find_by_name('Owner') )
test_user_1.memberships << Membership.create( :brewery => test_brewery, :membership_type => MembershipType.find_by_name('Admin') )
test_user_1.memberships << Membership.create( :brewery => test_brewery, :membership_type => MembershipType.find_by_name('Brewer') )

test_user_2.memberships << Membership.create( :brewery => test_brewery, :membership_type => MembershipType.find_by_name('Brewer') )

test_user_1.save
test_user_2.save

