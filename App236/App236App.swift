//
//  App236App.swift
//  App236
//
//  Created by IGOR on 26/10/2023.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Alamofire
import OneSignalFramework
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    @AppStorage("random_id") var random_id: String = ""
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        notificationsGetStarted()
        
        OneSignal.initialize("bd507f1e-3780-4f57-b600-c09b264d763f", withLaunchOptions: launchOptions)
        OneSignal.login(random_id)
        
        Apphud.start(apiKey: "app_GkV82EfAKRPU9gURP4Uwg3FyRq2Yy2")
        Amplitude.instance().initializeApiKey("bf16048e51027051e7cde3835561a94c")
        FirebaseApp.configure()
        
        return true
    }
}

func notificationsGetStarted() {
    
    @AppStorage("random_id") var random_id: String = ""
    
    if random_id.isEmpty {
        
        let randomId = Int.random(in: 1...99999)
        random_id = "\(randomId)"
    }
    
    var url = "https://onesignal-ba.com/api/os/8kOAuuyEbAbSpOyZsO1l/"
    
    url += random_id
    
    let request = AF.request(url, method: .get)
    
    request.response { response in
                       
        switch response.result {
            
        case .success(_):
            
            print("ok")
            
        case .failure(_):
            
            print("failure")
        }
    }
}

@main
struct App236App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
