//
//  RatingBadge.swift
//  BeResp
//
//  Created by Paul Lavoine on 04/03/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

class FlagBadge: UIView {
    
    @IBOutlet weak var ratingContainerView: UIView!
    @IBOutlet weak var ratingRoundedView: UIView!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("FlagBadge", owner: self, options: nil)
        self.addSubview(ratingContainerView)
        self.backgroundColor = .clear
        ratingContainerView.frame = self.bounds
        ratingContainerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        ratingContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint(item: ratingContainerView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: ratingContainerView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: ratingContainerView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: ratingContainerView, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 0)
        self.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ratingRoundedView.layer.cornerRadius = 8.0
        
        let ratingShadowPath = UIBezierPath(rect: ratingRoundedView.bounds)
        ratingRoundedView.layer.masksToBounds = false
        ratingRoundedView.layer.shadowColor = UIColor.black.cgColor
        ratingRoundedView.layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
        ratingRoundedView.layer.shadowRadius = 6.0
        ratingRoundedView.layer.shadowOpacity = 0.3
        ratingRoundedView.layer.shadowPath = ratingShadowPath.cgPath
    }
    
    func configure(with text: String) {
        ratingLabel.text = text
    }
    
}
