//
//  JobsListCell.swift
//  TemperAssessment
//
//  Created by Said Rehouni on 5/22/17.
//  Copyright © 2017 Said Rehouni. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
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
    private var shiftsLabel: UILabel = UILabel()
    private var newMatchesCountLabel: UILabel = UILabel()
    private var durationLabel: UILabel = UILabel()
    
    
    open var viewModel: JobsListCellViewModelProtocol? {
        didSet {
            if let viewModel = viewModel {
                if let url = URL(string: viewModel.imageUrl) {
                    imageView.contentMode = UIViewContentMode.scaleToFill
                    imageView.downloadedFrom(url: url)
                }
            }
        }
    }
        
    open var style: JobsListCellStyle? {
        didSet {
            if let style = style {
            
            }
        }
    
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
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
            make.bottom.equalTo(self.snp.bottom).offset(-30)
        }
        
        super.updateConstraints()
    }
    
    override open func prepareForReuse() {
        super.prepareForReuse()
    }
        
}


