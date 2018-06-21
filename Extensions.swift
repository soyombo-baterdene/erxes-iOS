//
//  Extensions.swift
//  NMG.CRM
//
//  Created by Soyombo bat-erdene on 4/30/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit
import Apollo

extension UIViewController {
    
    func navigate(_ navigation: MyNavigation) {
        navigate(navigation as Navigation)
    }
    
}

extension String {
    public var withoutHtml: String {
        guard let data = self.data(using: .utf8) else {
            return self
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return self
        }
        
        var str = attributedString.string
        str = str.replacingOccurrences(of: "\n", with: "")
        
        return str
    }
}

extension Date {
    var millisecondsSince1970:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
}

extension UIView {
    func addBlurEffect()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.tag = 1000
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        return label.frame.height
    }
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    func addBorder(with color:UIColor){
        self.layer.borderWidth = 1
        self.layer.borderColor = color.cgColor
    }
}



extension UIImageView {
    func setImageWithString(text: String, backGroundColor: UIColor, attributes: [NSAttributedStringKey : Any]) {
        
        var displayString: NSMutableString = NSMutableString(string: "")
        var words = text.components(separatedBy: CharacterSet.whitespacesAndNewlines)
        
        if words.count == 2 {
            let firstWord = words[0]
            if firstWord.count != 0 {
                let firstLetter = firstWord.substring(to: firstWord.index(firstWord.startIndex, offsetBy: 1))
                displayString.append(firstLetter)
            }
            
            let secondWord = words[1]
            if secondWord.count != 0 {
                let firstLetter = secondWord.substring(to: (secondWord.index((secondWord.startIndex), offsetBy: 1)))
                displayString.append(".")
                displayString.append(firstLetter)
            }
        }else{
            let firstWord = words[0]
            if firstWord.count != 0 {
                let firstLetter = firstWord.substring(to: firstWord.index(firstWord.startIndex, offsetBy: 1))
                displayString.append(firstLetter)
            }
        }

        let scale:Float = Float(UIScreen.main.scale)
        var size:CGSize = self.bounds.size
        
        if (self.contentMode == .scaleToFill ||
            self.contentMode == .scaleAspectFill ||
            self.contentMode == .scaleAspectFit ||
            self.contentMode == .redraw)
        {
            size.width = CGFloat(floorf(Float(size.width) * scale) / scale)
            size.height = CGFloat(floorf(Float(size.height) * scale) / scale)
        }

        
        UIGraphicsBeginImageContextWithOptions(size, false, CGFloat( scale))
        let context = UIGraphicsGetCurrentContext()
        
        let path = CGPath(ellipseIn: self.bounds, transform: nil)
        context!.addPath(path)
        context?.clip()
        context!.setFillColor(backGroundColor.cgColor)
        context!.fill(CGRect(x:0, y:0, width:size.width, height:size.height));
        
        let textSize = displayString.size(withAttributes: attributes)
        
        
        displayString.draw(in: CGRect(x: bounds.size.width/2 - textSize.width/2, y: bounds.size.height/2 - textSize.height/2, width: textSize.width, height: textSize.height), withAttributes: attributes)
        
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        self.image = image
    }
    
    func fontName(fontName:String) -> UIFont {
        let fontSize:CGFloat = self.bounds.width * 40
        if fontName.count != 0 {
            return UIFont(name: fontName, size: fontSize)!
        }else{
            return UIFont.systemFont(ofSize: fontSize)
        }
    }
}

public extension UIImage {
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
  
        
        func tint(with color: UIColor) -> UIImage
        {
            UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
            guard let context = UIGraphicsGetCurrentContext() else { return self }
            
            // flip the image
            context.scaleBy(x: 1.0, y: -1.0)
            context.translateBy(x: 0.0, y: -self.size.height)
            
            // multiply blend mode
            context.setBlendMode(.multiply)
            
            let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
            context.clip(to: rect, mask: self.cgImage!)
            color.setFill()
            context.fill(rect)
            
            // create UIImage
            guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else { return self }
            UIGraphicsEndImageContext()
            
            return newImage
        }
    
}

public typealias JSON = [String: JSONDecodable & JSONEncodable]

extension Dictionary: JSONDecodable {
    public init(jsonValue value: JSONValue) throws {
        guard let dictionary = forceBridgeFromObjectiveC(value) as? Dictionary else {
            
            
            throw JSONDecodingError.couldNotConvert(value: value, to: Dictionary.self)
        }
        self = dictionary
    }
}

extension Array: JSONDecodable {
    public init(jsonValue value: JSONValue) throws {
        guard let array = forceBridgeFromObjectiveC(value) as? Array else {
            
            throw JSONDecodingError.couldNotConvert(value: value, to: Array.self)
        }
        self = array
    }
}


private func forceBridgeFromObjectiveC(_ value: Any) -> Any {
    switch value {
    case is NSString:
        return value as! String
        
    case is Bool:
        return value as! Bool
    case is Int:
        return value as! Int
    case is Double:
        return value as! Double
    case is NSDictionary:
        return Dictionary(uniqueKeysWithValues: (value as! NSDictionary).map { ( $0.key as! AnyHashable, forceBridgeFromObjectiveC($0.value)) })
    case is NSArray:
        return (value as! NSArray).map { forceBridgeFromObjectiveC($0) }
    default:
        return value
    }
}

extension Array {
    func contain<T>(obj: T) -> Bool where T : Equatable {
        return self.filter({$0 as? T == obj}).count > 0
    }
}
