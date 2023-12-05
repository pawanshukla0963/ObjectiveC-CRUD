//
//  DBWorker.h
//  Sqlite crud
//
//  Created by Shalitha Senanayaka on 2019-05-25.
//  Copyright © 2019 Shalitha Senanayaka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import <sqlite3.h>

NS_ASSUME_NONNULL_BEGIN

@interface DBWorker : NSObject
{
    AppDelegate *appdel;
    sqlite3 *database;
}

@property(strong,nonatomic) NSMutableArray *arrdata;
@property(strong, nonatomic) NSString *strmain;

-(NSMutableArray  *)getUserData:(NSString *)query;

@end

NS_ASSUME_NONNULL_END
