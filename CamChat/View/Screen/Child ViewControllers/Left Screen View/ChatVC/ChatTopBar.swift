//
//  ChatBackgroundView.swift
//  CamChat
//
//  Created by Patrick Hanna on 7/29/18.
//  Copyright © 2018 Patrick Hanna. All rights reserved.
//

import HelpKit


class ChatTopBar: HKView{
    
    private let size: CGSize
    private let user: User
    
    private var userObserver: HKManagedObjectObserver!
    init(size: CGSize, user: User){
        self.size = size
        self.user = user
        super.init(frame: CGRect.zero)
        self.topLabel.text = user.fullName
        
        userObserver = user.observe {[weak self] (change) in
            guard let self = self else {return}
            if change == .update{
                self.topLabel.text = self.user.fullName
            }
        }
    }
    
    
    
    override var intrinsicContentSize: CGSize{
        return size
    }
    
    override func setUpView() {
        topLabel.pin(addTo: self, anchors: [.centerX: centerXAnchor, .centerY: centerYAnchor])
        topBarRightIcon.pin(addTo: self, anchors: [.right: rightAnchor, .centerY: centerYAnchor], constants: [.right: 10])
    }
    
    
    lazy var topLabel: UILabel = {
        let x = UILabel()
        x.font = CCFonts.getFont(type: .medium, size: 20)
        x.text = "Patrick"
        x.textColor = .white
        return x
    }()
    
    lazy var topBarRightIcon: BouncyImageButton = {
        let x = BouncyImageButton(image: AssetImages.arrowChevron)
        x.pin(constants: [.height: 20, .width: 20])
        
        return x
    }()
    
 
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}







