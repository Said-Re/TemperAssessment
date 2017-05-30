//
//  DayListCellCollectionViewCell.swift
//  TemperAssessment
//
//  Created by Said Rehouni on 5/23/17.
//  Copyright © 2017 Said Rehouni. All rights reserved.
//

import UIKit

class DayListCell: UICollectionViewCell {
    
    private var dayLabel: UILabel = UILabel()
    
    open var viewModel: DayListCellViewModelProtocol? {
        didSet {
            if let viewModel = viewModel {
                dayLabel.text = viewModel.day
            }
        }
    }
    
    open var style: DayListCellStyle? {
        didSet {
            if let style = style {
                dayLabel.textColor = style.dayLabelTextColor
                dayLabel.font = style.dayLabelLabelFont
                
                backgroundColor = style.cellBackground
            }
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(dayLabel)
        
        setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func updateConstraints() {
        dayLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(snp.centerY)
            make.centerX.equalTo(snp.centerX)
        }
        
        super.updateConstraints()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .blue
        
        layer.masksToBounds = true
        self.layer.cornerRadius = 20
    }
    
    override open func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
