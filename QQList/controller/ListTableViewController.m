//
//  ListTableViewController.m
//  QQList
//
//  Created by 李李贤军 on 15/7/13.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import "ListTableViewController.h"
#import "THFriendModel.h"
#import "THGroupModel.h"
#import "Headview.h"
#import "ViewController.h"
@interface ListTableViewController ()<HeaderVeiwDelegate>


{
//    UITableViewCell * cell;
}
@property(nonatomic,strong)NSArray * dataArray;


@end

@implementation ListTableViewController


//加载数据
-(NSArray *)dataArray
{


    if (!_dataArray) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"ffendList.plist" ofType:nil];
        
        
        NSArray * array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray * muArray = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary * dict in array) {
            THGroupModel * model = [THGroupModel GroupWithDict:dict];
            [muArray  addObject: model];
        }
        
       _dataArray = [muArray copy];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.sectionHeaderHeight = 50;
    [self clipExtraCellLine:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    THGroupModel * groupModel = self.dataArray[section];
    NSInteger count = groupModel.isOpen?groupModel.friends.count:0;
    return count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"freighdCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    THGroupModel * groupModel = self.dataArray[indexPath.section];
    THFriendModel * freightModel = groupModel.friends[indexPath.row];
   
    
    cell.textLabel.text = freightModel.name;
    cell.detailTextLabel.text = freightModel.intro;
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    Headview * header = [Headview headerView:tableView];
    header.delegate = self;
    header.groupModel = self.dataArray[section];
    return header;
}
-(void)clickView
{
    [self.tableView reloadData];


}
-(void)clipExtraCellLine:(UITableView*)tableView
{
    UIView * view = [[UIView alloc] init];
    view.backgroundColor =[UIColor clearColor];
    [self.tableView setTableFooterView:view];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ViewController * v =[[ViewController alloc] init];
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    v.str = cell.detailTextLabel.text;
    [self.navigationController pushViewController:v animated:YES];
}
@end
