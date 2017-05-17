import UIKit
import SnapKit

class EducationView: CustomUIView {

    lazy var backgroundView: CustomUIView = {
        var backgroundImage = CustomUIView()
        backgroundImage.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return backgroundImage
    }()

    lazy var ukswView: CustomUIImageView = {
        var imageView = CustomUIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        return imageView
    }()

    lazy var ukswPositionAndPeriodLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(0.6)
        label.textColor = #colorLiteral(red: 0.5556491613, green: 0.7595404983, blue: 0.008766815066, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.layer.cornerRadius = 10.0
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.masksToBounds = true
        return label
    }()

    lazy var zseilView: CustomUIImageView = {
        var imageView = CustomUIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        return imageView
    }()

    lazy var zseilPositionAndPeriodLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(0.6)
        label.textColor = #colorLiteral(red: 0.5556491613, green: 0.7595404983, blue: 0.008766815066, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.layer.cornerRadius = 10.0
        label.layer.borderWidth = 2
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
        backgroundView.addSubview(ukswView)
        backgroundView.addSubview(ukswPositionAndPeriodLabel)
        backgroundView.addSubview(zseilView)
        backgroundView.addSubview(zseilPositionAndPeriodLabel)

        setNeedsUpdateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        backgroundView.snp.updateConstraints { make in
            make.edges.equalTo(self)
        }

        ukswView.snp.updateConstraints { make in
            make.left.top.right.equalTo(backgroundView)
            make.height.equalTo(frame.size.height * 0.5)
        }

        ukswPositionAndPeriodLabel.snp.updateConstraints { make in
            make.centerY.equalTo(ukswView)
            make.centerX.equalTo(ukswView)
            make.width.equalTo(frame.size.height * 0.5)
            make.height.equalTo(frame.size.height * 0.1)
        }

        zseilView.snp.updateConstraints { make in
            make.left.bottom.right.equalTo(backgroundView)
            make.height.equalTo(frame.size.height * 0.5)
        }

        zseilPositionAndPeriodLabel.snp.updateConstraints { make in
            make.centerY.equalTo(zseilView)
            make.centerX.equalTo(zseilView)
            make.width.equalTo(frame.size.height * 0.5)
            make.height.equalTo(frame.size.height * 0.1)
        }
    }
}
