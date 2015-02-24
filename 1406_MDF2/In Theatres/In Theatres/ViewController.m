//
//  ViewController.m
//  In Theatres
//
//  Created by Angela Smith on 6/19/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.

#import "ViewController.h"
#import "TheatreInfoObject.h"
#import "MovieInfoObject.h"
#import "MovieInfoTableViewCell.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    // BUILD THEATRES WITH THEIR MOVIES
    // THEATRE 1
    TheatreInfoObject* theatre1 = [[TheatreInfoObject alloc] init];
    if (theatre1 != nil)
    {
        theatre1.theatreName = @"Mann Hopkins Cinema 6";
        theatre1.theatreAddress = @"1118 Main Street Hopkins, 55343";
        theatre1.theatrePhone = @"(952) 931-7992";
        theatre1.theatreImage = [UIImage imageNamed:@"mannHopkins.jpg"];
        
        // Begin THEATRE 1 Movies
        // THE AMAZING SPIDER-MAN 2
        MovieInfoObject* movie1 = [[MovieInfoObject alloc] init];
        if (movie1 != nil)
        {
            movie1.movieName = @"The Amazing Spider-Man 2";
            movie1.movieRating = @"PG-13";
            movie1.movieShowTimes = @"12:45pm, 3:50pm, 6:55pm, 9:45pm";
            //movie1.movieTrailerUrlString = @"http://a1268.v.phobos.apple.com/us/r1000/092/Video/2c/a6/4c/mzm.ybyyjees..640x354.h264lc.d2.p.m4v";
            movie1.movieTrailerUrlString = @"http://movietrailers.apple.com/movies/sony_pictures/theamazingspiderman2/spiderman2-tlr3_480p.mov";
            // http://trailers.apple.com/trailers/dreamworks/howtotrainyourdragon2/includes/large.html#videos-large
            // http://movietrailers.apple.com/movies/dreamworks/howtotrainyourdragon2/howtotrainyourdragon-tlr1b_480p.mov
            NSURL* image = [NSURL URLWithString:@"http://a1.mzstatic.com/us/r30/Video/v4/ff/1e/bc/ff1ebca1-1f31-5d79-b986-695d1d7b5397/mza_4303862927756297225.100x100-75.jpg"];
            movie1.movieImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:image]];
            movie1.movieDescription = @"Peter Parker is going back to high school in The Amazing Spider-Man as a teenager dealing with both contemporary human problems and amazing super-human crises.";
            movie1.movieTheatre = theatre1.theatreName;
        }

        // CAPTAIN AMERICA https://itunes.apple.com/search?term=captain+america+winter
        MovieInfoObject* movie2 = [[MovieInfoObject alloc] init];
        if (movie2 != nil) {
            movie2.movieName = @"Captain America: The Winter Soldier";
            movie2.movieRating = @"PG-13";
            movie2.movieShowTimes = @"12:30pm, 3:50pm, 6:45pm, 9:40pm";
            movie2.movieTrailerUrlString = @"http://movietrailers.apple.com/movies/marvel/captainamericathewintersoldier/captainamerica-clip1_480p.mov";
            NSURL* image = [NSURL URLWithString:@"http://a5.mzstatic.com/us/r30/Video5/v4/d0/8e/a6/d08ea688-19a6-52a1-0589-2ec24e21a3b7/Captain_America_The_Winter_Soldier_Global_EST_and_VOD_Apple_US_1400_x_2100.100x100-75.jpg"];
            movie2.movieImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:image]];
            movie2.movieDescription = @"After the cataclysmic events in New York with The Avengers, Marvel’s “Captain America: The Winter Soldier” finds Steve Rogers, aka Captain America, living quietly in Washington, D.C. and trying to adjust to the modern world. But when a S.H.I.E.L.D. colleague comes under attack, Steve becomes embroiled in a web of intrigue that threatens to put the world at risk. Joining forces with the Black Widow, Captain America struggles to expose the ever-widening conspiracy while fighting off professional assassins sent to silence him at every turn. When the full scope of the villainous plot is revealed, Captain America and the Black Widow enlist the help of a new ally, the Falcon. However, they soon find themselves up against an unexpected and formidable enemy—the Winter Soldier.";
            movie2.movieTheatre = theatre1.theatreName;
        }
  
        // HEAVEN IS FOR REAL
        MovieInfoObject* movie3 = [[MovieInfoObject alloc] init];
        if (movie3 != nil)
        {
            movie3.movieName = @"Heaven is for Real";
            movie3.movieRating = @"PG";
            movie3.movieShowTimes = @"12:20pm, 2:30pm, 4:50pm, 7:20pm, 9:30pm";
            movie3.movieTrailerUrlString = @"http://movietrailers.apple.com/movies/sony_pictures/heavenisforreal/heavenisforreal-tlr1_480p.mov";
            NSURL* imageUrl = [NSURL URLWithString:@"http://a4.mzstatic.com/us/r30/Video/v4/94/be/c0/94bec03d-7bcd-fcb8-9bd7-b581cdb8417b/mza_5042444719906737671.100x100-75.jpg"];
            movie3.movieImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
            movie3.movieDescription = @"Based on the #1 New York Times best-selling book of the same name, Heaven is for Real brings to the screen the true story of a small-town father who must find the courage and conviction to share his son's extraordinary, life-changing experience with the world. The film stars Academy Award® nominee and Emmy® award winning actor Greg Kinnear as Todd Burpo and co-stars Kelly Reilly as Sonja Burpo, the real-life couple whose son Colton (newcomer Connor Corum) claims to have visited Heaven during a near death experience. Colton recounts the details of his amazing journey with childlike innocence and speaks matter-of-factly about things that happened before his birth... things he couldn't possibly know. Todd and his family are then challenged to examine the meaning from this remarkable event.";
            movie3.movieTheatre = theatre1.theatreName;
        }
        
        // DIVERGENT
        MovieInfoObject* movie4 = [[MovieInfoObject alloc] init];
        if (movie4 != nil)
        {
            movie4.movieName = @"Divergent";
            movie4.movieRating = @"PG-13";
            movie4.movieShowTimes = @"1:00pm, 4:00pm, 7:00pm, 10:00pm";
            movie4.movieTrailerUrlString = @"http://movietrailers.apple.com/movies/summit/divergent/divergent-tlr2_480p.mov";
            NSURL* image = [NSURL URLWithString:@"http://a4.mzstatic.com/us/r30/Video6/v4/25/18/ba/2518baa0-39e3-5767-35cc-a14b2af24609/mza_481775632224249618.100x100-75.jpg"];
            movie4.movieImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:image]];
            movie4.movieDescription = @"Based on the worldwide bestseller, DIVERGENT is a thrilling action-adventure set in a future world where people are divided into distinct factions based on human virtues. Tris Prior (Shailene Woodley) is warned she is Divergent and will never fit into any one group. When she discovers a conspiracy by a faction leader (Kate Winslet) to destroy all Divergents, she must find out what makes being Divergent so dangerous before it's too late.";
            movie4.movieTheatre = theatre1.theatreName;
        }
        
        // MALEFICENT https://itunes.apple.com/search?term=MALEFICENT
        MovieInfoObject* movie5 = [[MovieInfoObject alloc] init];
        if (movie5 != nil)
        {
            movie5.movieName = @"Maleficent";
            movie5.movieRating = @"PG";
            movie5.movieShowTimes = @"12:10pm, 2:20pm, 4:30pm, 6:50pm, 9:10pm";
            movie5.movieTrailerUrlString = @"http://movietrailers.apple.com/movies/disney/maleficent/maleficent-tvspot_480p.mov";
            NSURL* imageUrl = [NSURL URLWithString:@"http://a4.mzstatic.com/us/r30/Video5/v4/40/ba/59/40ba594f-1c87-33a3-25ca-dffdb36de1ac/Maleficent_NA_EST_AND_VOD_Poster_Key_Art_PNG_1400_x_2100_US.100x100-75.jpg"];
            movie5.movieImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
            movie5.movieDescription = @"Maleficent explores the untold story of Disney’s most iconic villain from the classic Sleeping Beauty and the elements of her betrayal that ultimately turn her pure heart to stone. Driven by revenge and a fierce desire to protect the moors over which she presides, Maleficent cruelly places an irrevocable curse upon the human king’s newborn infant Aurora. As the child grows, Aurora is caught in the middle of the seething conflict between the forest kingdom she has grown to love and the human kingdom that holds her legacy. Maleficent realises that Aurora may hold the key to peace in the land and is forced to take drastic actions that will change both worlds forever.";
            movie5.movieTheatre = theatre1.theatreName;
        }
        
        // ADD MOVIE OBJECTS TO THEATRE OBJECT
        theatre1.theatreMovies = [[NSArray alloc] initWithObjects: movie1, movie2, movie3, movie4, movie5, nil];
        
        
    }
    
    // THEATRE 2
    TheatreInfoObject* theatre2 = [[TheatreInfoObject alloc] init];
    if (theatre2 != nil)
    {
        theatre2.theatreName = @"AMC Eden Prairie Mall 18";
        theatre2.theatreAddress = @"8251 Flying Cloud Drive Eden Prairie, 55344";
        theatre2.theatrePhone = @"(888) AMC-4FUN";
        theatre2.theatreImage = [UIImage imageNamed:@"amcEP.jpeg"];
        
        // build this theatre's movie list
        
        // NEIGHBORS https://itunes.apple.com/search?term=NEIGHBORS
        MovieInfoObject* movie1 = [[MovieInfoObject alloc] init];
        if (movie1 != nil)
        {
            movie1.movieName = @"Neighbors";
            movie1.movieRating = @"R";
            movie1.movieShowTimes = @"12:05PM, 2:15PM, 4:40PM, 9:30PM";
            movie1.movieTrailerUrlString = @"http://movietrailers.apple.com/movies/universal/neighbors/neighbors-tlr2_480p.mov";
            NSURL* image = [NSURL URLWithString:@"http://a4.mzstatic.com/us/r30/Video3/v4/76/db/28/76db28c8-d1bc-53a9-3926-45d869f46a10/02425_MLNA_Neighbors_TEMP_1400x2100.100x100-75.jpg"];
            movie1.movieImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:image]];
            movie1.movieDescription = @"Seth Rogen, Zac Efron and Rose Byrne lead the cast of Neighbors, a comedy about a young couple suffering from arrested development who are forced to live next to a fraternity house after the birth of their newborn baby.";
            movie1.movieTheatre = theatre2.theatreName;
        }
        
        // CHEF https://itunes.apple.com/search?term=chef
        MovieInfoObject* movie2 = [[MovieInfoObject alloc] init];
        if (movie2 != nil) {
            movie2.movieName = @"Chef";
            movie2.movieRating = @"R";
            movie2.movieShowTimes = @"1:00pm, 4:00pm, 7:00pm, 10:00pm";
            movie2.movieTrailerUrlString = @"http://movietrailers.apple.com/movies/independent/chef/chef-tlr1_480p.mov";
            NSURL* image = [NSURL URLWithString:@"http://a4.mzstatic.com/us/r30/Video1/v4/77/11/0a/77110ad8-061b-5993-9f2f-1f383fc7fcac/89103_MLNA_Chef_TempTheaterical1400x2100.100x100-75.jpg"];
            movie2.movieImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:image]];
            movie2.movieDescription = @"When Chef Carl Casper (Jon Favreau) suddenly quits his job at a prominent Los Angeles restaurant after refusing to compromise his creative integrity for its controlling owner (Dustin Hoffman), he is left to figure out what’s next. Finding himself in Miami, he teams up with his ex-wife (Sofia Vergara), his friend (John Leguizamo) and his son (Emjay Anthony) to launch a food truck. Taking to the road, Chef Carl goes back to his roots to reignite his passion for the kitchen -- and zest for life and love.";
            movie2.movieTheatre = theatre2.theatreName;
        }
        
        // THE OTHER WOMAN https://itunes.apple.com/search?term=the+other+woman
        MovieInfoObject* movie3 = [[MovieInfoObject alloc] init];
        if (movie3 != nil)
        {
            movie3.movieName = @"The Other Woman";
            movie3.movieRating = @"PG-13";
            movie3.movieShowTimes = @"12:05PM, 7:05PM";
            movie3.movieTrailerUrlString = @"http://movietrailers.apple.com/movies/fox/theotherwoman/theotherwoman-tlr1_480p.mov";
            NSURL* imageUrl = [NSURL URLWithString:@"http://a5.mzstatic.com/us/r30/Video2/v4/f3/ea/27/f3ea27de-e201-3f5b-a3b3-d2264037dd2b/mza_348260673966678759.100x100-75.jpg"];
            movie3.movieImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
            movie3.movieDescription = @"When Carly (Diaz) learns that her boyfriend (Nikolaj Coster-Waldau) has a wife (Leslie Mann), the two women become unlikely friends. When he turns out to be an even bigger cheat than they knew, they make plans with yet another of his mistresses (Kate Upton) to teach him a lesson – or three!";
            movie2.movieTheatre = theatre2.theatreName;
        }
        
        // HOW TO TRAIN YOUR DRAGON 2 https://itunes.apple.com/search?term=HOW+TRAIN+DRAGON
        MovieInfoObject* movie4 = [[MovieInfoObject alloc] init];
        if (movie4 != nil)
        {
            movie4.movieName = @"How To Train Your Dragon 2";
            movie4.movieRating = @"PG";
            movie4.movieShowTimes = @"1:50PM, 4:45PM, 7:40PM, 10:30PM ";
            movie4.movieTrailerUrlString = @"http://movietrailers.apple.com/movies/dreamworks/howtotrainyourdragon2/howtotrainyourdragon-tlr1b_480p.mov";
            NSURL* imageUrl = [NSURL URLWithString:@"http://a3.mzstatic.com/us/r30/Video3/v4/65/43/2d/65432d51-1c58-ce4f-2fe6-372d3a7d60ff/posterart_EN.100x100-75.jpg"];
            movie4.movieImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
            movie4.movieDescription = @"From the Academy Award® nominated film DreamWorks How to Train Your Dragon comes the next chapter in the epic trilogy. When Hiccup and Toothless discover a secret ice cave with wild dragons and a mysterious Dragon Rider, the two friends find themselves in an epic battle to save the future of men and dragons! Also includes all new adventure How to Train Your Dragon: Dawn of the Dragon Racers in your iTunes Extras!";
            movie4.movieTheatre = theatre2.theatreName;
        }
        
        // 300 RISE OF AN EMPIRE https://itunes.apple.com/search?term=300+rise+Empire
        MovieInfoObject* movie5 = [[MovieInfoObject alloc] init];
        if (movie5 != nil)
        {
            movie5.movieName = @"300: Rise of an Empire";
            movie5.movieRating = @"R";
            movie5.movieShowTimes = @"7:00PM, 10:15PM";
            movie5.movieTrailerUrlString = @"http://movietrailers.apple.com/movies/wb/300riseofanempire/300-heros_480p.mov";
            NSURL* imageUrl = [NSURL URLWithString:@"http://a3.mzstatic.com/us/r30/Video2/v4/d4/6b/26/d46b26d8-305e-42f4-4134-a6cbe91cb9fd/mza_4824737418704766211.100x100-75.jpg"];
            movie5.movieImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
            movie5.movieDescription = @"Based on Frank Miller's graphic novel Xerxes, and told in the breathtaking visual style of the blockbuster 300, this new chapter of the epic saga takes the action to a fresh battlefield - on the sea - as Greek general Themistokles attempts to unite all of Greece by leading the charge that will change the course of the war. 300: Rise of an Empire pits Themistokles against the massive invading Persian forces led by mortal-turned-god Xerxes, and Artemisia, vengeful commander of the Persian navy.";
            movie5.movieTheatre = theatre2.theatreName;
        }
        theatre2.theatreMovies = [[NSArray alloc] initWithObjects: movie1, movie2, movie3, movie4, movie5, nil];
    }
    
    // THEATRE 3
    TheatreInfoObject* theatre3 = [[TheatreInfoObject alloc] init];
    if (theatre3 != nil)
    {
        theatre3.theatreName = @"Marcus Shakopee Cinema";
        theatre3.theatreAddress = @"1116 Shakopee Town Road Shakopee, 55379";
        theatre3.theatrePhone = @"(952) 445-5300";
        theatre3.theatreImage = [UIImage imageNamed:@"marcusShakopee.jpg"];
        
        // build this theatre's movie list
        
        // SON OF GOD
        MovieInfoObject* movie1 = [[MovieInfoObject alloc] init];
        if (movie1 != nil)
        {
            movie1.movieName = @"Son of God";
            movie1.movieRating = @"PG-13";
            movie1.movieShowTimes = @"4:15pm, 7:30pm, 10:45pm";
            movie1.movieTrailerUrlString = @"http://movietrailers.apple.com/movies/fox/sonofgod/sonofgod-tlr1_480p.mov";
            NSURL* image = [NSURL URLWithString:@"http://a5.mzstatic.com/us/r30/Video/v4/74/8f/c7/748fc71d-046e-cd4a-5b33-64b0216656c1/mza_7883473519853170542.100x100-75.jpg"];
            movie1.movieImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:image]];
            movie1.movieDescription = @"From producers Mark Burnett and Roma Downey comes Son of God — the most important chapter of the Greatest Story Ever Told. Acclaimed Portuguese actor Diogo Morgado delivers a spectacular portrayal of Jesus as this powerful and inspirational feature film depicts the life of Christ, from his humble birth through his teachings, crucifixion and ultimate resurrection.";
            movie1.movieTheatre = theatre3.theatreName;
        }
        
        // THE HOBBIT: THE DESOLATION OF SMAUG https://itunes.apple.com/search?term=hobbit+smaug
        MovieInfoObject* movie2 = [[MovieInfoObject alloc] init];
        if (movie2 != nil) {
            movie2.movieName = @"The Hobbit: The Desolation of Smaug";
            movie2.movieRating = @"PG-13";
            movie2.movieShowTimes = @"1:00pm, 2:55pm, 7:15pm, 10:30pm";
            movie2.movieTrailerUrlString = @"http://movietrailers.apple.com/movies/wb/thehobbit2/thehobbit-tlr2_480p.mov";
            NSURL* image = [NSURL URLWithString:@"http://a1.mzstatic.com/us/r30/Video6/v4/71/5e/32/715e321f-e15e-9fac-2f47-40956433383f/mza_7740628517986330538.100x100-75.jpg"];
            movie2.movieImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:image]];
            movie2.movieDescription = @"Academy Award® winner Peter Jackson continues his Middle-earth adventure following Bilbo Baggins (Martin Freeman) who's swept into an epic quest to reclaim the lost Dwarf Kingdom of Erebor from the fearsome dragon Smaug. In the company of thirteen dwarves and the wizard Gandalf the Grey (Ian McKellen), Bilbo enters the Lonely Mountain in possession of Gollum's precious ring and his keen blade, Sting. With an all-star cast and the effects wizardry of Jackson's award-winning Weta Workshop, Tolkien's epic story comes to life as never before imagined.";
            movie2.movieTheatre = theatre3.theatreName;
        }
        
        // POMPEII https://itunes.apple.com/search?term=pompeii
        MovieInfoObject* movie3 = [[MovieInfoObject alloc] init];
        if (movie3 != nil)
        {
            movie3.movieName = @"Pompeii";
            movie3.movieRating = @"PG-13";
            movie3.movieShowTimes = @"2:30PM, 4:45PM, 7:00PM";
            movie3.movieTrailerUrlString = @"http://movietrailers.apple.com/movies/sony_pictures/pompeii/pompeii-tlr1_480p.mov";
            NSURL* imageUrl = [NSURL URLWithString:@"http://a1.mzstatic.com/us/r30/Video6/v4/e7/bc/53/e7bc536e-d8ea-36a1-e967-dbe20aedca72/mza_7978438419962874875.100x100-75.jpg"];
            movie3.movieImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
            movie3.movieDescription = @"Set in 79 A.D., Pompeii tells the epic story of Milo (Kit Harrington), a slave turned invincible gladiator who finds himself in a race against time to save his true love Cassia (Emily Browning), the beautiful daughter of a wealthy merchant who has been unwillingly betrothed to a corrupt Roman Senator (Kiefer Sutherland).  As Mount Vesuvius erupts in a torrent of blazing lava, Milo must fight his way out of the arena in order to save his beloved as the once magnificent Pompeii crumbles around him.";
            movie3.movieTheatre = theatre3.theatreName;
        }
        
        // SAVING MR BANKS https://itunes.apple.com/search?term=saving+banks
        MovieInfoObject* movie4 = [[MovieInfoObject alloc] init];
        if (movie4 != nil)
        {
            movie4.movieName = @"Saving Mr. Banks";
            movie4.movieRating = @"PG-13";
            movie4.movieShowTimes = @"2:25PM, 5:15PM, 7:45PM";
            movie4.movieTrailerUrlString = @"http://movietrailers.apple.com/movies/disney/savingmrbanks/savingmrbanks-tlr1_480p.mov";
            NSURL* imageUrl = [NSURL URLWithString:@"http://a3.mzstatic.com/us/r30/Video5/v4/52/d1/13/52d11307-be49-bf18-ab51-318fd3786879/Saving_Mr_Banks_1400_x_2100_USA_Apple.100x100-75.jpg"];
            movie4.movieImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
            movie4.movieDescription = @"Tom Hanks and Emma Thompson bring to life the untold true story about the origins of one of the most treasured Disney classics of all time. John Lee Hancock directs this acclaimed film that reveals the surprising backstory behind the making of Mary Poppins. Determined to fulfill a promise to his daughters, Walt Disney (Hanks) tries for 20 years to obtain the rights to author P. L. Travers’ (Thompson) beloved book. Armed with his iconic creative vision, Walt pulls out all the stops, but the uncompromising Travers won’t budge. Only when he reaches into his own complicated childhood does Walt discover the truth about the ghosts that haunt Travers, and together, they set “Mary Poppins” free!";
            movie4.movieTheatre = theatre3.theatreName;
            
        }
        
        // 12 YEARS AS A SLAVE https://itunes.apple.com/search?term=12+years+slave
        MovieInfoObject* movie5 = [[MovieInfoObject alloc] init];
        if (movie5 != nil)
        {
            movie5.movieName = @"12 Years a Slave";
            movie5.movieRating = @"R";
            movie5.movieShowTimes = @"7:15PM, 9:45PM";
            movie5.movieTrailerUrlString = @"http://movietrailers.apple.com/movies/fox_searchlight/12yearsaslave/12yearsaslave-tlr_480p.mov";
            NSURL* imageUrl = [NSURL URLWithString:@"http://a1.mzstatic.com/us/r30/Video6/v4/a9/97/38/a9973833-60ed-3e6b-f325-d06c49a46512/mza_1104964561962221445.100x100-75.jpg"];
            movie5.movieImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
            movie5.movieDescription = @"From director Steve McQueen and based on Solomon Northup’s astonishing true story comes this powerful winner of three 2013 Academy Awards®, including Best Picture and Best Supporting Actress (Lupita Nyong’o). In 1841, Northup (Chiwetel Ejiofor), a free citizen, is kidnapped, stripped of his identity and sold into slavery. Now, he must find the strength to survive in this unflinching story of hope.";
            movie5.movieTheatre = theatre3.theatreName;
        }
        theatre3.theatreMovies = [[NSArray alloc] initWithObjects: movie1, movie2, movie3, movie4, movie5, nil];
    }

    // Add the theaters to the array
    theatresArray = [[NSArray alloc] initWithObjects:theatre1, theatre2, theatre3, nil];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

