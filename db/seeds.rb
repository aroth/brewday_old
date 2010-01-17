test_user_1 = User.create( :login => 'test1', :password => 'test', :password_confirmation => 'test' )
test_user_2 = User.create( :login => 'test2', :password => 'test', :password_confirmation => 'test' )

test_brewery = Brewery.create( :name => 'Test Brewery 1')

test_user_1.memberships << Membership.create( :brewery => test_brewery, :role => 'admin' )
test_user_2.memberships << Membership.create( :brewery => test_brewery, :role => 'admin' )

test_user_1.save
test_user_2.save

