- (UIImage *)generateQRCode:(NSString *)code width:(CGFloat)width height:(CGFloat)height
 { 

    //生成一个coreImage指针
    CIImage *qrcodeImage; 
    //把内容转换成二进制数据
    NSData *data = [code dataUsingEncoding:NSISOLatin1StringEncoding allowLossyConversion:false]; 

    //创建滤镜，让滤镜生成image
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"]; 
    [filter setValue:data forKey:@"inputMessage"]; 
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"]; 
    qrcodeImage = [filter outputImage]; 
      
    //让生成的ciimage比例适应规定的尺寸
    CGFloat scaleX = width / qrcodeImage.extent.size.width; 
    CGFloat scaleY = height / qrcodeImage.extent.size.height; 
    CIImage *transformedImage = [qrcodeImage imageByApplyingTransform:CGAffineTransformScale(CGAffineTransformIdentity, scaleX, scaleY)]; 
      
    //生成UIImage  
    return [UIImage imageWithCIImage:transformedImage]; 
}