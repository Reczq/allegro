import UIKit
import SnapKit

private struct ViewSizes {
    static let backgroundColorAlpha: CGFloat = 0.6

    static let descriptionLabelNumberOfLines: Int = 0
    static let descriptionLabelCornerRadius: CGFloat = 10.0
    static let descriptionLabelBorderWidth: CGFloat = 0.6

    static let personalInfoPopUpViewAlpha: CGFloat = 0
    static let contactInfoPopUpViewAlpha: CGFloat = 0

    static let descriptionLabelFontSize: CGFloat = 33.0
    static let backgroundViewBorderWidth: CGFloat = 0.3
}

class BasicDataView: CustomUIView {

    lazy var backgroundImageView: CustomUIImageView = {
        let image = CustomUIImageView()
        return image
    }()

    lazy var containerView: CustomUIView = {
        let view = CustomUIView()
        return view
    }()

    lazy var avatarImageView: CustomUIImageView = {
        let image = CustomUIImageView()
        return image
    }()

    lazy var descriptionLabel: DescriptionLabel = {
        let label = DescriptionLabel()
        label.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(ViewSizes.backgroundColorAlpha)
        label.textColor = #colorLiteral(red: 0.5556491613, green: 0.7595404983, blue: 0.008766815066, alpha: 1)
        label.numberOfLines = ViewSizes.descriptionLabelNumberOfLines
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.layer.cornerRadius = ViewSizes.descriptionLabelCornerRadius
        label.layer.borderWidth = ViewSizes.backgroundViewBorderWidth
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.masksToBounds = true

        return label
    }()

    lazy var videoButton: CustomUIButton = {
        var button = CustomUIButton()
        return button
    }()

    lazy var personalInfoButton: CustomUIButton = {
        var button = CustomUIButton()
        return button
    }()

    lazy var contactInfoButton: CustomUIButton = {
        var button = CustomUIButton()
        return button
    }()

    lazy var personalInfoPopUpView: PersonalInfoPopUpView = {
        let view = PersonalInfoPopUpView()
        view.alpha = ViewSizes.personalInfoPopUpViewAlpha
        return view
    }()

    lazy var contactInfoPopUpView: ContactInfoPopUpView = {
        let view = ContactInfoPopUpView()
        view.alpha = ViewSizes.contactInfoPopUpViewAlpha
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.prepareView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func prepareView() {
        addSubview(backgroundImageView)
        addSubview(containerView)
        containerView.addSubview(avatarImageView)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(personalInfoButton)
        containerView.addSubview(contactInfoButton)
        containerView.addSubview(videoButton)
        addSubview(personalInfoPopUpView)
        addSubview(contactInfoPopUpView)

        setNeedsUpdateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        let screenWidth = self.frame.size.width

        videoButton.snp.updateConstraints { make in
            make.centerX.equalTo(self)
            make.bottom.equalTo(personalInfoButton.snp.top).offset(-50)
            make.width.height.equalTo(50.0)
        }

        backgroundImageView.snp.updateConstraints { make in
            make.edges.equalTo(self)
        }

        containerView.snp.updateConstraints { make in
            make.edges.equalTo(self)
        }

        avatarImageView.snp.updateConstraints { make in
            make.top.equalTo(self).offset(50.0)
            make.centerX.equalTo(self)
            make.width.height.equalTo(150.0)
        }

        descriptionLabel.snp.updateConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(50)
            make.centerX.equalTo(self)
            make.width.equalTo(screenWidth - 20.0)
            make.height.equalTo(100.0)
        }

        personalInfoButton.snp.updateConstraints { make in
            make.left.equalTo(self).offset((screenWidth/2) - 60.0)
            make.bottom.equalTo(self).offset(-20.0)
            make.width.height.equalTo(50.0)
        }

        contactInfoButton.snp.updateConstraints { make in
            make.right.equalTo(self).offset(-((screenWidth/2) - 60.0))
            make.bottom.equalTo(self).offset(-20.0)
            make.width.height.equalTo(50.0)
        }

        personalInfoPopUpView.snp.updateConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            make.width.equalTo(250.0)
            make.height.equalTo(375.0)
        }

        contactInfoPopUpView.snp.updateConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            make.width.equalTo(screenWidth - 20.0)
            make.height.equalTo(200.0)
        }
    }
}
