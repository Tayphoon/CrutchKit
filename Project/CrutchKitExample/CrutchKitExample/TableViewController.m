//
//  TableViewController.m
//  CrutchKitExample
//
//  Created by Smal Vadim on 07/06/15.
//  Copyright (c) 2015 cognitivedisson. All rights reserved.
//

#import "TableViewController.h"
#import "UIResponder+CDExtension.h"
#import "CDObserversProxy.h"
#import "TableViewCell.h"
#import "UIColor+CDExtension.h"
#import "CDProtocol.h"

@interface TableViewController () <TableViewCellDelegate>

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Protocol *protocol = @protocol(TableViewCellDelegate);
    self.proxy = [CDObserversProxy observersProxyWithProtocol:protocol
                                                    observers:@[self]];
    
    NSArray *array = [[CDProtocol protocolFromObjCProtocol:@protocol(UITableViewDelegate)] selectors];
    NSLog(@"%@", array);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSArray *responderChain = [cell cd_responderChain];
    NSMutableString *string =  [NSMutableString new];
    for (UIResponder *responder in responderChain) {
        NSString *nextStr = [responderChain lastObject] == responder ? @""  : @"->";
        NSString *str = [NSString stringWithFormat:@"%@%@", [responder class], nextStr];
        [string appendString:str];
    }
    NSLog(@"%@", string);
}

- (void)didPressButton:(UIButton *)button onCell:(TableViewCell *)cell {
    self.navigationController.navigationBar.barTintColor = [UIColor randomColor];
}

@end