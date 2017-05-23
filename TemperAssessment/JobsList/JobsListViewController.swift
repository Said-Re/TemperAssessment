//
//  JobsListViewController.swift
//  TemperAssessment
//
//  Created by Said Rehouni on 5/21/17.
//  Copyright © 2017 Said Rehouni. All rights reserved.
//

import UIKit
import SnapKit

private let reuseIdentifier = "JobsListCell"

open class JobsListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, Componentable {
    
    open static var storyboardName: String! { return "JobsList"}

    open var viewModel: JobsListViewModelProtocol!
    open var style: JobListStyle!
    
    open var dayListComponent: DayListViewController!
    
    private var collectionView: UICollectionView!

    open override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(
            width: view.bounds.width - 40,
            height: (view.bounds.width - 40) * 0.8
        )
        
        let collectionViewFrame = CGRect(
            x: 0,
            y: 300,
            width: view.bounds.width,
            height: view.bounds.height - 300
        )
 
        collectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        collectionView.register(JobsListCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        view.addSubview(collectionView)
        
        addChildViewController(dayListComponent)
        view.addSubview(dayListComponent.view)
        
        dayListComponent.view.frame = CGRect(
            x: 0,
            y: 230,
            width: view.bounds.width,
            height: 60
        )
        
        viewModel.didUpdateContent.observeNext { [weak self]  in
            self?.collectionView.reloadData()
            self?.collectionView.scrollToItem(
                at: IndexPath(item: 0, section: 0),
                at: UICollectionViewScrollPosition.top,
                animated: true
            )
        }.dispose(in: viewModel.disposeBag)
    }

    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UICollectionViewDataSource

    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections()
    }

    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section)
    }

    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! JobsListCell
        
        cell.viewModel = viewModel.viewModelForCell(indexPath)
    
        // Configure the cell
    
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
