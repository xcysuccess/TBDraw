//
//  HomeViewController.m
//  TBDraw
//
//  Created by xiangchenyu on 14-8-22.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "HomeModel.h"

#define rAnimalCount 10
#define rRowHeight 60
static NSString * cellIdentifier = @"HomeTableViewCell";

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * _animalList;
}
@property(nonatomic,strong) UITableView *tableViewHome;

@end

@implementation HomeViewController

- (void)loadAnimals
{
    _animalList = [NSMutableArray arrayWithCapacity:rAnimalCount];
    for (NSInteger i = 0; i < rAnimalCount; i++)
    {
        Animal *animal = [[Animal alloc] init];
        NSString *name = [NSString stringWithFormat:@"第%d章", i];
        NSString *detail = [NSString stringWithFormat:@"第%d章的详情", i];
        
        NSInteger seed = arc4random()%8 + 1;
        NSString *imageName = [NSString stringWithFormat:@"head%02d", seed+1];
        
        animal.title = name;
        animal.content = detail;
        animal.imageHeader = imageName;
        
        [_animalList addObject:animal];
    }
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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadAnimals];
    
    [self initViews];

}
- (void) initViews
{
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableViewHome = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.tabBarController.tabBar.frame.size.height)];
    self.tableViewHome.delegate = self;
    self.tableViewHome.dataSource = self;
    [self.tableViewHome reloadData];
    
    [self.view addSubview:self.tableViewHome];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma address table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return rRowHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _animalList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil)
    {
        cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [cell bindModel : _animalList[indexPath.row]];
    
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

@end
