//
//  MasterViewController.m
//  axel
//
//  Created by 张俊凯 on 2017/3/13.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

#import "MasterViewController.h"

#import "AxelData.h"
#import "AxelDoc.h"
#import "EDStarRating.h"
#import <Quartz/Quartz.h>
#import "NSImage+Extras.h"

@interface MasterViewController ()<NSTableViewDelegate,NSTableViewDataSource,EDStarRatingProtocol>
@property (weak) IBOutlet NSTableView *bugsTableView;
@property (weak) IBOutlet NSTextField *bugTitleView;
@property (weak) IBOutlet EDStarRating *bugRating;
@property (weak) IBOutlet NSImageView *bugImageView;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化设置
    self.bugRating.starImage = [NSImage imageNamed:@"start"];
    self.bugRating.starHighlightedImage = [NSImage imageNamed:@"shockedface2_full"];
    self.bugRating.starImage = [NSImage imageNamed:@"shockedface2_empty"];
    self.bugRating.maxRating = 5.0;
    self.bugRating.delegate = (id<EDStarRatingProtocol>)self;
    self.bugRating.horizontalMargin = 12;
    self.bugRating.editable = YES;
    self.bugRating.displayMode = EDStarRatingDisplayFull;
    self.bugRating.rating = 0.0;
    
    self.bugTitleView.translatesAutoresizingMaskIntoConstraints = YES;
}

-(AxelDoc *)selectedBugDoc{
    NSInteger selectedRow = [self.bugsTableView selectedRow];
    
    if(selectedRow >= 0 && self.bugs.count > selectedRow){ //在数组的范围内
        AxelDoc *doc = [self.bugs objectAtIndex:selectedRow];
        return doc;
    }
    
    return nil;
}

-(void)setDetailInfo:(AxelDoc *)doc{
    NSString *title = @"";
    NSImage *image = nil;
    float rating = 0.0;
    
    if (doc != nil) {
        title = doc.data.title;
        image = doc.fullImage;
        rating = doc.data.rating;
    }
    
    [self.bugTitleView setStringValue:title];
    [self.bugImageView setImage:image];
    [self.bugRating setRating:rating];
}

//添加新的行
- (IBAction)addBug:(NSButton *)sender {
    //1.创建数据模型
    AxelDoc *doc = [[AxelDoc alloc] initWithTitle:@"new bug" rating:0.0 thumbImage:nil fullImage:nil];
    //2.添加模型到数组
    [self.bugs addObject:doc];
    //3.算出添加后的行号
    NSInteger newRowIndex = self.bugs.count - 1;
    //4.表格中插入新行
    [self.bugsTableView insertRowsAtIndexes:[NSIndexSet indexSetWithIndex:newRowIndex] withAnimation:NSTableViewAnimationEffectFade];
    //5.设置新行选中和可见
    [self.bugsTableView selectRowIndexes:[NSIndexSet indexSetWithIndex:newRowIndex] byExtendingSelection:NO];
    [self.bugsTableView scrollRowToVisible:newRowIndex];
}

//删除选中的行
- (IBAction)deleteBug:(NSButton *)sender {
    //1.拿出当前的数据模型
    AxelDoc *selectedDoc = [self selectedBugDoc];
    if (selectedDoc) {
        //2.删除数据模型
        [self.bugs removeObject:selectedDoc];
        NSInteger selectedRow = self.bugsTableView.selectedRow;
        //3.视图中删除选中的行
        [self.bugsTableView removeRowsAtIndexes:[NSIndexSet indexSetWithIndex:selectedRow] withAnimation:NSTableViewAnimationSlideRight];
        //4.清空详情视图内容
        [self setDetailInfo:nil];
        //5.设置选中行为上一个
        [self.bugsTableView selectRowIndexes:[NSIndexSet indexSetWithIndex:selectedRow - 1 > 0?selectedRow - 1:0] byExtendingSelection:NO];

    }
}

//输入框指令
- (IBAction)bugTitleDidEdit:(NSTextField *)sender {
    //先拿出选中的数据
    AxelDoc *doc = [self selectedBugDoc];
    if (doc) {//如果有选中数据
       //让模型数据等于输入数据
        doc.data.title = self.bugTitleView.stringValue;
        //视图刷新更改的数据
        [self.bugsTableView reloadDataForRowIndexes:[NSIndexSet indexSetWithIndex:[self.bugs indexOfObject:doc]] columnIndexes:[NSIndexSet indexSetWithIndex:0]];
    }
}

#pragma mark tableView delegate
-(void)tableViewSelectionDidChange:(NSNotification *)notification{
    AxelDoc *doc = [self selectedBugDoc];
    [self setDetailInfo:doc];
}
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return self.bugs.count;
}

//每一行的cell
-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView *cell = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    //根据重用标示，设置cell数据
    if([tableColumn.identifier isEqualToString:@"BugColumn"]){
        AxelDoc *doc = [self.bugs objectAtIndex:row];
        cell.imageView.image = doc.thumbImage;
        cell.textField.stringValue = doc.data.title;
    }
    return cell;
}

#pragma mark EDStartRatingProtocal
//更改星级指数
-(void)starsSelectionChanged:(EDStarRating *)control rating:(float)rating{
    AxelDoc *doc = [self selectedBugDoc];
    if (doc) {
        doc.data.rating = self.bugRating.rating;
    }
}

//更改图片指令
- (IBAction)changePicture:(NSButton *)sender {
    //选中行的数据
    AxelDoc *doc = [self selectedBugDoc];
    if (doc) {
        [[IKPictureTaker pictureTaker] beginPictureTakerSheetForWindow:self.view.window withDelegate:self didEndSelector:@selector(pictureTakerDidEnd:retureCode:contextInfo:) contextInfo:nil];
    }else{
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"确定"];
        alert.messageText = @"没有选中的图片";
        [alert runModal];
        
    }
}



//图片选择后回调方法
-(void)pictureTakerDidEnd:(IKPictureTaker *)picker retureCode:(NSInteger)code contextInfo:(void *)contextInfo{
    NSImage *image = [picker outputImage];
    if (image != nil && (code == NSModalResponseOK)) {
        [self.bugImageView setImage:image];
        AxelDoc *doc = [self selectedBugDoc];
        if (doc) {//判断选中是否有数据
            doc.fullImage = image;
            //设置缩略图片
            doc.thumbImage = [image imageByScalingAndCroppingForSize:CGSizeMake(44, 44)];
            //获取位置并刷新表格
             [self.bugsTableView reloadDataForRowIndexes:[NSIndexSet indexSetWithIndex:[self.bugs indexOfObject:doc]] columnIndexes:[NSIndexSet indexSetWithIndex:0]];
        }
    }
}






















@end
