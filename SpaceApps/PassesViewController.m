//
//  PassesViewController.m
//  SpaceApps
//
//  Created by Carlos Castellanos on 13/04/14.
//  Copyright (c) 2014 Carlos Castellanos. All rights reserved.
//

#import "PassesViewController.h"
#import "PassesTableViewCell.h"
#import "ViewController.h"
#import "AppDelegate.h"

@interface PassesViewController ()

@end

@implementation PassesViewController
{
    NSArray *tableData;
     NSArray *hora;
     NSArray *elevacion;
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
    self.title=@"Passes";
    delegate= (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSDictionary *passes;
    
    tableData = [NSArray arrayWithObjects:@"2014-04-12", @"2014-04-14", @"2014-04-30", @"2014-05-01", @"2014-05-05", @"2014-05-05", @"2014-05-07", nil];
    hora=[NSArray arrayWithObjects:@"03:23:43",@"02:32:54",@"23:11:11",@"14:54:00",@"17:55:23",@"16:18:21",@"21:18:11",nil];
    elevacion=[NSArray arrayWithObjects:@"43",@"90",@"75",@"33",@"62",@"66",@"11",nil];
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
    static NSString *simpleTableIdentifier = @"passescell";
    
    PassesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[PassesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.fecha.text = [tableData objectAtIndex:indexPath.row];
    cell.hora.text = [hora objectAtIndex:indexPath.row];
    cell.elevacion.text = [elevacion objectAtIndex:indexPath.row];
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
    
    
    
    ViewController *brujula;//=[[DescripcionViewController alloc]init];
    brujula = [[self storyboard] instantiateViewControllerWithIdentifier:@"brujula"];
    
   // delegate.nombre=[tableData objectAtIndex:indexPath.row];
    brujula.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self.navigationController pushViewController:brujula animated:YES];
    
    
    
    
    
}

@end
