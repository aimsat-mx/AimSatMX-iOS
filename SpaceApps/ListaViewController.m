//
//  ListaViewController.m
//  SpaceApps
//
//  Created by Carlos Castellanos on 13/04/14.
//  Copyright (c) 2014 Carlos Castellanos. All rights reserved.
//

#import "ListaViewController.h"
#import "SateliteTableViewCell.h"
#import "PassesViewController.h"
#import "AppDelegate.h"
@interface ListaViewController ()

@end

@implementation ListaViewController
{
    NSArray *tableData;
    AppDelegate *delegate;
}

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
    delegate= (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    tableData = [NSArray arrayWithObjects:@"FUNcube-1", @"Ardusat-1", @"Ardusat-2", @"Ardusat-3", @"ELaNa 3", @"Vega Launch", @"Delta II", nil];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [tableData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    SateliteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[SateliteTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.nombre.text = [tableData objectAtIndex:indexPath.row];
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    PassesViewController *brujula;//=[[DescripcionViewController alloc]init];
        brujula = [[self storyboard] instantiateViewControllerWithIdentifier:@"passes"];
        
   delegate.nombre=[tableData objectAtIndex:indexPath.row];
    brujula.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self.navigationController pushViewController:brujula animated:YES];
    
    
    
    
    
}

@end
