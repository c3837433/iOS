//
//  ViewController.m
//  Project1
//
//  Created by Angela Smith on 3/4/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "ViewController.h"
// Import the custom object class, the custom cell, and the Details view controller
#import "CustomPhysicsOptionCell.h"
#import "PhysicSubjectsCustomClass.h"
#import "SubjectDetailsViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    // Build the custom objects to hold the subject data
    PhysicSubjectsCustomClass* subject1 = [[PhysicSubjectsCustomClass alloc] init];
    subject1.subjectName = @"Force";
    subject1.subjectSubTitle = @"Get stuff moving";
    subject1.subjectDescription = @"Any pushing or pulling an object that results in it moving is a force. The magnitude of the force (F), which is measured in Newton's,  is equal to the objects mass (m) multiplied by the acceleration (a). F=ma";
    subject1.subjectImage = [UIImage imageNamed:@"force.png"];
    
    PhysicSubjectsCustomClass* subject2 = [[PhysicSubjectsCustomClass alloc] init];
    subject2.subjectName = @"Gravity";
    subject2.subjectSubTitle = @"Bringing things together";
    subject2.subjectDescription = @"Gravity is a type of force that pulls objects together. The higher the object's mass, the greater pull gravity has. It you hold an object in the air and let it go, gravity will pull it down to the earth. Since a person standing on the earth is closer to the earth than the sun, gravity holds them down rather than them being pulled towards the sun.";
    subject2.subjectImage = [UIImage imageNamed:@"gravity.png"];
    
    PhysicSubjectsCustomClass* subject3 = [[PhysicSubjectsCustomClass alloc] init];
    subject3.subjectName = @"Work";
    subject3.subjectSubTitle = @"Doing Something";
    subject3.subjectDescription = @"Moving an object from one place to another requires work, a specific amount of force required to move it a specific distance. The about of work required is measured in Joules, named after James Joules. Work is equal to the force(F) multiplied by the distance (d), or W = Fd.";
    subject3.subjectImage = [UIImage imageNamed:@"work.png"];
    
    PhysicSubjectsCustomClass* subject4 = [[PhysicSubjectsCustomClass alloc] init];
    subject4.subjectName = @"Friction";
    subject4.subjectSubTitle = @"Slows things down";
    subject4.subjectDescription = @"Friction (or Frictional Force) is a force that goes against an object that effects its movement. Static friction is the friction found at the beginning of movement. Dynamic (or sliding) friction is found while the object is in motion. Rolling a marble across a glass table, for example, would encounter less friction then rolling it across carpet. Without friction, the object would never stop moving once it is set in motion.";
    subject4.subjectImage = [UIImage imageNamed:@"friction.png"];
    
    PhysicSubjectsCustomClass* subject5 = [[PhysicSubjectsCustomClass alloc] init];
    subject5.subjectName = @"Energy";
    subject5.subjectSubTitle = @"Ready Set Go";
    subject5.subjectDescription = @"Energy can take on many forms such as light, heat, electrical, or sound. There are  two types of energy: potential and kinetic. If you pull an error back on a  bow and arrow or pull back a pull toy car, even though the object is not moving, there is potential for it to. That is because all the energy it needs to move is stored awaiting for the arrow or car to be released. The moment they have been released, they are now using kinetic energy. ";
    subject5.subjectImage = [UIImage imageNamed:@"energy.png"];
    
    PhysicSubjectsCustomClass* subject6 = [[PhysicSubjectsCustomClass alloc] init];
    subject6.subjectName = @"Heat";
    subject6.subjectSubTitle = @"Warming things Up";
    subject6.subjectDescription = @"Heat is a  form of energy. The first law of thermodynamics (how heat is connected with matter and energy) states that energy (such as heat energy) is never created or destroyed, but can be changed from one form to another. Energy from electricity can be transferred to baseboard heaters which transfers to the air. The Second Law of Thermodynamics states that heat energy will always go from hot to cold, so without additional energy, the air will return to cold.";
    subject6.subjectImage = [UIImage imageNamed:@"heat.png"];
    
    PhysicSubjectsCustomClass* subject7 = [[PhysicSubjectsCustomClass alloc] init];
    subject7.subjectName = @"Sound";
    subject7.subjectSubTitle = @"Energy Vibrations";
    subject7.subjectDescription = @"Sound is a type of energy that can be heard. Sound waves are created when vibrations disturb the air. Our vocal cords create vibrations, which is why you can hear people speak. Higher sound waves carry loud sounds.";
    subject7.subjectImage = [UIImage imageNamed:@"sound.png"];
    
    PhysicSubjectsCustomClass* subject8 = [[PhysicSubjectsCustomClass alloc] init];
    subject8.subjectName = @"X-Rays";
    subject8.subjectSubTitle = @"Looking through Layers";
    subject8.subjectDescription = @"X-rays are electromagnetic waves that are released when electrons are fired at an atom. Sometimes the waves are able to pass through (transmitted light), such as areas of soft tissue. Other harder areas, such as our bones, the rays can be blocked or absorbed. When film is placed on the other side of what ever is being x-rayed, we are able to see the image of the bones.  There are some materials, such as lead, that prevent x-rays from passing through, and can be used to protect areas that do not need to be imaged.";
    subject8.subjectImage = [UIImage imageNamed:@"xray.png"];
    
    PhysicSubjectsCustomClass* subject9 = [[PhysicSubjectsCustomClass alloc] init];
    subject9.subjectName = @"Mechanics";
    subject9.subjectSubTitle = @"Working Together";
    subject9.subjectDescription = @"When matter and energy work together, we get mechanics. To remove a screw from a wall requires matter, such as a drill or screwdriver, and energy such as a person turning the screwdriver or a battery in the drill. When these two combine and work, mechanics results.";
    subject9.subjectImage = [UIImage imageNamed:@"mechanic.png"];
    
    PhysicSubjectsCustomClass* subject10 = [[PhysicSubjectsCustomClass alloc] init];
    subject10.subjectName = @"Motion";
    subject10.subjectSubTitle = @"Things are Moving";
    subject10.subjectDescription = @"Then objects are moving, they are in motion. How fast an object is moving is it's speed. The rate at witch that object changes speed is it's acceleration rate. Acceleration can be measured in positives (increasing speed) or negatives (decreasing speed).";
    subject10.subjectImage = [UIImage imageNamed:@"motion.png"];
    
    PhysicSubjectsCustomClass* subject11 = [[PhysicSubjectsCustomClass alloc] init];
    subject11.subjectName = @"Light";
    subject11.subjectSubTitle = @"Visual Energy";
    subject11.subjectDescription = @"Light is electromagnetic energy that can be reflected, transmitted, absorbed, or scattered. When light bounces off one object such as a mirror, it is reflected. When the light passes through an object, such as a windshield, it is transmitted. If light hits an object that it can not pass through, such as a rooftop, it is absorbed. Finally, if light is not able to completely pass through an object, but becomes deflected, the light can become scattered. ";
    subject11.subjectImage = [UIImage imageNamed:@"light.png"];
    
    PhysicSubjectsCustomClass* subject12 = [[PhysicSubjectsCustomClass alloc] init];
    subject12.subjectName = @"TV & Radio";
    subject12.subjectSubTitle = @"Frequencies";
    subject12.subjectDescription = @"Radio and Television signals are electromagnetic energy waves sent out at specific frequencies. Each television and radio station broadcast at a frequency specific to them. This is what prevents one station from mixing with another's. A frequency, which is measured in Hertz, is how often a wave occurs within a certain time.";
    subject12.subjectImage = [UIImage imageNamed:@"frequency.png"];
    
    PhysicSubjectsCustomClass* subject13 = [[PhysicSubjectsCustomClass alloc] init];
    subject13.subjectName = @"Newton's Laws";
    subject13.subjectSubTitle = @"1 2 3";
    subject13.subjectDescription = @"Newtons's Laws, defined by Sir Isaac Newton, explain the relationships between force and motion. The First Law says that unless something causes an object to move, it will stay at rest. Unless something causes a moving object to slow down (such as friction) it will not stop. The second Law says that every motion or change of motion is equal to the amount of force applied to it, and it will not change direction. For example, a hit baseball will travel as far as the force sent it, and it will not change direction unless another force (wind and gravity) cause it to. The third law says for every action there is an equal and opposite reaction.";
    subject13.subjectImage = [UIImage imageNamed:@"newton.png"];
    
    PhysicSubjectsCustomClass* subject14 = [[PhysicSubjectsCustomClass alloc] init];
    subject14.subjectName = @"Atoms";
    subject14.subjectSubTitle = @"Matter's Building Blocks";
    subject14.subjectDescription = @"All matter is made up of atoms. Inside the atom are two areas, the nucleus, and the extra nuclear region. The nucleus is the center of the atom, and within it are protons and neutrons. The extra nuclear region surrounds the nucleus and contains electrons. The number of protons, neutrons, and electrons determine what type of atom it is. The Periodic Table of Elements helps determing the number of each. Gold AU for example, has an atomic number of 79, and a rounded atomic mass of 197. The number tells us how many protons and electrons gold has, and when subtracted from the mass we get the number of neutrons.";
    subject14.subjectImage = [UIImage imageNamed:@"atom.png"];
    
    PhysicSubjectsCustomClass* subject15 = [[PhysicSubjectsCustomClass alloc] init];
    subject15.subjectName = @"States of Matter";
    subject15.subjectSubTitle = @"Changeable";
    subject15.subjectDescription = @"Molecules inside matter are always moving. How fast they move depend on what form that matter is in. When matter has a definite shape, it is a solid. Molecules continue to move even when is a solid state, just not very fast. When the matter is heated up, the molecules have more energy and move faster. This causes the state to change to a fluid, or liquid state. When the matter is further heated to a certain temperature, the molecules continue to increase in energy. The matter then changes to a gaseous state. When temperatures begin to drop, the molecules slow down and revert back to previous states.";
    subject15.subjectImage = [UIImage imageNamed:@"statesOfMatter.png"];
    
    PhysicSubjectsCustomClass* subject16 = [[PhysicSubjectsCustomClass alloc] init];
    subject16.subjectName = @"Electricity";
    subject16.subjectSubTitle = @"Charged Energy";
    subject16.subjectDescription = @"When negatively charged electrons inside the atom start moving, they create an electrical current. As these electrons move around, some electrons can be  kicked out of the atom, and others can be added in. When the number of electrons is off (doesn't match the number of protons), the atom then builds a charge. Electrical charging can be created by things such as walking on carpet, to lighting, to generators using magnets, or batteries using chemical reactions. ";
    subject16.subjectImage = [UIImage imageNamed:@"lightning.png"];
    
    PhysicSubjectsCustomClass* subject17 = [[PhysicSubjectsCustomClass alloc] init];
    subject17.subjectName = @"Magnetism";
    subject17.subjectSubTitle = @"Objects Attract";
    subject17.subjectDescription = @"When certain materials attract to others, they can create a special field. This field, called a magnetic field, allows objects to push or pull on the other object. When in that field they are magnetized. Depending on the type of electrical current, this magnetization can be either temporary, or permanent.";
    subject17.subjectImage = [UIImage imageNamed:@"magnetic.png"];
    
    PhysicSubjectsCustomClass* subject18 = [[PhysicSubjectsCustomClass alloc] init];
    subject18.subjectName = @"Momentum";
    subject18.subjectSubTitle = @"Just Keep Moving";
    subject18.subjectDescription = @"When an object is set in motion and it has a tendency to continue moving, that is momentum. If a person runs a race and tries to stop, it takes a few strides (depending on the speed they were running) to stop. The slower they were running the less momentum hindering them to stop. A car driving 60 miles per hour would have even more momentum making it difficult to come to a complete stop quickly.";
    subject18.subjectImage = [UIImage imageNamed:@"momentum.png"];
    
    PhysicSubjectsCustomClass* subject19 = [[PhysicSubjectsCustomClass alloc] init];
    subject19.subjectName = @"Matter";
    subject19.subjectSubTitle = @"Weight and Space";
    subject19.subjectDescription = @"Anything that takes up space and has weight is matter. Matter is made up of building blocks called atoms. How much stuff is in the matter, is its mass. The objects mass remains the same whether it is in the form of a solid, liquid or gas.";
    subject19.subjectImage = [UIImage imageNamed:@"matter.png"];
    
    PhysicSubjectsCustomClass* subject20 = [[PhysicSubjectsCustomClass alloc] init];
    subject20.subjectName = @"Elements";
    subject20.subjectSubTitle = @"Pure Matter";
    subject20.subjectDescription = @"Matter containing one kind of atom are elements. These elements can be kept in their natural state like oxygen (O), or combined with other elements to form compounds like water (H2O), which has 2 Hydrogen atoms and 1 Oxygen atom. There are 92 natural elements and 15 man made elements.";
    subject20.subjectImage = [UIImage imageNamed:@"element.png"];
    
    
    // Initialize the array with the physics options
    physicSubjectArray = [[NSMutableArray alloc] initWithObjects:subject1, subject2, subject3, subject4, subject5, subject6, subject7, subject8, subject9, subject10, subject11, subject12, subject13, subject14, subject15, subject16, subject17, subject18, subject19, subject20, nil];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

