//
//  DayListViewController.swift
//  TemperAssessment
//
//  Created by Said Rehouni on 5/23/17.
//  Copyright © 2017 Said Rehouni. All rights reserved.
//

import UIKit

private let reuseIdentifier = "DayListCell"

open class DayListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, Componentable {
    
    open static var storyboardName: String! { return "DayList" }
    
    open var viewModel: DayListViewModel!
    open var style: DayListStyle!
    
    private var collectionView: UICollectionView!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 90, height: 40)
        layout.scrollDirection = .horizontal
        
        let collectionViewFrame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 60)

        layout.headerReferenceSize = CGSize(width: 80, height: 60)
        
        collectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        self.collectionView.register(DayListCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        view.addSubview(collectionView)
        
        collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.top)
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
        let cell: DayListCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DayListCell
        
        cell.viewModel = viewModel.viewModelForCell(indexPath)
        cell.style = style.dayListCellStyle
        if viewModel.selectedIndex == nil {
            cell.isSelected = true
            viewModel.selectedIndex = indexPath
        }
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItemAt(indexPath: indexPath)
    }
}
