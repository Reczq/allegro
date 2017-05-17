import UIKit

protocol Blurable: class {
    var blurEffectView: UIVisualEffectView? { set get }

    func applyBlur(with effect: UIBlurEffectStyle, onCompletion: ((Bool) -> Void)?)
    func removeBlur(onCompletion: ((Bool) -> Void)?)
}

private var xoAssociationKey: UInt8 = 0

extension Blurable where Self: UIView {

    var blurEffectView: UIVisualEffectView? {
        get {
            return objc_getAssociatedObject(self, &xoAssociationKey) as? UIVisualEffectView
        }

        set(newBlurEffectView) {
            objc_setAssociatedObject(self, &xoAssociationKey, newBlurEffectView, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }

    func applyBlur(with effect: UIBlurEffectStyle, onCompletion: ((Bool) -> Void)? = nil) {
        let blurEffect = UIBlurEffect(style: effect)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView?.frame = bounds
        

        if let blurEffectView = blurEffectView { addSubview(blurEffectView) }
    }

    func removeBlur(onCompletion: ((Bool) -> Void)? = nil) {
        if let blurEffectView = blurEffectView {
                blurEffectView.removeFromSuperview()
        }
        
        blurEffectView = nil
    }
}
