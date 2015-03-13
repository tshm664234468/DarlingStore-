//
//  NetworkTool.m
//  DarlingStore
//
//  Created by User on 15-3-6.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "NetworkTool.h"
#import "ASIHTTPRequest.h"
#import "JSON.h"
#import "DataModels.h"

@implementation NetworkTool


+ (void)requestSortListWithCompletionBlock:(void(^)(NSDictionary *dic))block{
    NSURL *url = [NSURL URLWithString:@"http://m.ymall.com/api/menu/more"];
    __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setCompletionBlock:^{ 
        //NSLog(@"%@",request.responseString);
       
        block(request.responseString.JSONValue);
    }];
    
    [request startAsynchronous];
    
    
}

+(void)requestListUrl:(NSString*)urlstr andListId:(NSString*)listid completionBlock:(void(^)(NSDictionary *dic))block{
    
//如果缺失的URL的参数有规律的话，可以在方法里写一个参数进行自动判断；
    NSURL *url = nil;
    if ([urlstr isEqualToString:@""])
    {
        url = [NSURL URLWithString:@"http://m.ymall.com/api/goods/search?page=1&size=20"];
    }
    else if([listid isEqualToString:@"481"])
    {
    
    url = [NSURL URLWithString:@"http://m.ymall.com/api/goods/search?page=1&size=20&id=482&sale_type=1&key=null&sort=null"];
    
    }
    else
    {
        NSString * encodedString=(__bridge NSString *)CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)urlstr, NULL, NULL,  kCFStringEncodingUTF8 );
        
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://m.ymall.com%@&id=%@&key=null&sort=null", encodedString,listid]];
    }
    // NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://m.ymall.com%@&id=%@&key=null&sort=null", (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)urlstr, NULL, NULL,  kCFStringEncodingUTF8 ),listid]];
    
    //因为有汉字转码，所以需要这样做
    
    
    
    
    //  NSString 转码  汉字转码 url转码
   // NSString * encodedString = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)URLSTR, NULL, NULL,  kCFStringEncodingUTF8 );
    
                   
  // NSURL *url = [NSURL URLWithString:[@"http://m.ymall.com/api/goods/search?page=1&size=20&tags=%E5%88%9B%E6%84%8F&id=472&key=null&sort=null"];
    
    
    __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setCompletionBlock:^{
       // NSLog(@"------===-----%@",request.responseString.JSONValue);
        
        block(request.responseString.JSONValue);
    }];
    
    [request startAsynchronous];
    
    
}

+(void)requestStartUrl:(NSString*)urlTags andId:(NSString*)exId completionBlock:(void(^)(NSDictionary *dic))block
{
//极致美护http://m.ymall.com/api/goods/search?page=1&size=20&tags=%E6%9E%81%E8%87%B4&id=3305&frontpage=1&key=null&sort=null
    
    NSString * encodedString=(__bridge NSString *)CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)urlTags, NULL, NULL,  kCFStringEncodingUTF8 );
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://m.ymall.com/api/goods/search?page=1&size=20&tags=%@id=%@&frontpage=1&key=null&sort=null", encodedString,exId]];
    
    __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setCompletionBlock:^{
        // NSLog(@"------===-----11111111========%@",request.responseString.JSONValue);
        
        block(request.responseString.JSONValue);
    }];
    
    [request startAsynchronous];

}

+(void)requestDetailsUrl:(NSString*)goods_id completionBlock:(void(^)(NSDictionary *dic))block
{
    
    
  //  NSString * encodedString=(__bridge NSString *)CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)goods_id, NULL, NULL,  kCFStringEncodingUTF8 );
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://m.ymall.com/api/goods/special?goods_id=%@",goods_id]];
    
    __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setCompletionBlock:^{
        
        NSLog(@"------===-----11111111========%@",request.responseString.JSONValue);
        
      
    
        
        block(request.responseString.JSONValue);
    }];
    
    [request startAsynchronous];
    
}


@end
