//
//  JobsListCell.swift
//  TemperAssessment
//
//  Created by Said Rehouni on 5/22/17.
//  Copyright © 2017 Said Rehouni. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit, size: CGSize) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                
                let hasAlpha = false
                let scale: CGFloat = 0.0
                
                UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
                image.draw(in: CGRect(origin: CGPoint.zero, size: size))
                
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                self.image = scaledImage
            }
        }.resume()
    }
}

open class JobsListCell: UICollectionViewCell {
    
    private var imageView: UIImageView = UIImageView()
    private var nameCompanyLabel: UILabel = UILabel()
    private var descriptionJobLabel: UILabel = UILabel()
    private var startDateLabel: UILabel = UILabel()
    private var distanceLabel: UILabel = UILabel()
    private var ratingLabel: UILabel = UILabel()
    private var ratingView: UIImageView = UIImageView()
    private var newMatchesCountLabel: UILabel = UILabel()
    private var durationLabel: UILabel = UILabel()
    
    
    open var viewModel: JobsListCellViewModelProtocol? {
        didSet {
            if let viewModel = viewModel {
                if let url = URL(string: viewModel.imageUrl) {
                    
                    imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height - 80)
                    imageView.downloadedFrom(url: url, size: CGSize(width: frame.width, height: frame.height - 80))
                }
                distanceLabel.text = viewModel.distance
                nameCompanyLabel.text = viewModel.nameCompany
                ratingLabel.text = viewModel.rating
                descriptionJobLabel.text = viewModel.shifts
                newMatchesCountLabel.text = viewModel.newMatchesCount
                durationLabel.text = viewModel.duration
            }
        }
    }
        
    open var style: JobsListCellStyle? {
        didSet {
            if let style = style {
                
                distanceLabel.textColor = style.distanceLabelTextColor
                distanceLabel.font = style.distanceLabelFont
                
                nameCompanyLabel.textColor = style.nameCompanyLabelTextColor
                nameCompanyLabel.font = style.nameCompanyLabelFont
                
                ratingLabel.textColor = style.ratingLabelTextColor
                ratingLabel.font = style.ratingLabelFont
                
                descriptionJobLabel.textColor = style.descriptionJobLabelTextColor
                descriptionJobLabel.font = style.descriptionJobLabelFont
                descriptionJobLabel.alpha = 0.7
                
                newMatchesCountLabel.textColor = style.newMatchesCountLabelTextColor
                newMatchesCountLabel.font = style.newMatchesCountLabelFont
                
                durationLabel.textColor = style.durationLabelTextColor
                durationLabel.font = style.durationLabelFont
            }
        }
    
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(distanceLabel)
        addSubview(nameCompanyLabel)
        addSubview(ratingLabel)
        addSubview(descriptionJobLabel)
        addSubview(newMatchesCountLabel)
        addSubview(durationLabel)
        backgroundColor = .white
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        
        self.setNeedsUpdateConstraints()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func updateConstraints() {
        
        imageView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom).offset(-80)
        }
        
        distanceLabel.snp.makeConstraints  { (make) in
            
            make.leading.equalTo(self.snp.leading).offset(15)
            make.bottom.equalTo(self.snp.bottom).offset(-90)
        }
        
        nameCompanyLabel.snp.makeConstraints  { (make) in
            make.width.equalTo(250)
            make.leading.equalTo(self.snp.leading).offset(15)
            make.bottom.equalTo(self.snp.bottom).offset(-50)
        }
        
        ratingLabel.snp.makeConstraints  { (make) in
            
            make.trailing.equalTo(self.snp.trailing).offset(-15)
            make.bottom.equalTo(self.snp.bottom).offset(-50)
        }
        
        descriptionJobLabel.snp.makeConstraints { (make) in
            
            make.leading.equalTo(self.snp.leading).offset(15)
            make.bottom.equalTo(self.snp.bottom).offset(-30)
        }
        
        newMatchesCountLabel.snp.makeConstraints { (make) in
            
            make.leading.equalTo(self.snp.leading).offset(15)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }
        
        durationLabel.snp.makeConstraints { (make) in
            
            make.trailing.equalTo(self.snp.trailing).offset(-15)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }
        
        super.updateConstraints()
    }
    
    override open func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
