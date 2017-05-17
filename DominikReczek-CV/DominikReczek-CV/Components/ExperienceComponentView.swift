import UIKit
import SnapKit

class ExperienceComponentView: CustomUIView {

    lazy var backgroundView: CustomUIImageView = {
        var backgroundImage = CustomUIImageView()
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true
        return backgroundImage
    }()

    lazy var iconImageView: CustomUIImageView = {
        var imageView = CustomUIImageView()
        imageView.alpha = 0.6
        imageView.layer.cornerRadius = 10.0
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        return imageView
    }()

    lazy var positionAndPeriodLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.5556491613, green: 0.7595404983, blue: 0.008766815066, alpha: 1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 0
        label.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(0.6)
        label.textColor = #colorLiteral(red: 0.5556491613, green: 0.7595404983, blue: 0.008766815066, alpha: 1)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = true
        label.layer.cornerRadius = 10.0
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.masksToBounds = true
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
        backgroundView.addSubview(positionAndPeriodLabel)
        backgroundView.addSubview(descriptionLabel)
        setNeedsUpdateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        backgroundView.snp.updateConstraints { make in
            make.edges.equalTo(self)
       }

        iconImageView.snp.updateConstraints { make in
            make.top.equalTo(backgroundView).offset(UIScreen.main.bounds.width * 0.070)
            make.left.equalTo(backgroundView).offset(UIScreen.main.bounds.width * 0.05)
            make.height.equalTo((UIScreen.main.bounds.height * 0.5) * 0.405)
            make.width.equalTo((UIScreen.main.bounds.height * 0.5) * 0.425)
        }

        positionAndPeriodLabel.snp.updateConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(UIScreen.main.bounds.width * 0.05)
            make.right.equalTo(backgroundView).offset(-UIScreen.main.bounds.width * 0.05)
            make.height.equalTo((UIScreen.main.bounds.height * 0.5) * 0.405)
            make.centerY.equalTo(iconImageView)
        }

        descriptionLabel.snp.updateConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset((UIScreen.main.bounds.height * 0.015) * 0.5)
            make.left.equalTo(backgroundView).offset((UIScreen.main.bounds.width * 0.05) * 0.5)
            make.right.equalTo(backgroundView).offset(-(UIScreen.main.bounds.width * 0.05) * 0.5)
            make.bottom.equalTo(backgroundView).offset(-(UIScreen.main.bounds.height * 0.015) * 0.5)
        }
    }
}
