//
//  MasterViewController.m
//  everyDo
//
//  Created by Krzysztof Kopytek on 2016-05-17.
//  Copyright © 2016 Krzysztof Kopytek. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo.h"
#import "CustomTableViewCell.h"
#import "newItemViewController.h"

@interface MasterViewController () <newItemViewControlerDelegate>

@property NSMutableArray *objects;
@property NSMutableArray *toDoList;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    
    //==========================================================================================
    //i should create separate method but i'm lazy
    //5 objects added to array
    self.toDoList = [[NSMutableArray alloc] init];
    Todo *todo1 = [[Todo alloc] initWithTitle:@"Title1" Description:@"Description1" Priority:1];
    [self.toDoList addObject:todo1];
    Todo *todo2 = [[Todo alloc] initWithTitle:@"Title2" Description:@"Description2" Priority:2];
    [self.toDoList addObject:todo2];
    Todo *todo3 = [[Todo alloc] initWithTitle:@"Title3" Description:@"Description3" Priority:3];
    [self.toDoList addObject:todo3];
    Todo *todo4 = [[Todo alloc] initWithTitle:@"Title4" Description:@"Description4" Priority:4];
    todo4.isCompletedIndicator = YES;
    [self.toDoList addObject:todo4];
    Todo *todo5 = [[Todo alloc] initWithTitle:@"Title5" Description:@"Description5" Priority:5];
    [self.toDoList addObject:todo5];
    
    //adding objects to table view
    for(Todo* todo in self.toDoList){
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];;
    }
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(markComplete:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.tableView addGestureRecognizer:swipe];
    
    
}

- (void)insertNewObject:(id)sender {

    newItemViewController *newItem = [[newItemViewController alloc] init];
    newItem.delegate = self;
    [self.navigationController pushViewController:newItem animated:true];

}

-(void)passDataBackward:(NSString *)data{
    
    // here i create new object in array and i reload data in my table
    // we have "data" but we can have anything from newItemViewControler
    NSLog(@"%@", data);
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        Todo *todo = self.toDoList[indexPath.row];
        
        
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:todo];
        
    }
}

#pragma mark - Table View

//======================================================================================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

//======================================================================================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.toDoList.count;
}

//======================================================================================
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // my special cell
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SpecialCell" forIndexPath:indexPath];
    
    Todo *todo = self.toDoList[indexPath.row];
    
    
    if(todo.isCompletedIndicator){
    
        NSDictionary* attributes = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};
        NSAttributedString* attributedString = [[NSAttributedString alloc] initWithString:todo.desc attributes:attributes];
        cell.rightLabel.attributedText = attributedString; // text is strikethrough
    }
    else{
    
        cell.rightLabel.text = todo.desc;
    }

    cell.leftLabel.text = todo.title;
    cell.centerLabel.text = [NSString stringWithFormat:@"%i",todo.priorityNumber];

    return cell;
}

//======================================================================================
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

//======================================================================================
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.objects removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//}


//======================================================================================
//Add labels in the Detail view controller, and set their contents in the setDetailItem:
//method in the master view controller implementation

-(void)setDetailItem {
    
}


//======================================================================================
- (void)markComplete:(id)sender {
    
    if ([sender isKindOfClass:[UISwipeGestureRecognizer class]]) {
        
        CGPoint swipePoint = [sender locationInView:self.tableView];
        NSIndexPath *indexPathOfSwipedCell = [self.tableView indexPathForRowAtPoint:swipePoint];
        
        Todo *todo = self.toDoList[indexPathOfSwipedCell.row];
        todo.isCompletedIndicator = YES;
        
        self.toDoList[indexPathOfSwipedCell.row] = todo;
        [self.tableView reloadData];
    }
    
    
}

@end
