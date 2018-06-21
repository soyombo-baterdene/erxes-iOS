//
//  KCKeyboardImagePickerView.swift
//  NMG.CRM
//
//  Created by Soyombo bat-erdene on 6/21/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit

//protocol ChannelDelegate: class  {
//    func getSelectedChannelData(options:FilterOptions)
//}

protocol KCKeyboardImagePickerViewDataSource: NSObjectProtocol{
    func isImagePickerControllerButtonVisible(in keyboardImagePickerView: KCKeyboardImagePickerView?) -> Bool
    func backgroundColorForImagePickerControllerButton(in keyboardImagePickerView: KCKeyboardImagePickerView?) -> UIColor?
    func backgroundImageForImagePickerControllerButton(in keyboardImagePickerView: KCKeyboardImagePickerView?) -> UIImage?
    func numberOfOptionButtons(in keyboardImagePickerView: KCKeyboardImagePickerView?) -> Int
    func keyboardImagePickerView(_ keyboardImagePickerView: KCKeyboardImagePickerView?, titleForOptionButtonAt index: Int) -> String?
    func keyboardImagePickerView(_ keyboardImagePickerView: KCKeyboardImagePickerView?, titleColorForOptionButtonAt index: Int, for state: UIControlState) -> UIColor?
    func keyboardImagePickerView(_ keyboardImagePickerView: KCKeyboardImagePickerView?, backgroundColorForOptionButtonAt index: Int, for state: UIControlState) -> UIColor?
    func numberOfImages(in keyboardImagePickerView: KCKeyboardImagePickerView?) -> Int
    func keyboardImagePickerView(_ keyboardImagePickerView: KCKeyboardImagePickerView?, imageAt index: Int) -> UIImage?
}

protocol KCKeyboardImagePickerViewDelegate: NSObjectProtocol{
    
    func keyboardImagePickerView(_ keyboardImagePickerView: KCKeyboardImagePickerView?, didTapOptionButton optionButton: UIButton?, at index: Int)
    
    func keyboardImagePickerView(_ keyboardImagePickerView: KCKeyboardImagePickerView?, didSelectItemAt index: Int)
    
    func keyboardImagePickerView(_ keyboardImagePickerView: KCKeyboardImagePickerView?, didDeselectItemAt index: Int)
    
    func keyboardImagePickerView(_ keyboardImagePickerView: KCKeyboardImagePickerView?, willShowImageAt index: Int)
    
    func didTapImagePickerControllerButton(in keyboardImagePickerView: KCKeyboardImagePickerView?)
    
}

class KCKeyboardImagePickerView: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate{

    let kKCKeyboardImagePickerViewCellOptionButtonRadius: CGFloat = 60.0
    let kKCKeyboardImagePickerViewCellOptionButtonBorderWidth: CGFloat = 2.0

    weak var delegate: KCKeyboardImagePickerViewDelegate?
    weak var dataSource: KCKeyboardImagePickerViewDataSource?
    
    var imagesCollectionView: UICollectionView?
    var imagePickerControllerButton: UIButton?
    var optionButtonsView: UIView?
    var blurVisualEffectView: UIVisualEffectView?
    var optionButtons = [UIButton]()
    var isLoadingImages = false
    var currentSelectedIndexPath: IndexPath?
    
    init() {
       
        let initialFrame = CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: 0)
        super.init(frame: initialFrame)
        
