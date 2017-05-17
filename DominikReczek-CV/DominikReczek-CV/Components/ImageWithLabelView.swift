import UIKit
import SnapKit

private struct ViewSizes {
    static let descriptionLabelLeftOffset: CGFloat = 5
    static let descriptionLabelRightOffset: CGFloat = -5

    static let descriptionLabelFontSize: CGFloat = 33.0
    static let backgroundViewBorderWidth: CGFloat = 0.3
}

class ImageWithLabelView: CustomUIView {

    lazy var backgroundView: CustomUIView = {
        let view = CustomUIView()
        return view
    }()

    lazy var iconImageView: CustomUIImageView = {
        var imageView = CustomUIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        imageView.layer.cornerRadius = 10.0
        return imageView
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        label.textAlignment = .right
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.prepareView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func prepareView() {
        addSubview(backgroundView)
        backgroundView.addSubview(iconImageView)
        backgroundView.addSubview(nameLabel)
    }

    override func updateConstraints() {
        super.updateConstraints()

        backgroundView.snp.updateConstraints { make in
            make.edges.equalTo(self)
        }

        iconImageView.snp.updateConstraints { make in
            make.left.equalTo(backgroundView).offset(10)
            make.centerY.equalTo(backgroundView)
            make.width.height.equalTo(40.0)
        }

        nameLabel.snp.updateConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(10)
            make.right.equalTo(backgroundView).offset(-10)
            make.centerY.equalTo(backgroundView)
        }
    }
}
