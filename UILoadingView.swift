//
//  UILoadingView.swift
//
//  Created by Ian McDowell on 6/6/14.
//  Copyright (c) 2014 Ian McDowell. All rights reserved.
//
import UIKit

class UILoadingView : UIView {
    
    init(frame rect: CGRect, text: NSString = "Loading...") {
        super.init(frame: rect)
        self.backgroundColor = UIColor.whiteColor()
        self.label.text = text
        self.label.textColor = self.spinner.color
        self.spinner.startAnimating()
        
        self.addSubview(self.label)
        self.addSubview(self.spinner)
        
        self.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight;
        
        self.setNeedsLayout()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var label : UILabel = {
        var l = UILabel()
        l.font = UIFont.systemFontOfSize(UIFont.systemFontSize())
        return l
    }()
    var spinner: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
    
    override func layoutSubviews() {
        var labelString:NSString = self.label.text!
		var labelSize: CGSize = labelString.sizeWithAttributes([NSFontAttributeName: self.label.font])
        var labelFrame: CGRect = CGRect()
        labelFrame.size = labelSize
        self.label.frame = labelFrame
        
        // center label and spinner
        self.label.center = self.center
        self.spinner.center = self.center
        
        // horizontally align
        labelFrame = self.label.frame
        var spinnerFrame: CGRect = self.spinner.frame
        var totalWidth: CGFloat = spinnerFrame.size.width + 5 + labelSize.width
        spinnerFrame.origin.x = self.bounds.origin.x + (self.bounds.size.width - totalWidth) / 2
        labelFrame.origin.x = spinnerFrame.origin.x + spinnerFrame.size.width + 5
        self.label.frame = labelFrame
        self.spinner.frame = spinnerFrame
    }

}
