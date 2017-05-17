import UIKit
import SnapKit

class ContactInfoPopUpView: CustomUIView {

    lazy var backgroundView: CustomUIView = {
        let image = CustomUIView()
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

    lazy var cellphoneView: ImageWithLabelView = {
        let imageAndLabel = ImageWithLabelView()
        return imageAndLabel
    }()

    lazy var emailView: ImageWithLabelView = {
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
        addSubview(cellphoneView)
        addSubview(emailView)
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

        cellphoneView.snp.updateConstraints { make in
            make.top.equalTo(backgroundView).offset(20)
            make.left.equalTo(backgroundView).offset(5)
            make.right.equalTo(backgroundView).offset(-5)
            make.centerX.equalTo(backgroundView)
            make.height.equalTo(40.0)
        }

        emailView.snp.updateConstraints { make in
            make.top.equalTo(cellphoneView.snp.bottom).offset(20)
            make.left.equalTo(backgroundView).offset(5)
            make.right.equalTo(backgroundView).offset(-5)
            make.centerX.equalTo(backgroundView)
            make.height.equalTo(40.0)
        }
    }
}
