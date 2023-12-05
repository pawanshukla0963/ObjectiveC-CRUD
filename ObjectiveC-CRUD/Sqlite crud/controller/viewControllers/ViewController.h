//
//  ViewController.h
//  Sqlite crud
//
//  Created by Shalitha Senanayaka on 2019-05-25.
//  Copyright © 2019 Shalitha Senanayaka. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtPhone;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)btnSave:(UIButton *)sender;
- (IBAction)btnUpdate:(UIButton *)sender;
- (IBAction)btnDelete:(UIButton *)sender;
- (IBAction)btnShow:(UIButton *)sender;


@property(strong, nonatomic)NSMutableArray *arrMainData;


@end

NS_ASSUME_NONNULL_END
