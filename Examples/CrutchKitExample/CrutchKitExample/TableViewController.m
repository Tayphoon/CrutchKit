//
//  TableViewController.m
//  CrutchKitExample
//
//  Created by Smal Vadim on 07/06/15.
//  Copyright (c) 2015 cognitivedisson. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import <CrutchKit/CDProxying.h>
#import <CrutchKit/Runtime/CDRuntime.h>
#import <CrutchKit/Helpers/CDHelpers.h>

@interface TableViewController () <TableViewCellDelegate>

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self cd_startObserveProtocols:@[@protocol(TableViewCellDelegate),
                                     @protocol(AnotherTableViewCellDelegate)]];
    [self printProtocols];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated {
    [self cd_stopObserve];
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
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    NSArray *responderChain = [cell cd_responderChain];
//    NSMutableString *string =  [NSMutableString new];
//    for (UIResponder *responder in responderChain) {
//        NSString *nextStr = [responderChain lastObject] == responder ? @""  : @"->";
//        NSString *str = [NSString stringWithFormat:@"%@%@", [responder class], nextStr];
//        [string appendString:str];
//    }
//    NSLog(@"%@", string);
}

- (void)didPressButton:(UIButton *)button onCell:(TableViewCell *)cell {
    self.navigationController.navigationBar.barTintColor = [[UIColor randomColor] colorWithAlphaComponent:0.5];
}

- (void)didSwitch:(UISwitch *)sender {
    self.view.backgroundColor = sender.isOn ? [UIColor redColor] : [UIColor whiteColor];
}

- (void)didChangedSliderValue:(CGFloat)value {
    self.navigationController.navigationBar.alpha = value;
}

- (void)printProtocols {
    NSArray *array = [[CDProtocol protocolFromObjCProtocol:@protocol(UITableViewDelegate)] selectors];
    NSLog(@"%@", array);
}

@end
