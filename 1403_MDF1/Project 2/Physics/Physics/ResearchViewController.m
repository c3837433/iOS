//
//  ResearchViewController.m
//  Physics
//
//  Created by Angela Smith on 3/8/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "ResearchViewController.h"
#import "CustomResearchCell.h"
#import "ResearchCustomClass.h"
#import "ResearchDetailViewController.h"
@interface ResearchViewController ()

@end

@implementation ResearchViewController


- (void)viewDidLoad
{
    // Build the custom object to hold the research data
    ResearchCustomClass* article1 = [[ResearchCustomClass alloc] init];
    article1.researchTitle = @"Video Games and the Physics Engines That Drive Them";
    article1.researchUrl = @"http://web.a.ebscohost.com.oclc.fullsail.edu:81/ehost/pdfviewer/pdfviewer?sid=3cc1c214-802d-4fc6-82a1-07c3273465a7%40sessionmgr4004&vid=8&hid=4207";
    article1.researchReference = @"Blickenstaff, J. (2013, September). Video Games and the Physics Engines That Drive Them. NSTA Reports!. pp. 22-23.";
    article1.researchSummary = @"Physics engines have had their part in video games for decades. From Pong to Angry Birds, physics is integral to gameplay, although developers have been required to design the game with cheats to ensure the games are not slowed down due to processing times. Today physics engines compute hours worth of calculations to speed up game play in apps, video games, and animated films.";
    
    ResearchCustomClass* article2 = [[ResearchCustomClass alloc] init];
    article2.researchTitle = @"Monster Physics";
    article2.researchUrl = @"http://web.a.ebscohost.com.oclc.fullsail.edu:81/ehost/pdfviewer/pdfviewer?sid=3cc1c214-802d-4fc6-82a1-07c3273465a7%40sessionmgr4004&vid=8&hid=4207";
    article2.researchReference = @"Monster Physics. (2012). Children's Technology Review, 20(6), 10.";
    article2.researchSummary = @"Child Technology Review featured the mobile application Monster Physics, and wrote about how the app provides a powerful educational learning experience for children. The app allows users to create and build machines from many different materials, and even allows them the ability to debug the design to improve them.";
    
    ResearchCustomClass* article3 = [[ResearchCustomClass alloc] init];
    article3.researchTitle = @"Working with Advanced Primary School Students in Physics";
    article3.researchUrl = @"http://web.a.ebscohost.com.oclc.fullsail.edu:81/ehost/pdfviewer/pdfviewer?sid=3cc1c214-802d-4fc6-82a1-07c3273465a7%40sessionmgr4004&vid=10&hid=4207";
    article3.researchReference = @"Jankovic, L., & Cucic, D. (2010). Working with Advanced Primary School Students in Physics. AIP Conference Proceedings, 1203(1), 1333-1335. doi:10.1063/1.3322366";
    article3.researchSummary = @"Students advanced (or gifted) in areas of science and physics require educators who understand not only deeper levels of the subject, but also the skills to working with the children. Working with Advanced Primary School Students in Physics overviewed a study completed over five years, and showed great results from working with the children throughout different areas such as of testing, educating, experimenting, and competing.";
    
    ResearchCustomClass* article4 = [[ResearchCustomClass alloc] init];
    article4.researchTitle = @"Learning Physics by Listening to Children";
    article4.researchUrl = @"http://web.a.ebscohost.com.oclc.fullsail.edu:81/ehost/pdfviewer/pdfviewer?sid=3cc1c214-802d-4fc6-82a1-07c3273465a7%40sessionmgr4004&vid=10&hid=4207";
    article4.researchReference = @"Harlow, D. B., & Otero, V. K. (2005). Learning Physics by Listening To Children. AIP Conference Proceedings, 790(1), 105-108. doi:10.1063/1.2084712";
    article4.researchSummary = @"Being able to communicate with children requires special skill. Since children use everyday words to express themselves, teachers need to be able to understand what a child is trying to say, especially when they do not have the proper vocabulary to express it. In Physics by Listening to Children, research found that when teachers pay close attention to what the children are saying, they can then either confirm or correct the children, while having an opportunity to give them more accurate language at the same time. Teaching physics requires the teachers to be able to listen.";
    
    ResearchCustomClass* article5 = [[ResearchCustomClass alloc] init];
    article5.researchTitle = @"Physics in Kindergarten";
    article5.researchUrl = @"http://web.a.ebscohost.com.oclc.fullsail.edu:81/ehost/pdfviewer/pdfviewer?sid=3cc1c214-802d-4fc6-82a1-07c3273465a7%40sessionmgr4004&vid=10&hid=4207";
    article5.researchReference = @"Flemming, I. (1994). Physics in kindergarten. European Education, 26(2), 18.";
    article5.researchSummary = @"Does the study of physics belong in Kindergarten classrooms? Surely structured lessons are not necessary, although in regards to areas of free play Physics in Kindergarten found many opportunities to allow children to discover foundations of physics. Laws of nature, gravity, and mechanics all can be naturally taught and experienced while children play. Without even giving the children technical terms, they can discover the wonders of physics and begin to build a small foundation for later lessons to build on.";
    
    // Initialize the article array with research objects
    researchArticlesArray = [[NSMutableArray alloc] initWithObjects:article1, article2, article3, article4, article5, nil];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger arrayLength = researchArticlesArray.count;
    return arrayLength;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomResearchCell* researchCell = [tableView dequeueReusableCellWithIdentifier:@"ResearchCell"];
    if (researchCell != nil) {
        ResearchCustomClass* thisArticle = [researchArticlesArray objectAtIndex:indexPath.row];
        // Refresh the cells with the object's information
        [researchCell refreshCellWithData:thisArticle.researchTitle];
    }
    return researchCell;
}

// Call the prepare for segue to move to the detail view for the article
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // The destination we are moving to is the research detail view
    ResearchDetailViewController* researchDetailVC = segue.destinationViewController;
    if (researchDetailVC != nil) {
        // Cast the sender to a UITableViewCell
        UITableViewCell* articleCell = (UITableViewCell*)sender;
        // set the index path to the physics subject cell that sent it over
        NSIndexPath* indexPath = [researchTableView indexPathForCell:articleCell];
        
        // Implement the class object so that the rows contain the objects
        ResearchCustomClass* thisArticle = [researchArticlesArray objectAtIndex:indexPath.row];
        // Set the current subject to the one passed to the view
        researchDetailVC.currentArticle = thisArticle;
    }
    
}

// Once the table view is in editing mode, if an item is deleted modify the table
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // This gets called when the delete button is pressed
    // check to see if we are in delete mode
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // remove the object from the array of data that is feeding the table view
        [researchArticlesArray removeObjectAtIndex:indexPath.row];
        // remove the line from the table view
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
}
// Create an IBAction to listed for the edit button to turn editing mode on
-(IBAction)onClick
{
    // Turn editing mode on by toggling .editing from normal to delete mode
    researchTableView.editing = !researchTableView.isEditing;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
