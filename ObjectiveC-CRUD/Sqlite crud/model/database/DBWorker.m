//
//  DBWorker.m
//  Sqlite crud
//
//  Created by Shalitha Senanayaka on 2019-05-25.
//  Copyright © 2019 Shalitha Senanayaka. All rights reserved.
//

#import "DBWorker.h"

@implementation DBWorker

@synthesize arrdata,strmain;

-(id)init{
    appdel = (AppDelegate *)[[UIApplication sharedApplication]delegate]; //app delegate method used
    
    strmain = appdel.strPath;
    
    return self;
}

-(NSMutableArray *)getUserData:(NSString *)query{
    
    arrdata = [[NSMutableArray alloc]init];
    
    //open
    if (sqlite3_open([strmain UTF8String], &database) == SQLITE_OK) {
        sqlite3_stmt *connection;
        
        //prepare
        if(sqlite3_prepare_v2(database, [query UTF8String], -1, &connection, nil) == SQLITE_OK){
            
            //setup
            while (sqlite3_step(connection) == SQLITE_ROW) {
                NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
                
                NSString *name = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 1)];
                
                NSString *phone = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(connection, 2)];
                
                [dict setObject:name forKey:@"name"];
                [dict setObject:phone forKey:@"phone"];
                
                [arrdata addObject:dict];
            }
            
        }
        sqlite3_finalize(connection);
    }
    
    sqlite3_close(database);
    
    return arrdata;
}

@end
