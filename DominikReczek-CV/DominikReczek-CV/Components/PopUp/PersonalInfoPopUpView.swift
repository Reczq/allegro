import UIKit
import SnapKit

class PersonalInfoPopUpView: CustomUIView {

    lazy var backgroundView: UIView = {
        let image = UIView()
        image.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(0.5)
        image.layer.cornerRadius = 20.0
        return image
    }()

    lazy var closeButton: CustomUIButton = {
        let button = CustomUIButton()
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(0.5)
        button.layer.cornerRadius = 12.5
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.green.cgColor
        button.setTitle("CLOSE", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        return button
    }()

    lazy var nameView: ImageWithLabelView = {
        let imageAndLabel = ImageWithLabelView()
        return imageAndLabel
    }()

    lazy var surnameView: ImageWithLabelView = {
        let imageAndLabel = ImageWithLabelView()
        return imageAndLabel
    }()

    lazy var countryView: ImageWithLabelView = {
        let imageAndLabel = ImageWithLabelView()
        return imageAndLabel
    }()

    lazy var cityView: ImageWithLabelView = {
        let imageAndLabel = ImageWithLabelView()
        return imageAndLabel
    }()

    lazy var addressView: ImageWithLabelView = {
        let imageAndLabel = ImageWithLabelView()
        return imageAndLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        prepareView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func prepareView() {
        addSubview(backgroundView)
        addSubview(closeButton)
        addSubview(nameView)
        addSubview(surnameView)
        addSubview(countryView)
        addSubview(cityView)
        addSubview(addressView)
    }

    override func updateConstraints() {
        super.updateConstraints()

        backgroundView.snp.updateConstraints { make in
            make.edges.equalTo(self)
        }

        closeButton.snp.updateConstraints { make in
            make.bottom.equalTo(backgroundView).offset(-15)
            make.centerX.equalTo(backgroundView)
            make.width.equalTo(120.0)
            make.height.equalTo(28.0)
        }

        nameView.snp.updateConstraints { make in
            make.top.equalTo(backgroundView).offset(20)
            make.left.equalTo(backgroundView).offset(5)
            make.right.equalTo(backgroundView).offset(-5)
            make.centerX.equalTo(backgroundView)
            make.height.equalTo(40.0)
        }

        surnameView.snp.updateConstraints { make in
            make.top.equalTo(nameView.snp.bottom).offset(20)
            make.left.equalTo(backgroundView).offset(5)
            make.right.equalTo(backgroundView).offset(-5)
            make.centerX.equalTo(backgroundView)
            make.height.equalTo(40.0)
        }

        countryView.snp.updateConstraints { make in
            make.top.equalTo(surnameView.snp.bottom).offset(20)
            make.left.equalTo(backgroundView).offset(5)
            make.right.equalTo(backgroundView).offset(-5)
            make.centerX.equalTo(backgroundView)
            make.height.equalTo(40.0)
        }

        cityView.snp.updateConstraints { make in
            make.top.equalTo(countryView.snp.bottom).offset(20)
            make.left.equalTo(backgroundView).offset(5)
            make.right.equalTo(backgroundView).offset(-5)
            make.centerX.equalTo(backgroundView)
            make.height.equalTo(40.0)
        }

        addressView.snp.updateConstraints { make in
            make.top.equalTo(cityView.snp.bottom).offset(20)
            make.left.equalTo(backgroundView).offset(5)
            make.right.equalTo(backgroundView).offset(-5)
            make.centerX.equalTo(backgroundView)
            make.height.equalTo(40.0)
        }
    }
}
