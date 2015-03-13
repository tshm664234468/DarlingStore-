//
//  DetailViewController.m
//  DarlingStore
//
//  Created by 123 on 15-3-9.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "DetailViewController.h"
#import "NetworkTool.h"
#import "UIImageView+WebCache.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
      self.view.backgroundColor=[UIColor whiteColor];
    
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height-64)];
//    _scrollView.contentSize=CGSizeMake(0, self.view.frame.size.height-64);
  //  _scrollView.backgroundColor=[UIColor redColor];
    //
    //    UIImageView*_imageView=[[UIImageView  alloc]initWithFrame:CGRectMake(10, 0, 300, 150)];
    //    _imageView.backgroundColor=[UIColor  greenColor];
    _scrollView.contentSize = CGSizeMake(320, 1000);
    
    [ self.view addSubview:_scrollView];

    
    [NetworkTool requestDetailsUrl:_iList.goodsId completionBlock:^(NSDictionary *dic) {
        
        _baseClass=[DTBaseClass modelObjectWithDictionary:dic];
       
        
        NSLog(@"------===-----11111111========%@",dic);

        
        [self detailsView];
       // [_scrollView ]
        
//        UIWebView *myWebView=[[UIWebViewalloc] initWithFrame:CGRectMake(0, 20, 320, 300)];
//       
//        NSURL *url=[NSURLURLWithString:@"http://www.google.com.hk"];
//        
//        NSURLRequest *request=[[NSURLRequestalloc] initWithURL:url];
//        
//        [myWebView loadRequest:request];
        
        
      
    } ];

 


}


