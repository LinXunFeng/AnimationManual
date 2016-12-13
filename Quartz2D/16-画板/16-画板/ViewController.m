//
//  ViewController.m
//  16-画板
//
//  Created by LXF on 2016/12/7.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
#import "HandleImageView.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, HandleImageViewDelegate>
@property (weak, nonatomic) IBOutlet DrawView *drawView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - 事件监听
// 清屏
- (IBAction)clear:(id)sender {
    [self.drawView clear];
}
// 撤销
- (IBAction)undo:(id)sender {
    [self.drawView undo];
}
// 橡皮擦
- (IBAction)erase:(id)sender {
    [self.drawView erase];
}
// 设置线的宽度
- (IBAction)setLineWidth:(UISlider *)sender {
    [self.drawView setLineWidth:sender.value];
}
// 设置线的颜色
- (IBAction)setLineColor:(UIButton *)sender {
    [self.drawView setLineColor:sender.backgroundColor];
}

// 照片
- (IBAction)photo:(id)sender {
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        NSLog(@"相册不能用");
        return;
    }
    
    // 从系统相册当中选择一张图片
    // 1.弹出系统相册
    UIImagePickerController *pickerVc = [[UIImagePickerController alloc] init];
    // 设置照片来源
    pickerVc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    // 设置代理
    pickerVc.delegate = self;
    // modal出系统相册
    [self presentViewController:pickerVc animated:YES completion:nil];
}
// 保存
- (IBAction)save:(id)sender {
    // 把绘制的东西保存到系统相册当中
    // 1.开启一个位图上下文
    UIGraphicsBeginImageContextWithOptions(self.drawView.bounds.size, NO, 0);
    // 2.把画板上的内容渲染到上下文当中
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.drawView.layer renderInContext:ctx];
    // 3.从上下文当中取出一张图片
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    // 4.关闭上下文
    UIGraphicsEndImageContext();
    // 5.把图片保存到系统相册当中
    UIImageWriteToSavedPhotosAlbum(newImg, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}
// 保存完毕时调用
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSLog(@"图片保存成功");
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    // NSData *data = UIImageJPEGRepresentation(image, 1);
    // [data writeToFile:@"/Users/lxf/Desktop/photo.jpg" atomically:YES];
    // NSData *data = UIImagePNGRepresentation(image);
    // [data writeToFile:@"/Users/lxf/Desktop/photo.png" atomically:YES];
    
    HandleImageView *handleV = [[HandleImageView alloc] initWithFrame:self.drawView.frame];
//    handleV.backgroundColor = [UIColor redColor];
    handleV.image = image;
    handleV.delegate = self;
    [self.view addSubview:handleV];
    
    // 取消弹出的系统相册
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - HandleImageViewDelegate
- (void)handleImageView:(HandleImageView *)handleImageView newImage:(UIImage *)newImage {
    self.drawView.image = newImage;
}



@end