// TABLEVIEW METHODS

// DESIGN: CREATE THE CUSTOM HEADER
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100.0f;
}
/*
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    // add a background color
    UITableViewHeaderFooterView* headerView = (UITableViewHeaderFooterView*)view;
    if (headerView != nil)
    {
        headerView.contentView.backgroundColor = [UIColor yellowColor];
        // make Theatre Title Label
        UILabel* theatreTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 150.0f, 20.0f)];
        TheatreInfoObject* theatreInfo = [theatresArray objectAtIndex:section];
        theatreTitleLabel.text = theatreInfo.theatreName;
        theatreTitleLabel.text = @"Hello";
        theatreTitleLabel.backgroundColor = [UIColor greenColor];
        [headerView.contentView addSubview:theatreTitleLabel];
 
    }
}
*/

// DATA: SET THE NUMBER OF SECTIONS IN TABLEVIEW
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections that equal the number of theatres listed
    return [theatresArray count];
}

// DATA: SET THE NUMBER OF ROWS IN EACH SECTION OF THE TABLEVIEW
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Find the object that matches the section
    TheatreInfoObject* theatreInfo = [theatresArray objectAtIndex:section];
    // return the number of rows that section of movies has
    NSInteger numOfSections = theatreInfo.theatreMovies.count;
    return numOfSections;
}

