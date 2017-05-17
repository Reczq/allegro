import UIKit

extension UIBezierPath {

    convenience init(polygonIn rect: CGRect, sides: Int, lineWidth: CGFloat = 1, cornerRadius: CGFloat = 0) {
        self.init()

        let theta = 2 * CGFloat.pi / CGFloat(sides)
        let offset = cornerRadius * tan(theta / 2)
        let squareWidth = min(rect.size.width, rect.size.height)

        var length = squareWidth - lineWidth
        if sides % 4 != 0 {
            length = length * cos(theta / 2) + offset / 2
        }
        let sideLength = length * tan(theta / 2)

        var point = CGPoint(x: rect.origin.x + rect.size.width / 2 + sideLength / 2 - offset, y: rect.origin.y + rect.size.height / 2 + length / 2)
        var angle = CGFloat.pi
        move(to: point)

        for _ in 0 ..< sides {
            point = CGPoint(x: point.x + (sideLength - offset * 2) * cos(angle), y: point.y + (sideLength - offset * 2) * sin(angle))
            addLine(to: point)

            let center = CGPoint(x: point.x + cornerRadius * cos(angle + .pi / 2), y: point.y + cornerRadius * sin(angle + .pi / 2))
            addArc(withCenter: center, radius: cornerRadius, startAngle: angle - .pi / 2, endAngle: angle + theta - .pi / 2, clockwise: true)

            point = currentPoint
            angle += theta
        }

        close()

        self.lineWidth = lineWidth
        lineJoinStyle = .round
    }
}
