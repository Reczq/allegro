import UIKit
import SnapKit

private struct ViewSizes {
    static let iconImageViewAlpha: CGFloat = 0.6
    static let descriptionLabelFontSize: CGFloat = 30.0

    static let imageViewTopOffset: CGFloat = (UIScreen.main.bounds.height * 0.3) * 0.1
    static let imageViewWidth: CGFloat = (UIScreen.main.bounds.width * 0.47) * 0.4
    static let imageViewHeight: CGFloat = (UIScreen.main.bounds.height * 0.3) * 0.4

    static let descriptionLabelBottomOffset: CGFloat = (UIScreen.main.bounds.height * 0.30) * 0.1
    static let descriptionLabelWidth: CGFloat = (UIScreen.main.bounds.width * 0.47) * 0.3
    static let descriptionLabelHeight: CGFloat = (UIScreen.main.bounds.height * 0.3) * 0.475
}

class ImageWithDescriptionInBackgroundView: CustomUIView {

    lazy var backgroundView: CustomUIView = {
        let imageView = CustomUIView()
        return imageView
    }()

    lazy var backgroundImageView: CustomUIImageView = {
        let imageView = CustomUIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    lazy var iconImageView: CustomUIImageView = {
        var imageView = CustomUIImageView()
        imageView.alpha = ViewSizes.iconImageViewAlpha
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
        backgroundView.addSubview(backgroundImageView)
        backgroundView.addSubview(iconImageView)
        backgroundView.addSubview(descriptionLabel)

        setNeedsUpdateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        let screenHeight = frame.size.height
        let screenWidth = self.frame.size.width

        backgroundView.snp.updateConstraints { make in
            make.edges.equalTo(self)
        }

        backgroundImageView.snp.updateConstraints { make in
            make.edges.equalTo(backgroundView)
        }

        iconImageView.snp.updateConstraints { make in
            make.top.equalTo(backgroundView).offset(ViewSizes.imageViewTopOffset)
            make.centerX.equalTo(backgroundView)
            make.width.equalTo(ViewSizes.imageViewWidth)
            make.height.equalTo(ViewSizes.imageViewHeight)
        }

        descriptionLabel.snp.updateConstraints { make in
            make.bottom.equalTo(backgroundView).offset(-(ViewSizes.descriptionLabelBottomOffset))
            make.centerX.equalTo(backgroundView)
        }
    }
}
