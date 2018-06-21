//
//  KCKeyboardImagePickerPreviewViewController.swift
//  NMG.CRM
//
//  Created by Soyombo bat-erdene on 6/21/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit

class KCKeyboardImagePickerPreviewViewController: UIViewController {

    var imageView: UIImageView?
    var previewActions = [AnyHashable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView()
        imageView?.alpha = 0.0
        imageView?.contentMode = .scaleAspectFit
        if let aView = imageView {
            view.addSubview(aView)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imageView?.frame = view.bounds
        view.backgroundColor = UIColor(red: 170.0 / 255.0, green: 170.0 / 255.0, blue: 170.0 / 255.0, alpha: 0.5)
        view.alpha = 0.7
    }
    
    func add(_ previewAction: UIPreviewAction?) {
        if previewActions == nil {
            previewActions = [AnyHashable]()
        }
        if let anAction = previewAction {
            previewActions.append(anAction)
        }
    }
    
    func previewActionItems() -> [UIPreviewActionItem?]? {
        return previewActions as? [UIPreviewActionItem?]
    }
    
    func update(_ image: UIImage?) {
        imageView?.image = image
        UIView.animate(withDuration: 0.25, animations: {
            self.imageView?.alpha = 1.0
        })
    }

}