-(void)detailsView
{
    
    
    
    
       UIImageView*BgImage=[[UIImageView  alloc]initWithFrame:CGRectMake(10, 0, 300, 150)];
    
    //BgImage.image=[UIImage  imageNamed:@"i5_baitiaodi.png"];
    
    BgImage.backgroundColor = [UIColor clearColor];
    [BgImage setImageWithURL:[NSURL URLWithString: _baseClass.data.coverImage]];
    
        [_scrollView  addSubview:BgImage];
    

    
    UIImageView*_leftBgImage=[[UIImageView  alloc]initWithFrame:CGRectMake(0, 150, 160, 40)];
    
    _leftBgImage.image=[UIImage  imageNamed:@"i5_baitiaodi.png"];
    
    [_scrollView  addSubview:_leftBgImage];
    
    
    
    
    
    
    UIImageView*_rightBgImage=[[UIImageView  alloc]initWithFrame:CGRectMake(160, 150, 160, 40)];
    
    _rightBgImage.image=[UIImage  imageNamed:@"i5_baitiaodi.png"];
    
    [_scrollView addSubview:_rightBgImage];
    

    UIImageView*leftImage=[[UIImageView  alloc]init];
    
    leftImage.frame=CGRectMake(30, 7, 30, 30);
    
    leftImage.image=[UIImage imageNamed:@"myInfo_fav.png"];
    
    [_leftBgImage addSubview:leftImage];
    
    
    UIImageView*rightImage=[[UIImageView  alloc]init];
    
    rightImage.frame=CGRectMake(30, 7, 30, 30);
    
    rightImage.image=[UIImage imageNamed:@"orderConfirm_card.png"];
    
    [_rightBgImage addSubview:rightImage];
    
    
    
    
    
    UILabel*leftLabel=[[UILabel alloc]initWithFrame:CGRectMake(70, 10, 60, 30)];
    
    leftLabel.text=@"收藏";
    
    [_leftBgImage addSubview:leftLabel];
    
    
    UILabel*rightLabel=[[UILabel alloc]initWithFrame:CGRectMake(70, 10, 60, 30)];
    
    rightLabel.text=@"分享";
    
    [_rightBgImage addSubview:rightLabel];
    
    
    [self.view addSubview:_scrollView];
    
//    UIButton*leftButton=[UIButton buttonWithType:UIButtonTypeCustom];
//    
//    leftButton.frame=CGRectMake(0, 0, 160, 40);
//    
//    [leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
//    
//    
//    [leftLabel  addSubview:leftButton];
//    
//    UIButton*rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
//    
//    rightButton.frame=CGRectMake(0, 0, 160, 40);
//    [rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
//    
//    [rightLabel addSubview:rightButton];
    //大标题
    UIImageView*detailImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 200, 320, 80)];
    detailImageView.image=[UIImage  imageNamed:@"i5_baitiaodi.png"];
    [_scrollView addSubview:detailImageView];
    
    UILabel*prefixNameAndGoodsName=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    
    prefixNameAndGoodsName.text=[NSString stringWithFormat:@"%@%@",_baseClass.data.prefix,_baseClass.data.goodsName];
    prefixNameAndGoodsName.font=[UIFont systemFontOfSize:12];
    
    [detailImageView  addSubview:prefixNameAndGoodsName];
    
    
    //授权图片
    UIImageView*nameImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 290, 320, 90)];
    
    nameImageView.image=[UIImage  imageNamed:@"i5_baitiaodi.png"];
    
    [_scrollView addSubview:nameImageView];
    
    
    UIImageView*nameImageViewOne=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 90, 70)];
    
    
    nameImageViewOne.image=[UIImage  imageNamed:@"detail_brand.png"];
    
    [nameImageView addSubview:nameImageViewOne];
    
    UIImageView*freeImageViewOne=[[UIImageView alloc]initWithFrame:CGRectMake(120, 10, 30, 30)];
    
    
    freeImageViewOne.image=[UIImage  imageNamed:@"detail_sevenDay.png"];
    
    [nameImageView addSubview:freeImageViewOne];
    
    UILabel*freeLabel=[[UILabel alloc]initWithFrame:CGRectMake(150, 0,60, 30)];
    freeLabel.text=@"七天退货";
    freeLabel.font=[UIFont systemFontOfSize:14];
    [nameImageViewOne  addSubview:freeLabel];
    
    
    
    UIImageView*timeImageViewOne=[[UIImageView alloc]initWithFrame:CGRectMake(220, 10, 30, 30)];
    
    
    timeImageViewOne.image=[UIImage  imageNamed:@"detail_24Hours.png"];
    
    [nameImageView addSubview:timeImageViewOne];
    
    UILabel*timeLabel=[[UILabel alloc]initWithFrame:CGRectMake(260,0,60,30)];
    timeLabel.text=@"24小时供应";
    timeLabel.font=[UIFont systemFontOfSize:14];
    [nameImageViewOne  addSubview:timeLabel];
    
    UIImageView*baoYouImageViewOne=[[UIImageView alloc]initWithFrame:CGRectMake(120, 40, 30, 30)];
    
    
    baoYouImageViewOne.image=[UIImage  imageNamed:@"detail_baoyou.png"];
    
    [nameImageView addSubview:baoYouImageViewOne];
    
    UILabel*baoYouLabel=[[UILabel alloc]initWithFrame:CGRectMake(150,40,60, 30)];
    
    baoYouLabel.text=@"快递包邮";
    
    
    baoYouLabel.font=[UIFont systemFontOfSize:14];
    
    [nameImageViewOne  addSubview:baoYouLabel];
    
    
    
    UIImageView*nowImageViewOne=[[UIImageView alloc]initWithFrame:CGRectMake(210, 40, 30, 30)];
    
    
    
    nowImageViewOne.image=[UIImage  imageNamed:@"detail_now.png"];
    
    
    [nameImageViewOne addSubview:nowImageViewOne];
    
    
    UILabel*nowLabel=[[UILabel alloc]initWithFrame:CGRectMake(250, 40,60, 30)];
    
    nowLabel.text=@"北京现货";
    
    nowLabel.font=[UIFont systemFontOfSize:14];
    
    [nameImageViewOne  addSubview:nowLabel];
    
    

    UIImageView*antistopImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 400, 320, 60)];
    antistopImage.image=[UIImage  imageNamed:@"i5_baitiaodi.png"];
    [_scrollView addSubview:antistopImage];
    
    UILabel*antistopLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    
    
   // antistopLable.text=@"入选（达令）关键词";
    antistopLable.text=[NSString stringWithFormat:@"%@\n %@  %@ %@",_baseClass.data.keywords.name,_baseClass.data.keywords.list[0],_baseClass.data.keywords.list[1],_baseClass.data.keywords.list[2]];
    
    antistopLable.font=[UIFont systemFontOfSize:14];
    
    [antistopImage  addSubview:antistopLable];
    
    
    
    UIImageView*showImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 470, 320, 200)];
    showImage.image=[UIImage  imageNamed:@"i5_baitiaodi.png"];
    [_scrollView addSubview:showImage];
    
