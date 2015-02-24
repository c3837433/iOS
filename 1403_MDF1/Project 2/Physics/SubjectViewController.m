//
//  SubjectViewController.m
//  Physics
//
//  Created by Angela Smith on 3/8/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "SubjectViewController.h"
// import the customCell headers
#import "CustomSubjectCell.h"
// Import the Subject Object
#import "PhysicSubjecsCustomClass.h"
// Import the view controllers
#import "SubjectDetailViewController.h"

@interface SubjectViewController ()

@end

@implementation SubjectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    // Build the custom objects to hold the subject data
    PhysicSubjecsCustomClass* subject1 = [[PhysicSubjecsCustomClass alloc] init];
    subject1.subjectName = @"Force";
    subject1.subjectSubTitle = @"Get stuff moving";
    subject1.subjectDescription = @"Any pushing or pulling an object that results in it moving is a force. The magnitude of the force (F), which is measured in Newton's,  is equal to the objects mass (m) multiplied by the acceleration (a). F=ma";
    subject1.subjectExample = @"When you push on an object, such as a pencil when you are writing, the applied force is what is the force on the pencil that causes it to move.";
    subject1.formula = true;
    subject1.formulaNotes = @"The Force of an object is the product of its mass and acceleration.\n\n Force = Mass * Acceleration\n\nMass is measured in kilograms (kg)\nAcceleration is measured in minutes per seconds squared (m/s2)\nThe result is measured in newtons (N)\n \n Enter an objects mass and acceleration rate to determine the force.";
    subject1.formulaX = @"Mass in kg";
    subject1.formulaY = @"Acceleration in m/s2";
    subject1.formulaValue = @"N";
    subject1.subjectImage = [UIImage imageNamed:@"forceA.png"];
    
    PhysicSubjecsCustomClass* subject2 = [[PhysicSubjecsCustomClass alloc] init];
    subject2.subjectName = @"Gravity";
    subject2.subjectSubTitle = @"Bringing things together";
    subject2.subjectDescription = @"Gravity is one of the four fundamental forces of nature in which objects pull together. The higher the object's mass, the greater pull gravity has.";
    subject2.subjectExample = @"It you hold an object in the air and let it go, gravity will pull it down to the earth. Since a person standing on the earth is closer to the earth than the sun, gravity holds them down rather than them being pulled towards the sun.";
    subject2.formula = true;
    subject2.formulaNotes = @"To measure the force of gravity, we need to decide whether we want to measure the force on earth, or in space. Here we will measure the force at the Earths surface.\n\nForce (of Gravity) = Mass * Acceleration\n\n on Earth, the acceleration is = to 9.8 meters/second squared or m/s squared.\nThe resulting force is measured in Newtons";
    subject2.formulaX = @"Mass in kg";
    subject2.formulaY = @"Acceleration in m/s2";
    subject2.formulaValue = @"N";
    
    subject2.subjectImage = [UIImage imageNamed:@"gravityA.png"];
    
    PhysicSubjecsCustomClass* subject3 = [[PhysicSubjecsCustomClass alloc] init];
    subject3.subjectName = @"Work";
    subject3.subjectSubTitle = @"Doing Something";
    subject3.subjectDescription = @"Moving an object moves from one place to another because a force was applied to it, then work has been done to the object. The about of work done is measured in Joules, named after James Joules. Work is equal to the force(F) multiplied by the distance (d), or W = Fd.";
    subject3.subjectExample = @"Work can easily be seen in everyday life. Someone pushing a lawn mower across the grass, a librarian pulling a cart full of books, or a flight attendant putting carry on luggage in an overhead compartment are all examples where a force put on the object resulted in the object being displaced (or changed to a new place).";
    subject3.formula = true;
    subject3.formulaNotes = @"The amount of force required to move an object a certain distance is its Work. To calculate work, we need to know two things, the objects weight and the distance we need to move the object.\n\nWork = Mass * Distance\n\nThe result is measured in Joules which is equivalent to 1 newton per meter.";
    subject3.formulaX = @"Mass in kg";
    subject3.formulaY = @"Distance in m";
    subject3.formulaValue = @"joules";
    subject3.subjectImage = [UIImage imageNamed:@"workA.png"];
    
    PhysicSubjecsCustomClass* subject4 = [[PhysicSubjecsCustomClass alloc] init];
    subject4.subjectName = @"Friction";
    subject4.subjectSubTitle = @"Slows things down";
    subject4.subjectDescription = @"Friction (or Frictional Force) is a force that goes against an object that effects its movement. Static friction is the friction found at the beginning of movement. Dynamic (or sliding) friction is found while the object is in motion. Rolling a marble across a glass table, for example, would encounter less friction then rolling it across carpet. Without friction, the object would never stop moving once it is set in motion.";
    subject4.subjectExample = @"Try this example to see the difference between static and dynamic friction. \n Place both of your hands together as if you clapped. very slowly try to move one hand up and the other hand down. Feel the hesitancy in your hands separating? That is static friction, you can remember that like the static cling that can happen when your sock is stuck to your sweater. \n Once your hands are able to move, continue moving them in alternating directions like you are trying to warm them up on a cold day. All the little bumps, grooves, and lines on your skin provide the other type of friction, dynamic friction.";
    subject4.formula = false;
    subject4.subjectImage = [UIImage imageNamed:@"frictionA.png"];
    
    PhysicSubjecsCustomClass* subject5 = [[PhysicSubjecsCustomClass alloc] init];
    subject5.subjectName = @"Energy";
    subject5.subjectSubTitle = @"Ready Set Go";
    subject5.subjectDescription = @"Energy can take on many forms such as light, heat, electrical, or sound. There are  two types of energy: potential and kinetic. Potential Energy is stored energy, while Kinetic energy is energy in motion.";
    subject5.subjectExample = @"If you pull an error back on a  bow and arrow or pull back a pull toy car, even though the object is not moving, there is potential for it to. That is because all the energy it needs to move is stored awaiting for the arrow or car to be released. The moment they have been released, they are now using kinetic energy.";
    subject5.formula = false;
    subject5.subjectImage = [UIImage imageNamed:@"energyA.png"];
    
    PhysicSubjecsCustomClass* subject6 = [[PhysicSubjecsCustomClass alloc] init];
    subject6.subjectName = @"Heat";
    subject6.subjectSubTitle = @"Warming things Up";
    subject6.subjectDescription = @"Heat is a  form of energy. The first law of thermodynamics (how heat is connected with matter and energy) states that energy (such as heat energy) is never created or destroyed, but can be changed from one form to another. Energy from electricity can be transferred to baseboard heaters, which transfers to the air. The Second Law of Thermodynamics states that heat energy will always go from hot to cold, so without additional energy, the air will return to cold.";
    subject6.subjectExample = @"When you order a pizza, the pizza is baked in a hot oven. During that time the energy from the oven is transferred from the oven to the pizza. After it is baked, they may put the pizza in a special bag that prevents the energy from leaving the pizza, so that it is still hot when you get it. Once it arrives and is removed from the bag, the energy will slowly begin to be released to the air surrounding it until it reaches the same temperature as the air.";
    subject6.formula = false;
    subject6.subjectImage = [UIImage imageNamed:@"heat.png"];
    
    PhysicSubjecsCustomClass* subject7 = [[PhysicSubjecsCustomClass alloc] init];
    subject7.subjectName = @"Sound";
    subject7.subjectSubTitle = @"Energy Vibrations";
    subject7.subjectDescription = @"Sound is a type of energy that can be heard. Sound is created when an object's pressure waves moves through a medium (material that it passes through). Normally the medium is air. As the wave enters our ear canal, they turn to vibrations that our ears translate into sounds.";
    subject7.subjectExample = @"Our vocal cords create vibrations that resonate in our throat and mouths. Our ears catch not only our words spoken, but other sounds as well. Every sound we hear is audible because pressure waves enter the ear canal and begin vibrating once they het the ear drum. Our brain interprets these sounds. The higher the wave, the louder the sound is.";
    subject7.formula = false;
    subject7.subjectImage = [UIImage imageNamed:@"sound.png"];
    
    PhysicSubjecsCustomClass* subject8 = [[PhysicSubjecsCustomClass alloc] init];
    subject8.subjectName = @"X-Rays";
    subject8.subjectSubTitle = @"Looking through Layers";
    subject8.subjectDescription = @"X-rays are electromagnetic waves that are released when electrons are fired at an atom. Sometimes the waves are able to pass through (transmitted light), such as areas of soft tissue. Other harder areas, such as our bones, the rays can be blocked or absorbed.";
    subject8.subjectExample = @"If you injure or break a bone, the doctor will take an X-ray of the bone. They will position the bone between special film to capture the image, and the machine taking the image. After the electrons are fired the image will show differences between the bone and tissue, as well as any breaks or fractures in the bone. There are some materials, such as lead, that prevent x-rays from passing through, and can be used to protect areas that do not need to be imaged.";
    subject8.formula = false;
    subject8.subjectImage = [UIImage imageNamed:@"xray.png"];
    
    PhysicSubjecsCustomClass* subject9 = [[PhysicSubjecsCustomClass alloc] init];
    subject9.subjectName = @"Mechanics";
    subject9.subjectSubTitle = @"Working Together";
    subject9.subjectDescription = @"When matter and energy work together, we get mechanics. To fully understand mechanics, it is good to understand both motion and Newton's laws of motion.";
    subject9.subjectExample = @"Say you want to remove an old screw from a wall, but simply using force to pull it out isn't working. The screw is made of matter, and we can use other matter such as a drill or screwdriver, to help remove it. We, who are also made of matter, need to use some form of energy to help us. If using the drill, the battery will supply the energy, if using the screwdriver we would supply it. By applying that energy to the tool, it will cause the screw to rotate until it is removed from the wall. That combination of matter and energy is mechanics.";
    subject9.formula = false;
    subject9.subjectImage = [UIImage imageNamed:@"mechanic.png"];
    
    PhysicSubjecsCustomClass* subject10 = [[PhysicSubjecsCustomClass alloc] init];
    subject10.subjectName = @"Motion";
    subject10.subjectSubTitle = @"Things are Moving";
    subject10.subjectDescription = @"Then objects are moving, they are in motion. How fast an object is moving is its speed. To accurately know its speed, we need to know its position, because motion is always relative. The rate at witch that object changes speed is its acceleration rate. Acceleration can be measured in positives (increasing speed) or negatives (decreasing speed).";
    subject10.subjectExample = @"If you set your device on a surface nearby, is it moving? Our first thought would probably be no. But, if we looked down through a powerful telescope from the space station, the answer would change wouldn't it? Relative to you, the device is not in motion, yet relative to the astronaut in the space station, it is.";
    subject10.formula = false;
    subject10.subjectImage = [UIImage imageNamed:@"motion.png"];
    
    PhysicSubjecsCustomClass* subject11 = [[PhysicSubjecsCustomClass alloc] init];
    subject11.subjectName = @"Light";
    subject11.subjectSubTitle = @"Visual Energy";
    subject11.subjectDescription = @"Light is electromagnetic energy that can be reflected, transmitted, absorbed, or scattered. When light bounces off one object such as a mirror, it is reflected. When the light passes through an object, such as a windshield, it is transmitted. If light hits an object that it can not pass through, such as a rooftop, it is absorbed. Finally, if light is not able to completely pass through an object, but becomes deflected, the light can become scattered. ";
    subject11.subjectExample = @"Ever wonder why the colors of the sky change throughout the day? In the morning and evening the sky appears more red, but in the day it is blue. Every color of light has it's own wavelength. Red has the longest wavelength, and each color of the rainbow wavelength decreases with violets being the shortest. Our eyes can't see violet well, so during the day time the sky appears blue. During the sunrise and sunset, however, the sunlight needs to pass through more particle filled air, these particles end up scattering those shorter waved colors, leaving only reds and oranges.";
    subject11.formula = false;
    subject11.subjectImage = [UIImage imageNamed:@"light.png"];
    
    PhysicSubjecsCustomClass* subject12 = [[PhysicSubjecsCustomClass alloc] init];
    subject12.subjectName = @"TV & Radio";
    subject12.subjectSubTitle = @"Frequencies";
    subject12.subjectDescription = @"Radio and Television signals are electromagnetic energy waves sent out at specific frequencies. A frequency, which is measured in Hertz, is how often a wave occurs within a certain time. We need to use antennas to receive frequencies.";
    subject12.subjectExample = @"Each television and radio station broadcast at a frequency specific to them. This is what prevents one station from mixing with another's.";
    subject12.formula = false;
    subject12.subjectImage = [UIImage imageNamed:@"frequency.png"];
    
    PhysicSubjecsCustomClass* subject13 = [[PhysicSubjecsCustomClass alloc] init];
    subject13.subjectName = @"Newton's Laws";
    subject13.subjectSubTitle = @"1 2 3";
    subject13.subjectDescription = @"Newton's Laws, defined by Sir Isaac Newton, explain the relationships between force and motion. The First Law says that unless something causes an object to move, it will stay at rest. Unless something causes a moving object to slow down (such as friction) it will not stop. The second Law says that every motion or change of motion is equal to the amount of force applied to it, and it will not change direction. The third law says for every action there is an equal and opposite reaction.";
    subject13.subjectExample = @"1st Law: When you go bowling, if you set the ball on the alley floor, it will just sit there. No matter how long you stare at it, it will not move unless some force puts it in motion. If I throw the ball down the lane, and the lane ran for miles, unless a force caused it to slow down it will not stop. \n2nd Law: When a batter hits baseball, that ball will travel as far as the force sent it, and it will not change direction unless another force (wind and gravity) cause it to. \n3rd Law: If I kick that bowling ball with all the force I can, that ball will send an equal amount of force back to my foot.";
    subject13.formula = false;
    subject13.subjectImage = [UIImage imageNamed:@"newton.png"];
    
    PhysicSubjecsCustomClass* subject14 = [[PhysicSubjecsCustomClass alloc] init];
    subject14.subjectName = @"Atoms";
    subject14.subjectSubTitle = @"Matter's Building Blocks";
    subject14.subjectDescription = @"All matter is made up of atoms. Inside the atom are two areas, the nucleus, and the extra nuclear region. The nucleus is the center of the atom, and within it are protons and neutrons. The extra nuclear region surrounds the nucleus and contains electrons. The number of protons, neutrons, and electrons determine what type of atom it is. The Periodic Table of Elements helps determing the number of each.";
    subject14.subjectExample = @"To determine the number of protons, neutrons, and electrons for Gold (AU), the Periodic Table of Elements tells us that it has an atomic number of 79, and a rounded atomic mass of 197. The number tells us how many protons and electrons gold has, and when subtracted from the mass we get the number of neutrons.";
    subject14.formula = false;
    subject14.subjectImage = [UIImage imageNamed:@"atom.png"];
    
    PhysicSubjecsCustomClass* subject15 = [[PhysicSubjecsCustomClass alloc] init];
    subject15.subjectName = @"States of Matter";
    subject15.subjectSubTitle = @"Changeable";
    subject15.subjectDescription = @"Molecules inside matter are always moving. How fast they move depend on what form that matter is in. When matter has a definite shape, it is a solid. Molecules continue to move even when is a solid state, just not very fast. When the matter is heated up, the molecules have more energy and move faster. This causes the state to change to a fluid, or liquid state. When the matter is further heated to a certain temperature, the molecules continue to increase in energy. The matter then changes to a gaseous state. When temperatures begin to drop, the molecules slow down and revert back to previous states.";
    subject15.subjectExample = @"Water has a boiling point of 100 degrees (212 degrees Fahrenheit) and a freezing point of 0 degrees Celsius (32 degrees Fahrenheit). So when those water molecules are below 0 they are in a frozen state, while when they are above 100 it is in a gaseous state. Anything in between is a liquid.";
    subject15.formula = false;
    subject15.subjectImage = [UIImage imageNamed:@"statesOfMatter.png"];
    
    PhysicSubjecsCustomClass* subject16 = [[PhysicSubjecsCustomClass alloc] init];
    subject16.subjectName = @"Electricity";
    subject16.subjectSubTitle = @"Charged Energy";
    subject16.subjectDescription = @"When negatively charged electrons inside the atom start moving, they create an electrical current. As these electrons move around, some electrons can be kicked out of the atom, and others can be added in. When the number of electrons is off (doesn't match the number of protons), the atom then builds a charge.";
    subject16.subjectExample = @"Electrical charging can be created by things. When you walk on carpet you can build up electrons on your skin, when you touch metal the electrons jump and you receive a shock. Lighting strikes are another way we can see charged electrons, when they build up in a cloud and can't build any more, lightning releases them.";
    subject16.formula = false;
    subject16.subjectImage = [UIImage imageNamed:@"lightning.png"];
    
    PhysicSubjecsCustomClass* subject17 = [[PhysicSubjecsCustomClass alloc] init];
    subject17.subjectName = @"Magnetism";
    subject17.subjectSubTitle = @"Objects Attract";
    subject17.subjectDescription = @"When certain materials attract to others, they can create a special field. This field, called a magnetic field, allows objects to push or pull on the other object. When in that field they are magnetized. Depending on the type of electrical current, this magnetization can be either temporary, or permanent.";
    subject17.subjectExample = @"While it may not be strong, it is possible to magnetize a piece of metal with another magnet. To do it, get a magnet and a piece of metal that has something you can hold like a handle on it. Discharge any static electricity by touching something metal. Trying not to touch the metal part with your hands, place the positive pole of the magnet near the metal, and the negative pole in your opposite hand. Rub the magnet along the metal slowly from end to end repeatedly without stopping ten times. Try testing your new magnet on other metal, if it is not magnetized, try again, or try a new piece of metal.";
    subject17.formula = false;
    subject17.subjectImage = [UIImage imageNamed:@"magnetic.png"];
    
    PhysicSubjecsCustomClass* subject18 = [[PhysicSubjecsCustomClass alloc] init];
    subject18.subjectName = @"Momentum";
    subject18.subjectSubTitle = @"Just Keep Moving";
    subject18.subjectDescription = @"When an object is set in motion and it has a tendency to continue moving, that is momentum. If a person runs a race and tries to stop, it takes a few strides (depending on the speed they were running) to stop. The slower they were running the less momentum hindering them to stop. Momentum should always have a direction, such as if a train was traveling east, it's direction would be eastward.";
    subject18.subjectExample = @"A 2500 pound (1134 Kilogram) car driving south at 60 miles/hour (96.5 Km/hour) would have a momentum of 30391.2 kg-m/s, southward";
    subject18.formula = true;
    subject18.formulaNotes = @"The simple momentum formula is p=m*v where p = momentum, m = mass in kilograms and v = meters per second\n\n Momentum = Mass * Acceleration\n\n";
    subject18.formulaX = @"Mass in kg";
    subject18.formulaY = @"Acceleration in m/s2";
    subject18.formulaValue = @"kg-m/s + direction";
    subject18.subjectImage = [UIImage imageNamed:@"momentum.png"];
    
    PhysicSubjecsCustomClass* subject19 = [[PhysicSubjecsCustomClass alloc] init];
    subject19.subjectName = @"Matter";
    subject19.subjectSubTitle = @"Weight and Space";
    subject19.subjectDescription = @"Anything that takes up space and has weight is matter. Everything around you is made up of matter. Matter itself is made up of building blocks called atoms. How much stuff is in the matter, is its mass. The objects mass remains the same whether it is in the form of a solid, liquid or gas. Mass is not the same as weight.";
    subject19.subjectExample = @"If an astronaut weighs 150 pounds on earth, they would weigh only 24.9 ponds on the moon. Because the moon is smaller than the earth, the moon's gravity is also smaller, about 5/6 less than earth. If, however an object had 40 kilograms of mass on the earth, it would still have 40 kilograms of mass on the moon since gravity does not factor in to mass.";
    subject19.formula = false;
    subject19.subjectImage = [UIImage imageNamed:@"matter.png"];
    
    PhysicSubjecsCustomClass* subject20 = [[PhysicSubjecsCustomClass alloc] init];
    subject20.subjectName = @"Elements";
    subject20.subjectSubTitle = @"Pure Matter";
    subject20.subjectDescription = @"Matter containing one kind of atom are elements. These elements can be kept in their natural state like oxygen (O), or combined with other elements to form compounds. There are 92 natural elements and 15 man made elements.";
    subject20.subjectExample = @"Hydrogen is the lightest and most abundant element on earth. With a boiling point of -423 degrees F, it is naturally in a gaseous state. Oxygen is the third most abundant element on earth, and makes up the air we breath. Without oxygen most life would end. When we combine these two elements just right, we get water. Water or H2O, is made of 2 Hydrogen molecules and 1 Oxygen molecule. When we add another Oxygen to the mix, we get H2O2, which is useful in killing germs and fungus, cleaning, and is even created in our body to fight infections and improve our immune systems.";
    subject20.formula = false;
    subject20.subjectImage = [UIImage imageNamed:@"element.png"];
    
    
    // Initialize the array with the physics options
    physicSubjectArray = [[NSMutableArray alloc] initWithObjects:subject1, subject2, subject3, subject4, subject5, subject6, subject7, subject8, subject9, subject10, subject11, subject12, subject13, subject14, subject15, subject16, subject17, subject18, subject19, subject20, nil];
    
    [super viewDidLoad];
	
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of table view rows to equal the number of objects in the array of subjects
    NSInteger arrayLength = physicSubjectArray.count;
    return arrayLength;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomSubjectCell* subjectCell = [tableView dequeueReusableCellWithIdentifier:@"SubjectCell"];
    if (subjectCell != nil) {
        PhysicSubjecsCustomClass* thisArticle = [physicSubjectArray objectAtIndex:indexPath.row];
        // Refresh the cells with the object's information
        [subjectCell refreshCellWithData:thisArticle.subjectName subtitle:thisArticle.subjectSubTitle subImage:thisArticle.subjectImage];
    }
    return subjectCell;
}

 // Call the prepare for segue to move to the second view
 -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // The destination we are moving to is the SubjectDetailsVC
 SubjectDetailViewController* subjectDetailVC = segue.destinationViewController;
 if (subjectDetailVC != nil) {
     // Cast the sender to a UITableViewCell
     UITableViewCell* subjectCell = (UITableViewCell*)sender;
     // set the index path to the physics subject cell that sent it over
     NSIndexPath* indexPath = [physicSubjectTableView indexPathForCell:subjectCell];
 
     // Implement the class object so that the rows contain the objects
     PhysicSubjecsCustomClass* thisSubject = [physicSubjectArray objectAtIndex:indexPath.row];
     // Set the current subject to the one passed to the view
     subjectDetailVC.currentSubject = thisSubject;
    }
 
 }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
