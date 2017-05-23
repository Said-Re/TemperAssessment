//
//  AppDelegate.swift
//  TemperAssessment
//
//  Created by Said Rehouni on 5/21/17.
//  Copyright © 2017 Said Rehouni. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        do {
            if let file = Bundle.main.url(forResource: "mock", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                
                if let object = json as? [String: Any] {
                    var dayList: [DayModel] = []
                    
                    for dictionary in object {
                        dayList.append(DayModel(dictionary: dictionary))
                    }
                    
                    self.window = UIWindow(frame: UIScreen.main.bounds)
                    self.window?.makeKeyAndVisible()
                    
                    // adding default root view controller
                    let rootViewController = UIViewController()
                    rootViewController.view.backgroundColor = UIColor.clear
                    
                    let dayListViewModel = DayListViewModel(dayList: dayList)
                    let dayListViewController: DayListViewController = DayListViewController.create(viewModel: dayListViewModel, style: DayListStyle())
                    
                    let jobListViewModel = JobsListViewModel(jobList: dayList.count > 0 ? dayList[0].jobList : [])
                    let jobListViewController: JobsListViewController = JobsListViewController.create(viewModel: jobListViewModel, style: JobListStyle())
                    jobListViewController.dayListComponent = dayListViewController
                    
                    dayListViewModel.didSelectDay.observeNext { jobs in
                        jobListViewModel.updatedJobList(jobList: jobs)
                    }.dispose(in: dayListViewModel.disposeBag)
                    
                    window?.rootViewController = jobListViewController
                
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        
        
        
        return true
    }
}

