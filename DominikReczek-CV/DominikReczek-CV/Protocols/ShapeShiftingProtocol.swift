import UIKit

protocol ShapeShifting {}

extension ShapeShifting where Self: UIView {

    func addCircularMask() {
        self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) / 20.0
        self.clipsToBounds = true
    }

    func addDiamondMask() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.size.width / 2.0, y: 0))
        path.addLine(to: CGPoint(x: bounds.size.width, y: bounds.size.height / 2.0))
        path.addLine(to: CGPoint(x: bounds.size.width / 2.0, y: bounds.size.height))
        path.addLine(to: CGPoint(x: 0, y: bounds.size.height / 2.0))
        path.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.strokeColor = UIColor.clear.cgColor

        layer.mask = shapeLayer
    }

    func addMask(with path: UIBezierPath) {
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }

    func addBorder(with path: UIBezierPath, width: CGFloat, color: UIColor) {
        let border = CAShapeLayer()
        border.path = path.cgPath
        border.lineWidth = width
        border.strokeColor = color.cgColor
        border.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(border)
    }
}
