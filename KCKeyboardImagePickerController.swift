//
//  ImagePickerController.swift
//  NMG.CRM
//
//  Created by Soyombo bat-erdene on 6/21/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import MobileCoreServices
import Photos

class KCKeyboardImagePickerAction {
    var tag: Int = 0
    var title = ""
    var forceTouchEnabled = false
    var handler: ((_ selectedImage: UIImage?) -> Void)?
    
   
    
    convenience init(imagePickerControllerButtonHandler handler: @escaping (_ selectedImage: UIImage?) -> Void) {
        self.init()
        let action = KCKeyboardImagePickerAction()
        action.tag = -NSIntegerMax - 1
        action.handler = handler
        
    }
    
    convenience init(optionButtonTag tag: Int, title: String?, forceTouchEnabled enabled: Bool, handler: @escaping (_ selectedImage: UIImage?) -> Void) {
        self.init()
        let action = KCKeyboardImagePickerAction()
        action.tag = tag
        action.title = title ?? ""
        action.forceTouchEnabled = enabled
        action.handler = handler
       
    }
}

class KCKeyboardImagePickerStyle {
    var tag: Int = 0
    var image: UIImage?
    var titleColor: UIColor?
    var backgroundColor: UIColor?
    
    convenience init(imagePickerControllerButtonBackgroundColor color: UIColor?, image: UIImage?) {
        self.init()
        let style = KCKeyboardImagePickerStyle()
        style.tag = -NSIntegerMax - 1
        style.image = image
        style.backgroundColor = color
      
    }
    
    convenience init(optionButtonTag tag: Int, titleColor: UIColor?, backgroundColor: UIColor?) {
        self.init()
        let style = KCKeyboardImagePickerStyle()
        style.tag = tag
        style.titleColor = titleColor
        style.backgroundColor = backgroundColor
     
    }
}

class KCKeyboardImagePickerController: NSObject , KCKeyboardImagePickerViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate ,UIViewControllerPreviewingDelegate{
    func didTapImagePickerControllerButton(in keyboardImagePickerView: KCKeyboardImagePickerView?) {
        
    }
    

    

    weak var parentViewController: UIViewController?
    var previewingDelegateRegistered = false
    var handlers = [ (UIImage?)->Void ]()
  
    var images = [UIImage]()
    var titles = [String]()
    var forceTouchEnabledFlags = [Bool]()
    var titleColors = [UIColor]()
    var backgroundColors = [UIColor]()
    var optionButtonIndices = [Int]()
    var photoLibraryFetchOptions: PHFetchOptions?
    var photoLibraryFetchResult: PHFetchResult<AnyObject>?
    var placeHolderImage: UIImage?
    var photoLibraryAuthorizationNeededView: UIView?
    var imagePickerView = KCKeyboardImagePickerView()
    var keyboardFrame = CGRect.zero
    private(set) var keyboardFrameReady = false
    var forceTouchPreviewEnabled = false
    
