import UIKit

extension UILabel {

    var substituteDefaultFont : String {
        get { return self.font.fontName }
        set { self.font = UIFont(name: newValue, size: self.font.pointSize) }
    }
}
