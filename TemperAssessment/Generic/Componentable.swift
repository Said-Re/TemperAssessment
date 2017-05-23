//
//  Componentable.swift
//  TemperAssessment
//
//  Created by Said Rehouni on 5/21/17.
//  Copyright © 2017 Said Rehouni. All rights reserved.
//

import UIKit

public protocol Componentable {
    
    associatedtype GenericViewModel
    associatedtype GenericStyle
    
    static var storyboardName: String! { get }
    
    var viewModel: GenericViewModel { get set }
    var style: GenericStyle { get set }
}

public protocol ViewModelType {}
public protocol StyleType {}

extension Componentable {
    
    public static func create<GenericVC: Componentable>(viewModel: GenericViewModel, style: GenericStyle) -> GenericVC where GenericVC: UIViewController, GenericViewModel == GenericVC.GenericViewModel, GenericStyle == GenericVC.GenericStyle {
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: GenericVC.self))
        
        if var viewController = storyboard.instantiateInitialViewController() as? GenericVC {
            
            viewController.style = style
            viewController.viewModel = viewModel
            
            return viewController as GenericVC // we know for sure that viewController conforms to GenericViewController
        }
        else {
            fatalError("Could not create \(String(describing: GenericVC.self))")
        }
    }
}
