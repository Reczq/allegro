import UIKit
import SnapKit

private struct ViewSizes {
    static let descriptionLabelLeftOffset: CGFloat = 5
    static let descriptionLabelRightOffset: CGFloat = -5

    static let descriptionLabelFontSize: CGFloat = 33.0
    static let backgroundViewBorderWidth: CGFloat = 0.3
}

class ImageWithDescriptionView: CustomUIView {

    lazy var backgroundView: CustomUIView = {
        let view = CustomUIView()
        view.layer.borderWidth = ViewSizes.backgroundViewBorderWidth
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()

    lazy var imageView: CustomUIImageView = {
        var imageView = CustomUIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont.systemFont(ofSize: ViewSizes.descriptionLabelFontSize)
        label.textAlignment = .center
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
        backgroundView.addSubview(imageView)
        backgroundView.addSubview(descriptionLabel)
    }

    override func updateConstraints() {
        super.updateConstraints()

        backgroundView.snp.updateConstraints { make in
            make.edges.equalTo(self)
        }

        imageView.snp.updateConstraints { make in
            make.edges.equalTo(backgroundView)
        }

        descriptionLabel.snp.updateConstraints { make in
            make.left.equalTo(imageView).offset(ViewSizes.descriptionLabelLeftOffset)
            make.right.equalTo(imageView).offset(ViewSizes.descriptionLabelRightOffset)
            make.centerY.equalTo(imageView)
        }
    }
}