// DATA: SET THE TABLEVIEW CELL INFORMATION
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieInfoTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"movieCell"];
    if (cell != nil) {
        // add background image
        UIImage* cellBgImage =  [UIImage imageNamed:@"listBG.png"];
        cell.backgroundColor = [UIColor colorWithPatternImage:cellBgImage];
        // Add a bg tint when the cell is selected
        UIView *cellBGWhenSelected = [[UIView alloc] init];
        cellBGWhenSelected.backgroundColor = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.2];
        // Set the cell background
        cell.selectedBackgroundView = cellBGWhenSelected;
        
        TheatreInfoObject* theatreInfo = [theatresArray objectAtIndex:indexPath.section];
        MovieInfoObject* movieInfo = [theatreInfo.theatreMovies objectAtIndex:indexPath.row];
        
        cell.movieTitleLabel.text = movieInfo.movieName;
        cell.movieShowTimesLabel.text = movieInfo.movieShowTimes;
        cell.movieImage.image = movieInfo.movieImage;
        
    }
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    TheatreInfoObject* theatreInfo = [theatresArray objectAtIndex:section];
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 100.0f)];    
    if (headerView != nil)
    {
        UIImageView* backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320.0f, 100.0f)];
        backgroundImage.backgroundColor = [UIColor blackColor];
        backgroundImage.image = theatreInfo.theatreImage;
        [headerView addSubview:backgroundImage];
        
        // Create the theatre title label
        UILabel* theatreTitlelabel = [[UILabel alloc] initWithFrame:CGRectMake(5.0f, 55.0f, tableView.frame.size.width-10.0f, 30.0f)];
        if (theatreTitlelabel != nil)
        {
            theatreTitlelabel.backgroundColor = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
            theatreTitlelabel.textColor = [UIColor whiteColor];
            theatreTitlelabel.text = theatreInfo.theatreName;
            // Add the label to the view
            [headerView addSubview:theatreTitlelabel];
        }

        // Create the theatre lcoation address label
        UILabel* theatreLocationLabel = [[UILabel alloc] initWithFrame:CGRectMake(5.0f, 80.0f, tableView.frame.size.width-10.0f, 15.0f)];
        
        if (theatreLocationLabel != nil)
        {
            // Set the label text and font
            theatreLocationLabel.backgroundColor = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
            theatreLocationLabel.text = theatreInfo.theatreAddress;
            theatreLocationLabel.textColor = [UIColor whiteColor];
            [theatreLocationLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:12.0f]];
            // Add the label to the view
            [headerView addSubview:theatreLocationLabel];
        }
        
    }
    return headerView;

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // get the sell that was sent over
    MovieInfoTableViewCell* cell = (MovieInfoTableViewCell*)sender;
    if (cell != nil)
    {
        // Get the index path of the cell
        NSIndexPath* indexPath = [movieTableView indexPathForCell:cell];
        TheatreInfoObject* theatreInfo = [theatresArray objectAtIndex:indexPath.section];
        MovieInfoObject* movieInfo = [theatreInfo.theatreMovies objectAtIndex:indexPath.row];
        // Pass the current object to the detail view
        DetailViewController* detailVC = segue.destinationViewController;
        detailVC.thisMovie = movieInfo;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