        clipsToBounds = true
        backgroundColor = UIColor.green
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 3
        imagesCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        imagesCollectionView?.delegate = self
        imagesCollectionView?.dataSource = self
        imagesCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        imagesCollectionView?.allowsMultipleSelection = false
        imagesCollectionView?.allowsSelection = true
        imagesCollectionView?.showsHorizontalScrollIndicator = false
        imagesCollectionView?.backgroundColor = UIColor.white
        imagesCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "KeyboardImagePickerViewCell")
        addSubview(imagesCollectionView!)
        imagePickerControllerButton = UIButton()
        imagePickerControllerButton?.layer.masksToBounds = true
        imagePickerControllerButton?.layer.cornerRadius = 25
        imagePickerControllerButton?.addTarget(self, action: #selector(self.didTapImagePickerControllerButton(_:)), for: .touchUpInside)
        addSubview(imagePickerControllerButton!)
        isLoadingImages = false
        currentSelectedIndexPath = nil
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        renderImagesCollectionView()
        renderImagePickerViewControllerButton()
        renderOptionButtons()
    }
    
    func reload(){
        renderImagesCollectionView()
        renderImagePickerViewControllerButton()
        renderOptionButtons()
    }
    
    func update(_ image: UIImage?, at index: Int, animated: Bool) {
        let cell: UICollectionViewCell? = imagesCollectionView?.cellForItem(at: IndexPath(item: index, section: 0))
        let squareImage: UIImage? = self.squareImage(with: image, scaledToSize: frame.size.height)
        let imageView = UIImageView(image: squareImage)
        imageView.alpha = 0.0
        cell?.contentView.addSubview(imageView)
        if animated {
            UIView.animate(withDuration: 0.25, animations: {
                imageView.alpha = 1.0
            }) { finished in
                cell?.backgroundView = nil
            }
        } else {
            imageView.alpha = 1.0
            cell?.backgroundView = nil
        }
    }
    
    func imageIndex(at point: CGPoint) -> Int {
        let offsetX: CGFloat = (imagesCollectionView?.contentOffset.x)!
        let offsetY: CGFloat = (imagesCollectionView?.contentOffset.y)!
        let pointInCollectionView = CGPoint(x: point.x + offsetX, y: point.y + offsetY)
        return imagesCollectionView?.indexPathForItem(at: pointInCollectionView)?.item ?? 0
    }
    
    func renderImagesCollectionView() {
        print("boiunds =", bounds)
        imagesCollectionView?.frame = bounds
        imagesCollectionView?.reloadData()
    }
    
    
    
    func renderImagePickerViewControllerButton() {
        if dataSource != nil  {
            imagePickerControllerButton?.removeFromSuperview()
            if dataSource?.isImagePickerControllerButtonVisible(in: self) != nil {
                addSubview(imagePickerControllerButton!)
            }
        }
        if dataSource != nil  {
            imagePickerControllerButton?.backgroundColor = dataSource?.backgroundColorForImagePickerControllerButton(in: self)
        }
        if dataSource != nil  {
            imagePickerControllerButton?.setImage(dataSource?.backgroundImageForImagePickerControllerButton(in: self), for: .normal)
        }
        imagePickerControllerButton?.frame = CGRect(x: 5, y: bounds.size.height - 50 - 5, width: 50, height: 50)
    }

    func renderOptionButtons() {
    

        if dataSource != nil {
            if dataSource?.numberOfOptionButtons(in: self) != 0 {
                optionButtonsView = UIView(frame: CGRect(x: 0, y: 0, width: (imagesCollectionView?.bounds.size.height)!, height: (imagesCollectionView?.bounds.size.height)!))
                optionButtonsView?.alpha = 0.0
                optionButtonsView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                blurVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
                blurVisualEffectView?.frame = (optionButtonsView?.bounds)!
                optionButtonsView?.addSubview(blurVisualEffectView!)
                optionButtons = [UIButton]()
                let num = self.dataSource?.numberOfOptionButtons(in: self)
                
                
                for i in 0..<num!{
                    let currentOptionButton = UIButton(frame: CGRect(x: 0, y: 0, width: kKCKeyboardImagePickerViewCellOptionButtonRadius, height: kKCKeyboardImagePickerViewCellOptionButtonRadius))
                    currentOptionButton.tag = i
                    currentOptionButton.layer.masksToBounds = true
                    currentOptionButton.layer.cornerRadius = kKCKeyboardImagePickerViewCellOptionButtonRadius / 2.0
                    currentOptionButton.layer.borderWidth = kKCKeyboardImagePickerViewCellOptionButtonBorderWidth
                    currentOptionButton.layer.borderColor = UIColor.white.cgColor
                    currentOptionButton.addTarget(self, action: #selector(self.didTapOptionButton(_:)), for: .touchUpInside)
                    currentOptionButton.addTarget(self, action: #selector(self.refreshOptionButtonBackgroundColor(_:)), for: .touchDown)
                    currentOptionButton.addTarget(self, action: #selector(self.refreshOptionButtonBackgroundColor(_:)), for: .touchUpInside)
                    currentOptionButton.addTarget(self, action: #selector(self.refreshOptionButtonBackgroundColor(_:)), for: .touchUpOutside)
                    optionButtons.append(currentOptionButton)
                    optionButtonsView?.addSubview(currentOptionButton)
                }
            } else {
                return
            }
        }
        
        if dataSource != nil  {
            for currentOptionButton: UIButton? in optionButtons {
                currentOptionButton?.setTitle(dataSource?.keyboardImagePickerView(self, titleForOptionButtonAt: (currentOptionButton?.tag)!), for: .normal)
            }
        }
        if dataSource != nil {
            for currentOptionButton: UIButton? in optionButtons {

                currentOptionButton?.setTitleColor(dataSource?.keyboardImagePickerView(self, titleColorForOptionButtonAt: (currentOptionButton?.tag)!, for: .highlighted), for: .highlighted)
                currentOptionButton?.setTitleColor(dataSource?.keyboardImagePickerView(self, titleColorForOptionButtonAt: (currentOptionButton?.tag)!, for: .normal), for: .normal)
            }
        }
        if dataSource != nil  {
            for currentOptionButton: UIButton? in optionButtons {
                currentOptionButton?.backgroundColor = dataSource?.keyboardImagePickerView(self, backgroundColorForOptionButtonAt: (currentOptionButton?.tag)!, for: .normal)
            }
        }
        switch dataSource?.numberOfOptionButtons(in: self) {
        case 1:
            renderOneOptionButtonLayout()
        case 2:
            renderTwoOptionButtonsLayout()
        case 3:
            renderThreeOptionButtonsLayout()
        case 4:
            renderFourOptionButtonsLayout()
        default:
            print("empty")
        }

    }
    
    func renderOneOptionButtonLayout() {
    
        (optionButtons[0] as? UIButton)?.center = (optionButtonsView?.center)!
    }
    
    func renderTwoOptionButtonsLayout() {
        (optionButtons[0] as? UIButton)?.center = CGPoint(x: (optionButtonsView?.frame.size.width)! * 0.3, y: (optionButtonsView?.frame.size.height)! * 0.5)
        (optionButtons[1] as? UIButton)?.center = CGPoint(x: (optionButtonsView?.frame.size.width)! * 0.7, y: (optionButtonsView?.frame.size.height)! * 0.5)
    }
    
    func renderThreeOptionButtonsLayout() {
        (optionButtons[0] as? UIButton)?.center = CGPoint(x: (optionButtonsView?.frame.size.width)! * 0.5, y: (optionButtonsView?.frame.size.height)! * 0.35)
        (optionButtons[1] as? UIButton)?.center = CGPoint(x: (optionButtonsView?.frame.size.width)! * 0.3, y: (optionButtonsView?.frame.size.height)! * 0.65)
        (optionButtons[2] as? UIButton)?.center = CGPoint(x: (optionButtonsView?.frame.size.width)! * 0.7, y: (optionButtonsView?.frame.size.height)! * 0.65)
    }
    
    func renderFourOptionButtonsLayout() {
        (optionButtons[0] as? UIButton)?.center = CGPoint(x: (optionButtonsView?.frame.size.width)! * 0.3, y: (optionButtonsView?.frame.size.height)! * 0.3)
        (optionButtons[1] as? UIButton)?.center = CGPoint(x: (optionButtonsView?.frame.size.width)! * 0.7, y: (optionButtonsView?.frame.size.height)! * 0.3)
        (optionButtons[2] as? UIButton)?.center = CGPoint(x: (optionButtonsView?.frame.size.width)! * 0.3, y: (optionButtonsView?.frame.size.height)! * 0.7)
        (optionButtons[3] as? UIButton)?.center = CGPoint(x: (optionButtonsView?.frame.size.width)! * 0.7, y: (optionButtonsView?.frame.size.height)! * 0.7)
    }
    
    func squareImage(with image: UIImage?, scaledToSize size: CGFloat) -> UIImage? {
        var image = image
        var origin = CGPoint.zero
        var scaleRatio: CGFloat = 0
        if (image?.size.width ?? 0.0) > (image?.size.height ?? 0.0) {
            scaleRatio = size / (image?.size.height ?? 0.0)
            origin = CGPoint(x: -((image?.size.width ?? 0.0) - (image?.size.height ?? 0.0)) / 2, y: 0)
        } else {
            scaleRatio = size / (image?.size.width ?? 0.0)
            origin = CGPoint(x: 0, y: -((image?.size.height ?? 0.0) - (image?.size.width ?? 0.0)) / 2)
        }
        let scaleTransform = CGAffineTransform(scaleX: scaleRatio, y: scaleRatio)
        UIGraphicsBeginImageContextWithOptions(CGSize(width: size, height: size), true, 0)
        UIGraphicsGetCurrentContext()?.concatenate(scaleTransform)
        image?.draw(at: origin)
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    @objc func didTapImagePickerControllerButton(_ sender: Any?) {
        if (delegate != nil)  {
            delegate?.didTapImagePickerControllerButton(in: self)
        }
    }
    
    func showOptionButtonsView(in cell: UICollectionViewCell?, animated: Bool) {
        cell?.contentView.addSubview(optionButtonsView!)
        optionButtonsView?.frame = (cell?.contentView.bounds)!
        blurVisualEffectView?.frame = (cell?.contentView.bounds)!
        if animated {
            UIView.animate(withDuration: 0.25, animations: {
                self.optionButtonsView?.alpha = 1.0
            }) { finished in
                cell?.contentView.bringSubview(toFront: self.optionButtonsView!)
            }
        } else {
            optionButtonsView?.alpha = 1.0
            cell?.contentView.bringSubview(toFront: optionButtonsView!)
        }
    }
    
    func hideOptionButtonsView(in cell: UICollectionViewCell?, animated: Bool) {
        if animated {
            UIView.animate(withDuration: 0.25, animations: {
                self.optionButtonsView?.alpha = 0.0
            })
        } else {
            optionButtonsView?.alpha = 0.0
            optionButtonsView?.removeFromSuperview()
        }
    }
    
    @objc func refreshOptionButtonBackgroundColor(_ optionButton: UIButton?) {
        if optionButton?.isHighlighted != nil {
            UIView.animate(withDuration: 0.25, animations: {
                if self.dataSource != nil  {
                    optionButton?.backgroundColor = self.dataSource?.keyboardImagePickerView(self, backgroundColorForOptionButtonAt: (optionButton?.tag)!, for: .highlighted)
                } else {
                    optionButton?.backgroundColor = UIColor.white
                }
            })
        } else {
            UIView.animate(withDuration: 0.25, animations: {
                if self.dataSource != nil {
                    optionButton?.backgroundColor = self.dataSource?.keyboardImagePickerView(self, backgroundColorForOptionButtonAt: (optionButton?.tag)!, for: .normal)
                } else {
                    optionButton?.backgroundColor = UIColor.lightGray
                }
            })
        }
    }
    
    @objc func didTapOptionButton(_ optionButton: UIButton?) {
        if (delegate != nil)  {
            delegate?.keyboardImagePickerView(self, didTapOptionButton: optionButton, at: (currentSelectedIndexPath?.row)!)
            collectionView(imagesCollectionView!, didDeselectItemAt: currentSelectedIndexPath!)
            optionButton?.isHighlighted = false
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if dataSource != nil  {
            return (dataSource?.numberOfImages(in: self))!
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "KeyboardImagePickerViewCell", for: indexPath)

        cell?.backgroundView = UIImageView(image: dataSource?.keyboardImagePickerView(self, imageAt: indexPath.row))
        if let aCell = cell {
            return aCell
        }
        return UICollectionViewCell()
    }
    
    // MARK: - UICollectionViewFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.height, height: collectionView.frame.size.height)
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (delegate != nil)  {
//            delegate?.keyboardImagePickerView(self, : indexPath.item)
            delegate?.keyboardImagePickerView(self, willShowImageAt: indexPath.row)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        for currentSubview: UIView in cell.contentView.subviews {
            currentSubview.removeFromSuperview()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        hideOptionButtonsView(in: collectionView.cellForItem(at: indexPath), animated: true)
        currentSelectedIndexPath = nil
        if delegate != nil {
            delegate?.keyboardImagePickerView(self, didDeselectItemAt: indexPath.row)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if currentSelectedIndexPath != nil {
            currentSelectedIndexPath = nil
            hideOptionButtonsView(in: collectionView.cellForItem(at: indexPath), animated: true)
        } else {
            currentSelectedIndexPath = indexPath
            showOptionButtonsView(in: collectionView.cellForItem(at: indexPath), animated: true)
        }
        if (delegate != nil)  {
            delegate?.keyboardImagePickerView(self, didSelectItemAt: indexPath.row)
        }
    }

}