// UITableViewDataSource REQUIRED Method 1 that tells the Table View how many cells are needed
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // set the table rows equal to the number of objects in the subjects array
    NSInteger arrayLength = physicSubjectArray.count;
    return arrayLength;
}

// UITableViewDataSource REQUIRED Method 2. This method creates the cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Initialize the custom cell with the cells identifier name
    CustomPhysicsOptionCell * physicCell = [tableView dequeueReusableCellWithIdentifier:@"PhysicAspectCell"];
    // and return that cell so we can reuse the same cell
    
    if (physicCell!= nil) {
        //pass the object to the
        PhysicSubjectsCustomClass* thisSubject = [physicSubjectArray objectAtIndex:indexPath.row];
        
        // Refresh the cell with info
        [physicCell refreshCellWithData:thisSubject.subjectName subjectSubtitle:thisSubject.subjectSubTitle subjectImage:thisSubject.subjectImage];
    }
    return physicCell;
}

// Call the prepare for segue to move to the second view
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // The destination we are moving to is the SubjectDetailsVC
    SubjectDetailsViewController* subjectDetailVC = segue.destinationViewController;
    if (subjectDetailVC != nil) {
        // Cast the sender to a UITableViewCell
        UITableViewCell* subjectCell = (UITableViewCell*)sender;
        // set the index path to the physics subject cell that sent it over
        NSIndexPath* indexPath = [physicSubjectTableView indexPathForCell:subjectCell];
        
        // Implement the class object so that the rows contain the objects
        PhysicSubjectsCustomClass* thisSubject = [physicSubjectArray objectAtIndex:indexPath.row];
        // Set the current subject to the one passed to the view
        subjectDetailVC.currentSubject = thisSubject;
    }
    
}

// Once the table view is in editing mode, if an item is deleted modify the table
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // This gets called when the delete button is pressed
    // check to see if we are in delete mode
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // remove the object from the array of data that is feeding the table view
        [physicSubjectArray removeObjectAtIndex:indexPath.row];
        // remove the line from the table view
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
}
// Create an IBAction to listed for the edit button to turn editing mode on
-(IBAction)onClick
{
    // Turn editing mode on by toggling .editing from normal to delete mode
    physicSubjectTableView.editing = !physicSubjectTableView.isEditing;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
