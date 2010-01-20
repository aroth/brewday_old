## Seed Data ##
bsc1 = BeerStyleCategory.create( :name => 'Lite Lager', :code => '1' )

bs1 = BeerStyle.create( :beer_style_category => bsc1, 
                        :name => 'Lite American Lager', 
                        :code => '1A', 
                        :stats_ibus => '8-12',
                        :stats_og => '1.028 - 1.040',
                        :stats_fg => '0.998 - 1.008',
                        :stats_srm => '2-3',
                        :stats_abv => '2.8% - 4.2%' )

bs2 = BeerStyle.create( :beer_style_category => bsc1, 
                        :name => 'Standard American Lager', 
                        :code => '1B', 
                        :stats_ibus => '8-15',
                        :stats_og => '1.040 - 1.050',
                        :stats_fg => '1.004 - 1.010',
                        :stats_srm => '2-4',
                        :stats_abv => '4.2% - 5.3%' )

BreweryType.create( :name => 'Homebrew' )
BreweryType.create( :name => 'Commercial' )
BreweryType.create( :name => 'Brew Pub' )

MembershipType.create( :name => 'Admin' )
MembershipType.create( :name => 'Brewer' )
MembershipType.create( :name => 'Owner' )

## Test Data ##
user_1 = User.create( :login => 'test1', :password => 'password', :password_confirmation => 'password' )
user_2 = User.create( :login => 'test2',  :password => 'password', :password_confirmation => 'password' )
user_3 = User.create( :login => 'test3', :password => 'password', :password_confirmation => 'password' )

brewery = Brewery.create( :name => 'Sample Brewing Co', :brewery_type => BreweryType.find_by_name('Homebrew') )

e1 = Expense.new( :name => 'Equipment Purchase', :involvements => [Involvement.new( :user => user_1 ), Involvement.new( :user => user_2 )] )
e1a = e1.expense_entries << ExpenseEntry.create( :name => 'Hurricane Burner', :description => 'Purchased from Northern Brewer', :timestamp => Time.now - 1.week, :price => Money.new(7995, "USD") )
e1a = e1.expense_entries << ExpenseEntry.create( :name => '15 Gallon Kettle', :description => 'Purchased from Northern Brewer', :timestamp => Time.now - 1.week, :price => Money.new(32995, "USD") )

brewery.expenses << e1

user_1.memberships << Membership.create( :brewery => brewery, :membership_type => MembershipType.find_by_name('Brewer') )
user_2.memberships << Membership.create( :brewery => brewery, :membership_type => MembershipType.find_by_name('Brewer') )

r1 = Recipe.create( :name => 'English IPA', :brewery => brewery, :beer_style => bs1 ) 
r2 = Recipe.create( :name => 'Czech Pils', :brewery => brewery, :beer_style => bs2 ) 
r3 = Recipe.create( :name => 'Black Lager', :brewery => brewery, :beer_style => bs1 ) 

t_date = Time.now - 6.months

b1 = Batch.create( :brewery => brewery, :index => 1, :recipe => r1, :batch_date => t_date + 1.week )
b2 = Batch.create( :brewery => brewery, :index => 2, :recipe => r2, :batch_date => t_date + 3.weeks )

b1a1 = Action.create( :name => 'Brewing' )
b1a2 = Action.create( :name => 'Kegging' )

b1a1.involvements << Involvement.new( :user => user_1, :role => 'Head Brewer' )
b1a1.involvements << Involvement.new( :user => user_2, :role => 'Assistant Brewer' )
b1a1.involvements << Involvement.new( :user => user_3, :role => 'Guest Brewer' )

b1a2.involvements << Involvement.new( :user => user_1 )

b1.actions << b1a1 
b1.actions << b1a2

b1a1.action_entries << ActionEntry.create( :name => 'Start Session', :timestamp => b1.batch_date + 1.hour )
b1a1.action_entries << ActionEntry.create( :name => 'Start Boil', :timestamp => b1.batch_date + 3.hours )
b1a1.action_entries << ActionEntry.create( :name => 'End Session', :timestamp => b1.batch_date + 5.hours )

b1a2.action_entries << ActionEntry.create( :name => 'Clean Keg', :timestamp => b1.batch_date + 1.month )
b1a2.action_entries << ActionEntry.create( :name => 'Transfer into Keg', :timestamp => b1.batch_date + 1.month + 1.hour )
b1a2.action_entries << ActionEntry.create( :name => 'Condition Keg', :timestamp => b1.batch_date + 1.month + 3.hours )
b1a2.action_entries << ActionEntry.create( :name => 'Put Keg On', :timestamp => b1.batch_date + 1.month + 2.days )
b1a2.action_entries << ActionEntry.create( :name => 'Keg Kicked', :timestamp => b1.batch_date + 1.month + 2.weeks )