//
//  ViewController.m
//  上传视频到服务器
//
//  Created by 张俊凯 on 2017/1/12.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //视频转换为MP4
    //转码操作...
    _hud.mode = MBProgressHUDModeIndeterminate;
    _hud.labelText = @"转码中...";
    AVURLAsset *avAsset = [AVURLAsset URLAssetWithURL:_filePathURL  options:nil];
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyyMMddHHmmss"];
    _fileName = [NSString stringWithFormat:@"output-%@.mp4",[formater stringFromDate:[NSDate date]]];
    _outfilePath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", _fileName];
    NSArray *compatiblePresets = [AVAssetExportSession exportPresetsCompatibleWithAsset:avAsset];
    
    if ([compatiblePresets containsObject:AVAssetExportPresetMediumQuality])
    {
        MyLog(@"outPath = %@",_outfilePath);
        AVAssetExportSession *exportSession = [[AVAssetExportSession alloc]initWithAsset:avAsset presetName:AVAssetExportPresetMediumQuality];
        exportSession.outputURL = [NSURL fileURLWithPath:_outfilePath];
        exportSession.outputFileType = AVFileTypeMPEG4;
        [exportSession exportAsynchronouslyWithCompletionHandler:^{
            if ([exportSession status] == AVAssetExportSessionStatusCompleted) {
                MyLog(@"AVAssetExportSessionStatusCompleted---转换成功");
                _filePath = _outfilePath;
                _filePathURL = [NSURL URLWithString:[NSString stringWithFormat:@"file://%@",_outfilePath]];
                MyLog(@"转换完成_filePath = %@\n_filePathURL = %@",_filePath,_filePathURL);
                //获取大小和长度
                [self SetViewText];
                [self uploadNetWorkWithParam:@{@"contenttype":@"application/octet-stream",@"discription":description}];
            }else{
                MyLog(@"转换失败,值为:%li,可能的原因:%@",(long)[exportSession status],[[exportSession error] localizedDescription]);
                [_hud hide:YES];
                [MyHelper showAlertWith:nil txt:@"转换失败,请重试"];
            }
        }];
        
    }

   
}

#pragma mark - 开始上传

-(void)uploadNetWorkWithParam:(NSDictionary*)dict
{
    MyLog(@"开始上传_filePath = %@\n_filePathURL = %@",_filePath,_filePathURL);
    AFHTTPRequestSerializer *ser=[[AFHTTPRequestSerializer alloc]init];
    NSMutableURLRequest *request =
    [ser multipartFormRequestWithMethod:@"POST"
                              URLString:[NSString stringWithFormat:@"%@%@",kBaseUrl,kVideoUploadUrl]
                             parameters:@{@"path":@"show",@"key":_key,@"discription":dict[@"discription"],@"isimage":@(_isImage)}
              constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                  [formData appendPartWithFileURL:_filePathURL name:@"file" fileName:_fileName mimeType:dict[@"contenttype"] error:nil];
                  if (!_isImage) {
                      [formData appendPartWithFileURL:_path2Url name:@"tmp" fileName:@"tmp.PNG" mimeType:@"image/png" error:nil];
                  }
              } error:nil];
    //@"image/png"   @"application/octet-stream"  mimeType
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSProgress *progress = nil;
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:&progress completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            MyLog(@"request = %@", request );
            MyLog(@"response = %@", response );
            MyLog(@"Error: %@", error );
            [_hud hide:YES];
            CXAlertView *alert=[[CXAlertView alloc]initWithTitle:NSLocalizedString(@"Warning", nil)
                                                         message:NSLocalizedString(@"Upload Failed",nil)
                                               cancelButtonTitle:NSLocalizedString(@"Iknow", nil)];
            alert.showBlurBackground = NO;
            [alert show];
        } else {
            MyLog(@"%@ %@", response, responseObject);
            NSDictionary *backDict=(NSDictionary *)responseObject;
            if ([backDict[@"success"] boolValue] != NO) {
                _hud.labelText = NSLocalizedString(@"Updating", nil);
                [self UpdateResxDateWithDict:backDict discription:dict[@"discription"]];
                [_hud hide:YES];
            }else{
                [_hud hide:YES];
                [MyHelper showAlertWith:nil txt:backDict[@"msg"]];
            }
        }
        [progress removeObserver:self
                      forKeyPath:@"fractionCompleted"
                         context:NULL];
    }];
    [progress addObserver:self
               forKeyPath:@"fractionCompleted"
                  options:NSKeyValueObservingOptionNew
                  context:NULL];
    [progress setUserInfoObject:@"someThing" forKey:@"Y.X."];
    [uploadTask resume];
    
}
//记得上传成功之后要删除沙盒中的视频文件哦！代码奉上
#pragma mark - 清除documents中的视频文件
-(void)ClearMovieFromDoucments{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSArray *contents = [fileManager contentsOfDirectoryAtPath:documentsDirectory error:NULL];
    NSEnumerator *e = [contents objectEnumerator];
    NSString *filename;
    while ((filename = [e nextObject])) {
        MyLog(@"%@",filename);
        if ([filename isEqualToString:@"tmp.PNG"]) {
            MyLog(@"删除%@",filename);
            [fileManager removeItemAtPath:[documentsDirectory stringByAppendingPathComponent:filename] error:NULL];
            continue;
        }
        if ([[[filename pathExtension] lowercaseString] isEqualToString:@"mp4"]||
            [[[filename pathExtension] lowercaseString] isEqualToString:@"mov"]||
            [[[filename pathExtension] lowercaseString] isEqualToString:@"png"]) {
            MyLog(@"删除%@",filename);
            [fileManager removeItemAtPath:[documentsDirectory stringByAppendingPathComponent:filename] error:NULL];
        }
    }
}


@end
