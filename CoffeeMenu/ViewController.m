//
//  ViewController.m
//  PageViewDemo
//
//  Created by Simon on 24/11/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#define PREPARE_ESPRESSO NSLocalizedStringFromTable(@"PREPARE_ESPRESSO", @"ViewController",@"preare a cup of espresso")
#define ADD_MILK_INTO_COFFEE NSLocalizedStringFromTable(@"ADD_MILK_INTO_COFFEE", @"ViewController",@"add milk")
#define FINISH_PROCESS NSLocalizedStringFromTable(@"FINISH_PROCESS", @"ViewController",@"done")
#define ADD_CHOCOLATE_SYRUP NSLocalizedStringFromTable(@"ADD_CHOCOLATE_SYRUP", @"ViewController",@"add chocolate")
#define ADD_WHIPPEDCREAM_ON_COFFEE NSLocalizedStringFromTable(@"ADD_WHIPPEDCREAM_ON_COFFEE", @"ViewController",@"add cream")
#define MAKE_MILK_FOAM NSLocalizedStringFromTable(@"MAKE_MILK_FOAM", @"ViewController",@"make milk foam")
#define ADD_MILK_FOAM_ON_COFFEE NSLocalizedStringFromTable(@"POUR_MILK_FOAM_ON_COFFEE", @"ViewController",@"add milk foam")
#define ADD_CARAMEL_SYRUP_ON_COFFEE NSLocalizedStringFromTable(@"ADD_CARAMEL_SYRUP_ON_COFFEE", @"ViewController",@"add caramel")
#define ADD_WATER_TO_COFFEE NSLocalizedStringFromTable(@"ADD_WATER_TO_COFFEE", @"ViewController",@"add water")
#define ADD_VANILA_SYRUP_TO_COFFEE NSLocalizedStringFromTable(@"ADD_VANILA_SYRUP_TO_COFFEE", @"ViewController",@"add vanila")
- (void)setbackgroundcolor
{
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"Style_Enabled"])
    {
        
        self.view.backgroundColor = [UIColor brownColor];
        UIPageControl *pageControl = [UIPageControl appearance];
        pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        pageControl.backgroundColor = [UIColor brownColor];
        
        //self.collectionView.backgroundColor = [UIColor blackColor];
    }
    else
    {
        
        self.view.backgroundColor = [UIColor whiteColor];
        UIPageControl *pageControl = [UIPageControl appearance];
        pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        pageControl.backgroundColor = [UIColor whiteColor];
        //self.collectionView.backgroundColor = [UIColor whiteColor];
    }
}

- (void)viewDidLoad
{
    //@"Latte"
    //, @"Mocha"
    //, @"Cappuccino"
    //, @"Espresso Con Panna"
    //, @"Espresso Macchiato"
    //, @"Americano"
    //, @"Caramel Macchiato"
    //
    [self setbackgroundcolor];
    [[NSNotificationCenter defaultCenter] addObserverForName:NSUserDefaultsDidChangeNotification object:nil queue:nil usingBlock:^(NSNotification *note){
        [self setbackgroundcolor];
    }];
    [super viewDidLoad];
	// Create the data model
    _pageTitles = @[@"Over 200 Tips and Tricks", @"Discover Hidden Features", @"Bookmark Favorite Tip", @"Free Regular Update"];
    _pageImages = @[@"page1.png", @"page2.png", @"page3.png", @"page4.png"];
    if([_coffeeString isEqualToString:@"0"])
    {
        //_pageTitles = @[@"準備一份濃縮咖啡", @"將鮮奶加入濃縮咖啡", @"完成了"];
        _pageTitles = @[PREPARE_ESPRESSO, ADD_MILK_INTO_COFFEE, FINISH_PROCESS];
        _pageImages = @[@"espresso.png", @"pour milk.png",@"Latte.png"];
    }
    else if([_coffeeString isEqualToString:@"1"])
    {
        
         _pageTitles = @[PREPARE_ESPRESSO, ADD_MILK_INTO_COFFEE, ADD_CHOCOLATE_SYRUP,ADD_WHIPPEDCREAM_ON_COFFEE, FINISH_PROCESS];
        _pageImages = @[ @"espresso.png", @"pour milk.png",@"chocolatesyrup.png", @"WhippedCream.png",@"Mocha.png"];
    }
    else if([_coffeeString isEqualToString:@"2"])
    {
         _pageTitles = @[PREPARE_ESPRESSO, ADD_MILK_INTO_COFFEE, ADD_MILK_FOAM_ON_COFFEE, FINISH_PROCESS];
        _pageImages = @[@"espresso.png", @"pour milk.png", @"pourfoam.png",@"Cappuccino.png"];
    }
    
    else if([_coffeeString isEqualToString:@"3"])//espresso con panna
    {
        _pageTitles = @[PREPARE_ESPRESSO,ADD_WHIPPEDCREAM_ON_COFFEE,ADD_CARAMEL_SYRUP_ON_COFFEE, FINISH_PROCESS];
        _pageImages = @[@"espresso.png", @"WhippedCream.png", @"camerel sauce.png",@"Espresso Con Panna.png"];
        
    }
    else if([_coffeeString isEqualToString:@"4"])//espresso macchiato
    {
        _pageTitles = @[PREPARE_ESPRESSO, ADD_MILK_FOAM_ON_COFFEE, FINISH_PROCESS];
        _pageImages = @[@"espresso.png", @"pourfoam.png",@"Espresso Macchiato.png"];
        
    }
    else if([_coffeeString isEqualToString:@"5"])//Americano
    {
        _pageTitles =@[PREPARE_ESPRESSO, ADD_WATER_TO_COFFEE, FINISH_PROCESS];
        _pageImages = @[@"espresso.png", @"waterpour.png", @"Americano.png"];
    }
    else if([_coffeeString isEqualToString:@"6"])//caramel macchiato
    {
        _pageTitles = @[PREPARE_ESPRESSO,ADD_VANILA_SYRUP_TO_COFFEE,  ADD_CARAMEL_SYRUP_ON_COFFEE, ADD_MILK_FOAM_ON_COFFEE, FINISH_PROCESS];
        _pageImages = @[@"espresso.png", @"vanila syrup.png", @"camerel sauce.png",@"pourfoam.png",@"Caramel Macchiato.png"];
        
    }
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 80);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];

    //_coffeLabel.text=_coffeeString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startWalkthrough:(id)sender {
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.pageIndex = index;
    if(index == ([self.pageTitles count] - 1))
    {
        pageContentViewController.isfbEnable=true;
    }
    else
    {
        pageContentViewController.isfbEnable=false;
    }
    
    return pageContentViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end
