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
    
    private var titleLabel: UILabel = UILabel()
    private var alwaysLabel: UILabel = UILabel()
    private var shiftsNearLabel: UILabel = UILabel()
    private var openPositionsLabel: UILabel = UILabel()

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
            y: 0,
            width: view.bounds.width,
            height: view.bounds.height
        )
        layout.headerReferenceSize = CGSize(width: view.bounds.width, height: 300)
        
        collectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        collectionView.register(JobsListCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        view.addSubview(collectionView)
        
        addChildViewController(dayListComponent)
        collectionView.addSubview(dayListComponent.view)
        
        dayListComponent.view.frame = CGRect(
            x: 0,
            y: 230,
            width: view.bounds.width,
            height: 60
        )
        
        setUpLabels()
        applyStyles()
        applyUIConstraints()
        
        viewModel.didUpdateContent.observeNext { [weak self]  in
            self?.collectionView.reloadData()
            self?.collectionView.contentOffset = CGPoint.zero
            
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.openPositionsLabel.text = "\(strongSelf.viewModel.numberOfShifts())" + " shifts in " + "\(strongSelf.viewModel.numberOfItemsInSection(0))" + " binnen alle afstanden"
            
        }.dispose(in: viewModel.disposeBag)
    }

    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    open func setUpLabels() {
        titleLabel.text = "Werken met plezier."
        alwaysLabel.text = "Altijd."
        shiftsNearLabel.text = "Shifts bij jou in de buurt"
        openPositionsLabel.text = "\(viewModel.numberOfShifts())" + " shifts in " + "\(viewModel.numberOfItemsInSection(0))" + " binnen alle afstanden"
        
        collectionView.addSubview(titleLabel)
        collectionView.addSubview(alwaysLabel)
        collectionView.addSubview(shiftsNearLabel)
        collectionView.addSubview(openPositionsLabel)
    }
    
    open func applyStyles() {
        
        titleLabel.textColor = style.titleLabelTextColor
        titleLabel.font = style.titleLabelFont
        
        alwaysLabel.textColor = style.alwaysLabelTextColor
        alwaysLabel.font = style.alwaysLabelFont
        
        shiftsNearLabel.textColor = style.shiftsNearLabelTextColor
        shiftsNearLabel.font = style.shiftsNearLabelFont
        
        openPositionsLabel.textColor = style.openPositionsLabelTextColor
        openPositionsLabel.font = style.openPositionsLabelFont
    }
    
    open func applyUIConstraints() {
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.collectionView.snp.top).offset(65)
            make.leading.equalTo(self.collectionView.snp.leading).offset(20)
        }
        
        alwaysLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.top).offset(35)
            make.leading.equalTo(self.collectionView.snp.leading).offset(20)
        }
        
        shiftsNearLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.alwaysLabel.snp.top).offset(65)
            make.leading.equalTo(self.collectionView.snp.leading).offset(20)
        }
        
        openPositionsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.shiftsNearLabel.snp.top).offset(35)
            make.leading.equalTo(self.collectionView.snp.leading).offset(20)
        }
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
        cell.style = style.jobListCellStyle
    
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