//    UILabel*bigShowLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
//    
//    bigShowLable.text=@"产品展示";
//
//    [showImage  addSubview:bigShowLable];
    
    UILabel*showLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 30, 320, 150)];
    
    
    showLable.text=_baseClass.data.description;
    showLable.font=[UIFont systemFontOfSize:14];
    
    
    [showImage  addSubview:showLable];
    
    //图片
//    UIImageView*infoBigImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 370, 320, 200)];
//    infoBigImage.image=[UIImage  imageNamed:@"i5_baitiaodi.png"];
//    [_scrollView addSubview:showImage];

    
    UIImageView*imageOne=[[UIImageView  alloc]initWithFrame:CGRectMake(10, 705, 300, 150)];
    
    imageOne.backgroundColor=[UIColor redColor];
    
    [_scrollView  addSubview:imageOne];
    
    UIImageView*imageTwo=[[UIImageView  alloc]initWithFrame:CGRectMake(10, 875, 145, 120)];
    
    imageTwo.backgroundColor=[UIColor redColor];
    
    [_scrollView  addSubview:imageTwo];
    
    UIImageView*imageThree=[[UIImageView  alloc]initWithFrame:CGRectMake(170, 875, 145, 120)];
    
    imageThree.backgroundColor=[UIColor redColor];
    
    [_scrollView  addSubview:imageThree];
    
    
//    UILabel *specialLabel=[[UILabel  alloc]initWithFrame:CGRectMake(5, 400, 60, 25)];
//    label.text=@"特别之处";
//    [ProductimageView addSubview:specialLabel];
//    
//    
//    UILabel *specailContentLabel=[[UILabel  alloc]initWithFrame:CGRectMake(5, 430, 310,100)];
//    specailContentLabel.text=@"特别之处";
//    [ProductimageView addSubview:specailContentLabel];
//    
//    for (int  i=0; i<4; i++)
//    {
//        
//        int x=10+i%2*(150+5);
//        int y=540+i/2*(150+20);
//        
//        UIImageView*imageFore=[[UIImageView  alloc]initWithFrame:CGRectMake(x, y, 150, 150)];
//        
//        imageFore.backgroundColor=[UIColor redColor];
//        
//        [ProductimageView  addSubview:imageFore];
    
        
   // }
    
    
    
    
}

//输入关键词





//-(void)leftButtonClick
//{
//
//
//    NSLog(@"点我啦");
//
//
//
//}
//-(void)rightButtonClick
//
//{
//
//  NSLog(@"点我啦");
//
//
//}
//
//
//
//-(id)initWithURL:(NSString*)string
//{
//    
//    self=[super init];
//    if (self)
//    {
//        self.string=string;
//    }
//    
//    return self;
//    
//}
//
//
//-(void)setData:(DTData *)data
//{
//
//
//
//
//
//
//
//}
//
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    
//
//    
//    
//    
//    
//   
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
