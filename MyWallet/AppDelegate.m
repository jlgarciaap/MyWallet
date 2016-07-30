
#import "AppDelegate.h"
#import "WalletTableViewController.h"
#import "Wallet.h"
#import "Money.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

//modificacion de la parte grafica de la aplicación con esto solo necesitamos modificarlo todo
//desde este metodo y no desde cada sitio





- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    /*Antes de la separacion entre IPHONE e IPAD
    
    //Instanciamos modelo de vista conjunta
    JGAWineryModel *winery = [[JGAWineryModel alloc]init];
    */
    
    Wallet *wallet = [[Wallet alloc]initWithAmount:3 currency:@"EUR"];
    Money *money = [Money euroWithAmount:6];
    [wallet plus:money];
    
    WalletTableViewController *walletTvC = [[WalletTableViewController alloc]initWithModel:wallet];
    
    UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:walletTvC];
    
    /*
    
     
    
    
    //instanciamos controladores para el modelo generico y el mvc especifico(dentro del split)
    
    JGAWineryTableViewController *wineryTbC = [[JGAWineryTableViewController alloc]initWithModel:winery style:UITableViewStylePlain];
    
    //en este controlador es necesario que indiquemos cual queremos que sea la vista inicial
    
    JGAWIneViewController *wineVC = [[JGAWIneViewController alloc]initWithModel:[winery plataformaAtIndex:0]];
    
    //Creamos los navigations de cada controlador instanciado
    
    UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:wineryTbC];
    UINavigationController *navWineVC = [[UINavigationController alloc]initWithRootViewController:wineVC];
    
    //Creamos combinador con los dos nav en un split
    UISplitViewController *splitVC = [[UISplitViewController alloc]init];
    
    [splitVC setViewControllers:@[navVC, navWineVC]];
    
    
    //asignamos delegados
    
   // splitVC.delegate = wineVC;
    //wineryTbC.delegate = wineVC;
    
    
  
    //Asignamos el array de tabs a la rootView asignamos como controlador raiz
    
    //Controlamos si tiene pantalla grande o pequeña para usar un Navigation u oto
    
    if ([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        splitVC.delegate = wineVC;
        wineryTbC.delegate = wineVC;
        
        
        self.window.rootViewController = splitVC;
        
        
    } else {
        
        wineryTbC.delegate = wineryTbC;
        
        self.window.rootViewController = navVC;
        
    }
    
    
    //self.window.rootViewController = splitVC;*/
    
    //usamos la configuracion visual modificada
    
   
    
   
    self.window.rootViewController = navVC;
    
    
    
    [self.window makeKeyAndVisible];
    
    
    
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
