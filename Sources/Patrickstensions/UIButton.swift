import UIKit

extension UIButton {
    private func imageWithColor(_ color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func setBackgroundColor(color: UIColor, for state: UIControlState) {
        self.setBackgroundImage(imageWithColor(color), for: state)
    }
    
    public func setImageTintColor(color: UIColor, for state: UIControlState) {
        let image = self.image(for: state)
        if image != nil {
            self.setImage(self.tintedImageWithColor(color, image: image!), for: state)
        }
    }
    
    public func setBackgroundTintColor(color: UIColor, forUIControlState state: UIControlState) {
        let backgroundImage = self.backgroundImage(for: state)
        if backgroundImage != nil {
            self.setBackgroundImage(self.tintedImageWithColor(color, image: backgroundImage!), for: state)
        }
    }
    
    private func tintedImageWithColor(_ tintColor: UIColor, image: UIImage) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(image.size, false, UIScreen.main.scale)
        
        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: 0, y: image.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        
        let rect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
        
        context.setBlendMode(.normal)
        context.draw(image.cgImage!, in: rect)
        context.setBlendMode(.sourceIn)
        context.setFillColor(tintColor.cgColor)
        context.fill(rect)
        
        let coloredImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return coloredImage
    }
}
