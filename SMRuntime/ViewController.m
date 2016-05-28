//
//  ViewController.m
//  SMRuntime
//
//  Created by SmileSun on 16-5-28.
//  Copyright (c) 2016年 companyName. All rights reserved.
//

#import "ViewController.h"
#import "SMProperty.h"
#import "UIButton+count.h"
#import <objc/runtime.h> 
#import "NSObject+item.h"
#import "SMModel.h"
@interface ViewController ()
@property(nonatomic,strong)SMProperty * property;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.property = [SMProperty new];
    self.property.name = @"xm";
    //NSLog(@"原名: %@",self.property.name);
    [self SMruntime];
    
}
- (IBAction)SMObjectWithDic:(id)sender {
    
    NSDictionary * dic = @{@"chinese":@"小明",@"english":@"smilesun"};
    
    SMModel * model = [SMModel initWithDictionary:dic];
    NSLog(@"%@",model);
}

- (IBAction)exchangeSel:(id)sender {
    [self exchangeSelector];
}
//交换方法的实现
-(void)exchangeSelector
{   /*
    Method  sel1= class_getInstanceMethod([self.property class], @selector(smSelector));
    Method  sel2= class_getInstanceMethod([self.property class], @selector(changeName));
    method_exchangeImplementations(sel1, sel2);
    //    [self.property smSelector];
    [self.property changeName];*/
    
    SEL oriSel = @selector(smSelector);
    Method oriMethod = class_getInstanceMethod([self.property class], oriSel);
    SEL cusSel = @selector(changeName);
    Method cusMethod = class_getInstanceMethod([self.property class], cusSel);
    //判断原方法是否实现了,如果实现了就添加失败,如果没实现就添加成功(意思就是原来的方法实现了添加不成功,没实现就可以添加)
    BOOL addSuc = class_addMethod([self.property class], oriSel, method_getImplementation(cusMethod), method_getTypeEncoding(cusMethod));
    
    if (addSuc) {
        NSLog(@"添加成功");
        // 添加成功：将源方法的实现替换到交换方法的实现
        class_replaceMethod([self.property class], cusSel, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
        
    }else{
        NSLog(@"添加失败");
        // 添加失败：说明源方法已经有实现,直接将两个方法的实现交换
        method_exchangeImplementations(oriMethod, cusMethod);
        
    }
    [self.property changeName];
}
-(void)SMruntime
{
    //unsigned int count = 0;
#pragma mark -- 获取属性列表(只能获取property修饰的属性变量)
    /*objc_property_t * property = class_copyPropertyList([self.property class], &count);
    for (int i = 0; i < count; i++) {
        //得到类中的属性(取得是utf8,下面转换打印)
        const char * properName = property_getName(property[i]);
        //转成字符串
       NSString * utfName = [NSString stringWithUTF8String:properName];
       NSLog(@"属性:%@",utfName);
    }*/
#pragma mark -- 获取成员变量(获取所有变量包括用property修饰的)
    /*
    Ivar * vars = class_copyIvarList([self.property class], &count);
    for (int i = 0; i < count; i++) {
        Ivar var = vars[i];
        const char * ivar =  ivar_getName(var);
        NSLog(@"变量:%@",[NSString stringWithUTF8String:ivar]);
        //改变属性值
        if ([[NSString stringWithUTF8String:ivar] isEqualToString:@"_name"]) {
            object_setIvar(self.property, var, @"SmileSun");
            break;
        }
    }
    NSLog(@"改过后的名字:%@",self.property.name);
     */
#pragma mark -- 获取protocol
    /*
    __unsafe_unretained Protocol  ** delegate = class_copyProtocolList([UITableView class], &count);
    for (int i = 0 ; i < count; i++) {
        const char * name = protocol_getName(delegate[i]);
        NSLog(@"协议:%@",[NSString stringWithUTF8String:name]);
    }*/
#pragma mark -- 获取方法
    //(class_copyMethodList获取不到类方法)
   /* Method * sel= class_copyMethodList([self.property class], &count);
    for (int i = 0; i < count; i++) {
        SEL selector = method_getName(sel[i]);
        NSLog(@"方法:%@",NSStringFromSelector(selector));
    }*/
    //获取类
    Class aClss= object_getClass([self.property class]);
    NSLog(@"%@",aClss);
#pragma mark -- 添加方法
    //给SMProperty添加方法
    [self addMethodForSMProperty];
    
}
-(void)addMethodForSMProperty{
  /*
   
   *(IMP)addSelector 意思是:addSelector的地址指针;
   *"v@:"            意思是:v代表无返回值void，如果是i则代表int；@代表 id sel; : 代表 SEL _cmd;
   *“v@:@@”          意思是:两个参数的没有返回值
   *
   
    */
    class_addMethod([self.property class], @selector(futureSelector), (IMP)addSelector, "v@:");
#pragma -- mark 添加完成后就在这里实现方法了
    //调用添加的方法
    if ([self.property respondsToSelector:@selector(futureSelector)]) {
        
        [self.property performSelector:@selector(futureSelector)];
        
    } else{
        NSLog(@"Sorry,I don't know");
    }
}
//用c写的一个方法的实现
void addSelector(id self,SEL _cmd){
    
    NSLog(@"我是给SMProperty添加的方法");
    
}
//可以用按钮来控制 添加后 方法的实现(只是为了让自己更加理解而写的"多余的代码")
- (IBAction)addMethod:(id)sender {
    [self.property performSelector:@selector(futureSelector)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
