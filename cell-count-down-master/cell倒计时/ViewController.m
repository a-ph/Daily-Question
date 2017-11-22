//
//  ViewController.m
//  cell倒计时
//
//  Created by Eaph Sing on 2017/11/22.
//  Copyright © 2017年 Ray Wenderlich. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>

@property(nonatomic, strong) NSMutableDictionary *dic;
@property(nonatomic, strong) NSArray *dataArr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

static NSString *const cellID = @"cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dic = [NSMutableDictionary new];
    NSMutableArray *arr = [@[] mutableCopy];
    //实际应用中i对应为商品的唯一id
    for (NSInteger i = 1; i <= 10; i++) {
        [arr addObject:@(i*100)];
        [self.dic setObject:@(i*100) forKey:[NSString stringWithFormat:@"%ld", (long)i]];
    }
    self.dataArr = arr;
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self.dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSNumber *time = (NSNumber *)obj;
            NSInteger timeinteger = time.integerValue;
            timeinteger-- ;
            self.dic[key] = @(timeinteger);
        }];
        NSArray *arr = [self.tableView visibleCells];
        for (UITableViewCell *cell in arr) {
            //            NSInteger interger = cell.textLabel.text.integerValue;
            //            interger--;
            //            cell.textLabel.text = [NSString stringWithFormat:@"%ld", interger];
            NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
            NSString *key = [NSString stringWithFormat:@"%ld", indexPath.row+1];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", self.dic[key]];
        }
    }];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    [timer fire];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    NSString *key = [NSString stringWithFormat:@"%ld", indexPath.row+1];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.dic[key]];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
