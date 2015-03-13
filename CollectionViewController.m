//
//  CollectionViewController.m
//  DarlingStore
//
//  Created by 123 on 15-3-9.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "CollectionViewController.h"
#import "CustomDaelingCell.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
@interface CollectionViewController ()

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

-(id)init{
    self=[super init];
    if (self)
    {
        _layout=[[UICollectionViewFlowLayout alloc]init];
        _layout.sectionInset=UIEdgeInsetsMake(10, 10, 10, 10);
        _layout.itemSize= CGSizeMake(145, 260);
        _layout.minimumInteritemSpacing=10;
        _layout.minimumLineSpacing=10;
        self=[super initWithCollectionViewLayout:_layout];
        
      
    }

    return self;

}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
    [self.collectionView registerClass:[CustomDaelingCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
   
}


- (void)didReceiveMemoryWarning
{
  
    [super didReceiveMemoryWarning];
   
}
-(void)requestFindData:(NSString*)requestWithURL
{
    AFHTTPRequestOperationManager *manage=[AFHTTPRequestOperationManager manager];
    NSString *stringURL=requestWithURL;
    NSString * encodedString = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)stringURL, NULL, NULL,  kCFStringEncodingUTF8 );
    [manage GET:encodedString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        baseClass=[ZYBaseClass  modelObjectWithDictionary:responseObject];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

#pragma mark <UICollectionViewDataSource>
    
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
    {
        return 1;
  
    }


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
 

    CustomDaelingCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.clipsToBounds=YES;
    cell.layer.cornerRadius=10;
   
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