    init(parentViewController: UIViewController?) {
        
    super.init()
        self.parentViewController = parentViewController
        keyboardFrame = CGRect(x: UIScreen.main.applicationFrame.origin.x, y: UIScreen.main.applicationFrame.maxY - 258.0, width: UIScreen.main.applicationFrame.size.width, height: UIScreen.main.applicationFrame.size.height)
        keyboardFrameReady = false
   
        self.previewingDelegateRegistered = false
        self.photoLibraryFetchOptions = PHFetchOptions()
        self.photoLibraryFetchOptions?.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        self.photoLibraryFetchResult = (PHAsset.fetchAssets(with: photoLibraryFetchOptions) as! PHFetchResult<AnyObject>)
        self.placeHolderImage = UIImage(named: "PlaceHolderImage")
//        self.imagePickerView = KCKeyboardImagePickerView.init()
        self.imagePickerView.dataSource = self
        self.imagePickerView.delegate = self
//        self.imagePickerView = KCKeyboardImagePickerView
        
        
        titles = [String]()
        forceTouchEnabledFlags = [Bool]()
        handlers = [(UIImage?)->Void ]()
        images = [UIImage]()
        titleColors = [UIColor]()
        backgroundColors = [UIColor]()
        optionButtonIndices = [Int]()
        NotificationCenter.default.addObserver(self, selector: #selector(self.statusBarFrameWillChange(_:)), name: .UIApplicationWillChangeStatusBarFrame, object: nil)
        
}
    
    func setForceTouchPreviewEnabled(_ enabled: Bool) {
        forceTouchPreviewEnabled = enabled
        if forceTouchPreviewEnabled == true && previewingDelegateRegistered == false {
            if self.parentViewController?.traitCollection.forceTouchCapability == .available {
                self.parentViewController?.registerForPreviewing(with:self, sourceView: self.imagePickerView)
            }
        }
    }


    func setKeyboardFrame(_ keyboardFrame: CGRect) {
        self.keyboardFrame = keyboardFrame
        keyboardFrameReady = true
    }
    
    func addAction(_ action: KCKeyboardImagePickerAction) {
       
        if action.tag != 0 {
            titles.append(action.title)
            self.forceTouchEnabledFlags.append(action.forceTouchEnabled)
            self.optionButtonIndices.append(action.tag)
            
        }
        self.handlers.append(action.handler!)
      
    }
    
    func add(_ style: KCKeyboardImagePickerStyle?) {
       
        if style?.tag != 0 {
//            titleColors[(style?.tag)!] = (style?.titleColor)!
            titleColors.append((style?.titleColor)!)
        } else {
//            images[(style?.tag)!] = (style?.image)!
            images.append((style?.image)!)
        }
//        backgroundColors[(style?.tag)!] = (style?.backgroundColor)!
        backgroundColors.append((style?.backgroundColor)!)
    }

    func showKeyboardImagePickerView(animated: Bool) {
        if PHPhotoLibrary.authorizationStatus() == .notDetermined {
            PHPhotoLibrary.requestAuthorization({ status in
                if status == .authorized {
                    DispatchQueue.main.async(execute: {
                        self.showKeyboardImagePickerView(animated: true)
                    })
                } else {
                    DispatchQueue.main.async(execute: {
                        self.showPhotoLibraryAuthorizationNeededView()
                    })
                }
            })
        }
        if PHPhotoLibrary.authorizationStatus() == .authorized {
            photoLibraryFetchResult = PHAsset.fetchAssets(with: photoLibraryFetchOptions) as? PHFetchResult<AnyObject>
            let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
            let imagePickerViewInitialFrame = CGRect(x: (imagePickerView.frame.origin.x), y: (imagePickerView.frame.origin.y) + (imagePickerView.frame.size.height), width: (imagePickerView.frame.size.width), height: 0)
            imagePickerView.isHidden = false
            imagePickerView.frame = imagePickerViewInitialFrame
            keyboardFrame = CGRect(x: keyboardFrame.origin.x, y: keyboardFrame.origin.y - (statusBarHeight - 20.0), width: keyboardFrame.size.width, height: keyboardFrame.size.height)
            if animated {
                UIView.animate(withDuration: 0.25, animations: {
                    self.imagePickerView.frame = self.keyboardFrame
                })
            } else {
                imagePickerView.frame = keyboardFrame
            }
        }
        if PHPhotoLibrary.authorizationStatus() == .denied {
            showPhotoLibraryAuthorizationNeededView()
        }
    }
    
    func hideKeyboardImagePickerView(animated: Bool) {
        var imagePickerViewFrame: CGRect = imagePickerView.frame
        imagePickerViewFrame.origin.y = imagePickerViewFrame.origin.y + imagePickerViewFrame.size.height
        if animated {
            UIView.animate(withDuration: 0.25, animations: {
                self.imagePickerView.frame = imagePickerViewFrame
            }) { finished in
                if finished {
                    self.imagePickerView.isHidden = true
                }
            }
        } else {
            imagePickerView.frame = imagePickerViewFrame
            imagePickerView.isHidden = true
        }
    }
    

    func showPhotoLibraryAuthorizationNeededView() {
        imagePickerView.frame = keyboardFrame
        photoLibraryAuthorizationNeededView = UIView(frame: (imagePickerView.bounds))
        photoLibraryAuthorizationNeededView?.backgroundColor = UIColor.clear
        let authorizationNeededLabel = UILabel(frame: CGRect(x: (photoLibraryAuthorizationNeededView?.bounds.origin.x)!, y: (photoLibraryAuthorizationNeededView?.bounds.origin.y)! + 0.3 * (photoLibraryAuthorizationNeededView?.bounds.size.height)!, width: (photoLibraryAuthorizationNeededView?.bounds.size.width)!, height: 50))
        authorizationNeededLabel.textAlignment = .center
        authorizationNeededLabel.textColor = UIColor.lightGray
        authorizationNeededLabel.text = "Please grant access to your photos."
        photoLibraryAuthorizationNeededView?.addSubview(authorizationNeededLabel)
        imagePickerView.addSubview(photoLibraryAuthorizationNeededView!)
        imagePickerView.bringSubview(toFront: photoLibraryAuthorizationNeededView!)
    }
    
    func fetchImageForPreviewInBackground(at index: Int, handler: @escaping (_ image: UIImage?) -> Void) {
        let imageRequestOptions = PHImageRequestOptions()
        imageRequestOptions.resizeMode = .exact
        //    [imageRequestOptions setDeliveryMode:PHImageRequestOptionsDeliveryModeFastFormat];
        imageRequestOptions.isNetworkAccessAllowed = true
        imageRequestOptions.isSynchronous = true
        print("\(#function)")
        let currentAsset = photoLibraryFetchResult![index] as? PHAsset
        if let anAsset = currentAsset {
            PHImageManager.default().requestImage(for: anAsset, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFit, options: nil, resultHandler: { result, info in
                let degraded = info![PHImageResultIsDegradedKey] as! NSNumber
                if degraded != nil && degraded.intValue == 0 {
                    handler(result)
                }
            })
        }
    }
    
    @objc func statusBarFrameWillChange(_ notification: Notification?) {
        let statusBarNewHeight: CGFloat? = (notification?.userInfo?[UIApplicationStatusBarFrameUserInfoKey] as AnyObject).cgRectValue.size.height
        let statusBarCurrentHeight: CGFloat = statusBarNewHeight == 20.0 ? 40.0 : 20.0
        var imagePickerViewNewFrame: CGRect = imagePickerView.frame
        imagePickerViewNewFrame.origin.y = imagePickerViewNewFrame.origin.y - ((statusBarNewHeight ?? 0.0) - statusBarCurrentHeight)
        UIView.animate(withDuration: 0.35, animations: {
            self.imagePickerView.frame = imagePickerViewNewFrame
        })
    }


    func numberOfImages(in keyboardImagePickerView: KCKeyboardImagePickerView?) -> Int {
        return (photoLibraryFetchResult?.count)!
    }
    

    func keyboardImagePickerView(_ keyboardImagePickerView: KCKeyboardImagePickerView?, imageAt index: Int) -> UIImage? {
        return placeHolderImage
    }
    
    func isImagePickerControllerButtonVisible(in keyboardImagePickerView: KCKeyboardImagePickerView?) -> Bool {
//        return handlers[(-NSIntegerMax - 1)] != nil
        return handlers[0] != nil
    }
    

    func backgroundColorForImagePickerControllerButton(in keyboardImagePickerView: KCKeyboardImagePickerView?) -> UIColor? {
        return backgroundColors[0]
    }
    

    
    func backgroundImageForImagePickerControllerButton(in keyboardImagePickerView: KCKeyboardImagePickerView?) -> UIImage? {
        return images[0]
    }
    

    func keyboardImagePickerView(_ keyboardImagePickerView: KCKeyboardImagePickerView?, titleForOptionButtonAt index: Int) -> String? {
        let optionButtonTagNumber = optionButtonIndices[index]
        return titles[index]
    }
    

    
    func keyboardImagePickerView(_ keyboardImagePickerView: KCKeyboardImagePickerView?, backgroundColorForOptionButtonAt index: Int, for state: UIControlState) -> UIColor? {
                let optionButtonTagNumber = optionButtonIndices[index]
                let backgroundColorNormal = backgroundColors[optionButtonTagNumber]
                let backgroundColorHighlighted = backgroundColors[optionButtonTagNumber]
                // TODO: highlight it
                switch state {
                case .normal:
                    return backgroundColorNormal == nil ? UIColor(red: 0, green: 0, blue: 0, alpha: 0.2) : backgroundColorNormal
                case .highlighted:
                    return backgroundColorHighlighted == nil ? UIColor(red: 1, green: 1, blue: 1, alpha: 0.5) : backgroundColorHighlighted
                default:
                    return nil
                }
    }
    
 
    
    func keyboardImagePickerView(_ keyboardImagePickerView: KCKeyboardImagePickerView?, titleColorForOptionButtonAt index: Int, for state: UIControlState) -> UIColor? {
        let optionButtonTagNumber = optionButtonIndices[index]
        let titleColorNormal = titleColors[optionButtonTagNumber]
        let titleColorHighlighted = titleColors[optionButtonTagNumber]
        // TODO: highlight it
        switch state {
        case .normal:
            return titleColorNormal == nil ? UIColor.white : titleColorNormal
        case .highlighted:
            return titleColorHighlighted == nil ? UIColor.lightGray : titleColorHighlighted
        default:
            return nil
        }
    }
    


    
    func keyboardImagePickerView(_ keyboardImagePickerView: KCKeyboardImagePickerView?, didTapOptionButton optionButton: UIButton?, at index: Int) {
        let currentAsset = photoLibraryFetchResult![index] as? PHAsset
        if let anAsset = currentAsset {
            PHImageManager.default().requestImage(for: anAsset, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFit, options: nil, resultHandler: { result, info in
                
                let degraded = info![PHImageResultIsDegradedKey] as? NSNumber
                if degraded != nil && (degraded?.intValue)! == 0 {
                    let handler: ((_ selectedImage: UIImage?)->Void)? = self.handlers[index]
                    if handler != nil {
                        handler!(result)
                    }
                    
                }
                
            })
        }
    }
    
    
    func keyboardImagePickerView(_ keyboardImagePickerView: KCKeyboardImagePickerView?, didSelectItemAt index: Int) {
        
    }
    
    func keyboardImagePickerView(_ keyboardImagePickerView: KCKeyboardImagePickerView?, didDeselectItemAt index: Int) {
        
    }
    
    func keyboardImagePickerView(_ keyboardImagePickerView: KCKeyboardImagePickerView?, willShowImageAt index: Int) {
        let targetSize = CGSize(width: (imagePickerView.frame.size.height) * UIScreen.main.scale, height: (imagePickerView.frame.size.height) * UIScreen.main.scale)
        let imageRequestOptions = PHImageRequestOptions()
        imageRequestOptions.resizeMode = .fast
        imageRequestOptions.isSynchronous = true
        let currentAsset = photoLibraryFetchResult![index] as? PHAsset
        if let anAsset = currentAsset {
            
            let manager = PHImageManager.default()
            manager.requestImage(for: anAsset, targetSize: targetSize, contentMode: .aspectFit, options: imageRequestOptions) { (image, info) in
                let degraded = info![PHImageResultIsDegradedKey] as? NSNumber
                if degraded != nil && (degraded?.intValue)! == 0 {

                    keyboardImagePickerView?.update(image, at: index, animated: true)
                }
            }
        }
    }

    
   

    
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerEditedImage] as? UIImage
        picker.dismiss(animated: true)
        let handler: ((_ selectedImage: UIImage?) -> Void)? = handlers[(-NSIntegerMax - 1)]
        if handler != nil {
            handler!(selectedImage)
        }
    }

    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let previewingImageIndex: Int = imagePickerView.imageIndex(at: location)
        let previewViewController = KCKeyboardImagePickerPreviewViewController()
        for currentActionIndex in optionButtonIndices {
            let currentActionTag = optionButtonIndices[currentActionIndex]
            if (forceTouchEnabledFlags[currentActionIndex] == true) {
                let currentPreviewAction = UIPreviewAction(title: titles[currentActionTag],  style: .default, handler: { action, previewViewController in
                    self.fetchImageForPreviewInBackground(at: previewingImageIndex, handler: { image in
                        let handler: ((_ selectedImage: UIImage?) -> Void)? = self.handlers[currentActionTag]
                        handler!(image)
                    })
                })
                previewViewController.add(currentPreviewAction)
            }
        }
        fetchImageForPreviewInBackground(at: previewingImageIndex, handler: { image in
            (previewViewController as? KCKeyboardImagePickerPreviewViewController)?.update(image)
        })
        return previewViewController
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        // do nothing
    }

}

extension KCKeyboardImagePickerController: KCKeyboardImagePickerViewDataSource {
    func numberOfOptionButtons(in keyboardImagePickerView: KCKeyboardImagePickerView?) -> Int {
     
        return optionButtonIndices.count
    }
}
