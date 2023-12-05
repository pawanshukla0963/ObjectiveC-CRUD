//
//  ViewController.m
//  Sqlite crud
//
//  Created by Shalitha Senanayaka on 2019-05-25.
//  Copyright © 2019 Shalitha Senanayaka. All rights reserved.
//

#import "ViewController.h"
#import "DBWorker.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize arrMainData,txtName,txtPhone,tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnSave:(UIButton *)sender {
    
    if(txtPhone.text.length == 0 || txtPhone.text.length == 0){
        [self ShowAlert:@"Please fill all fields."];
    }
    
    NSString *strQuery = [[NSString alloc]initWithFormat:@"insert into user(name,phone) values ('%@', '%@')", txtName.text, txtPhone.text];
    
    DBWorker *dw = [[DBWorker alloc]init];
    
    BOOL st = [dw getUserData:strQuery];
    
    if(st){
        [self ShowAlert:@"Data saved !"];
    }else{
        [self ShowAlert:@"Daat is not saved !"];
    }
    
}

- (IBAction)btnUpdate:(UIButton *)sender {
    NSString *strQuery = [[NSString alloc]initWithFormat:@"update user set name = '%@', phone = '%@' where name = '%@'", txtName.text, txtPhone.text, txtName.text];
    
    DBWorker *dw = [[DBWorker alloc]init];
    
    BOOL st = [dw getUserData:strQuery];
    
    if(st){
        [self ShowAlert:@"Data updated !"];
    }else{
        [self ShowAlert:@"Daat is not updated !"];
    }
}

- (IBAction)btnDelete:(UIButton *)sender {
    
    NSString *strQuery = [[NSString alloc]initWithFormat:@"delete from user where name = '%@'", txtName.text];
    
    DBWorker *dw = [[DBWorker alloc]init];
    
    BOOL st = [dw getUserData:strQuery];
    
    if(st){
        [self ShowAlert:@"Data deleted !"];
    }else{
        [self ShowAlert:@"Daat is not deleted !"];
    }
    
}

- (IBAction)btnShow:(UIButton *)sender {
    
    NSString *strShow = [[NSString alloc]initWithFormat:@"select * from user"];
    
    DBWorker *dw = [[DBWorker alloc]init];
    arrMainData = [[NSMutableArray alloc]init];
    arrMainData = [dw getUserData:strShow];
    [tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrMainData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"cell"];
    }
    
    NSLog(@"%@", [NSString stringWithFormat:@"name - %@", [[arrMainData objectAtIndex:indexPath.row]objectForKey:@"phone"]]);
    
    cell.textLabel.text = [[arrMainData objectAtIndex:indexPath.row]objectForKey:@"name"];
    cell.detailTextLabel.text = [[arrMainData objectAtIndex:indexPath.row]objectForKey:@"phone"];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    txtName.text = [[arrMainData objectAtIndex:indexPath.row]objectForKey:@"name"];
    txtPhone.text = [[arrMainData objectAtIndex:indexPath.row]objectForKey:@"phone"];
}

-(void)ShowAlert:(NSString *)message{
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Alert"
                                 message:message
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   //Handle no, thanks button
                               }];
    
    [alert addAction:okButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
