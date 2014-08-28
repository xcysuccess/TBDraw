//
//  LeftFaceController.m
//  TBDraw
//
//  Created by XiangChenyu on 14-8-28.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "LeftFaceController.h"

#define rAnimalCount 15
#define rRowHeight 60
static NSString * cellIdentifier = @"LeftFaceTableViewCell";

@interface LeftFaceController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * _animalList;
}
@property(nonatomic,strong) UITableView *tableViewLeft;

@end



@implementation LeftFaceController

- (void)loadAnimals
{
    _animalList = [NSMutableArray arrayWithCapacity:rAnimalCount];
    for (NSInteger i = 0; i < rAnimalCount; i++)
    {
        NSString *detail = [NSString stringWithFormat:@"第%d章", i+1];;
        
        [_animalList addObject:detail];
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
    
    [self loadAnimals];
    
    [self initViews];
    
    // Do any additional setup after loading the view.
}
- (void) initViews
{    
    //    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.tableViewLeft = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - self.tabBarController.tabBar.frame.size.height - 20)];
    self.tableViewLeft.delegate = self;
    self.tableViewLeft.dataSource = self;
    [self.tableViewLeft reloadData];
    
    [self.view addSubview:self.tableViewLeft];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - address table view data source
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [_animalList objectAtIndex: [indexPath row]];
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
