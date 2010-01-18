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

BrewershipType.create( :name => 'Head Brewer' )
BrewershipType.create( :name => 'Assistant Brewer' )
BrewershipType.create( :name => 'Guest Brewer' )

## Test Data ##
user_1 = User.create( :login => 'test1', :password => 'password', :password_confirmation => 'password' )
user_2 = User.create( :login => 'test2',  :password => 'password', :password_confirmation => 'password' )
user_3 = User.create( :login => 'test3', :password => 'password', :password_confirmation => 'password' )

gcbc = Brewery.create( :name => 'Sample Brewing Co', :brewery_type => BreweryType.find_by_name('Homebrew') )

user_1.memberships << Membership.create( :brewery => gcbc, :membership_type => MembershipType.find_by_name('Brewer') )
user_2.memberships << Membership.create( :brewery => gcbc, :membership_type => MembershipType.find_by_name('Brewer') )

r1 = Recipe.create( :name => 'English IPA',     :brewery => gcbc, :beer_style => bs1 ) 
r2 = Recipe.create( :name => 'Czech Pils',    :brewery => gcbc, :beer_style => bs2 ) 
r3 = Recipe.create( :name => 'Black Lager', :brewery => gcbc, :beer_style => bs1 ) 
r4 = Recipe.create( :name => 'American Pale Ale',     :brewery => gcbc, :beer_style => bs2 )

bd1 = BrewDay.create( :brewery => gcbc, :brew_date => Time.now - 1.week,  :recipe => r1 )
bd1.brewerships << Brewership.create( :user => user_1, :brewership_type => BrewershipType.find_by_name('Head Brewer') )
bd1.brewerships << Brewership.create( :user => user_2, :brewership_type => BrewershipType.find_by_name('Assistant Brewer') )
bd1.brewerships << Brewership.create( :user => user_3, :brewership_type => BrewershipType.find_by_name('Guest Brewer') )

tl1 = Timeline.create( :brew_day => bd1 )
tl1.timeline_entries << TimelineEntry.create( :entry_timestamp => bd1.brew_date + 5.minutes, :name => 'Start Day' )
tl1.timeline_entries << TimelineEntry.create( :entry_timestamp => bd1.brew_date + 10.minutes, :name => 'Mashtun on Heat' )
tl1.timeline_entries << TimelineEntry.create( :entry_timestamp => bd1.brew_date + 110.minutes, :name => 'Begin Mash (60 min)' )
tl1.timeline_entries << TimelineEntry.create( :entry_timestamp => bd1.brew_date + 3.hours, :name => 'Begin Sparge (60 min)' )
tl1.timeline_entries << TimelineEntry.create( :entry_timestamp => bd1.brew_date + 4.hours, :name => 'Begin Boil (60 min)' )
tl1.timeline_entries << TimelineEntry.create( :entry_timestamp => bd1.brew_date + 6.hours, :name => 'End Day' )

bd2 = BrewDay.create( :brewery => gcbc, :brew_date => Time.now - 2.weeks, :recipe => r2 )
bd2.brewerships << Brewership.create( :user => user_2, :brewership_type => BrewershipType.find_by_name('Head Brewer') )
bd2.brewerships << Brewership.create( :user => user_1, :brewership_type => BrewershipType.find_by_name('Assistant Brewer') )

bd3 = BrewDay.create( :brewery => gcbc, :brew_date => Time.now - 3.weeks, :recipe => r3 )
bd3.brewerships << Brewership.create( :user => user_1, :brewership_type => BrewershipType.find_by_name('Head Brewer') )
bd3.brewerships << Brewership.create( :user => user_2, :brewership_type => BrewershipType.find_by_name('Assistant Brewer') )

bd4 = BrewDay.create( :brewery => gcbc, :brew_date => Time.now - 4.weeks, :recipe => r4 )
bd4.brewerships << Brewership.create( :user => user_2, :brewership_type => BrewershipType.find_by_name('Head Brewer') )
bd4.brewerships << Brewership.create( :user => user_1, :brewership_type => BrewershipType.find_by_name('Assistant Brewer') )