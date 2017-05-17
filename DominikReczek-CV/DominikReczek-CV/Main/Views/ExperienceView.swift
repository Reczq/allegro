import UIKit
import SnapKit

class ExperienceView: CustomUIView {

    lazy var topBackgroundView: CustomUIImageView = {
        var view = CustomUIImageView()
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()

    lazy var bottomBackgroundView: CustomUIImageView = {
        var view = CustomUIImageView()
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()

    lazy var confidoView: ExperienceComponentView = {
        var backgroundImage = ExperienceComponentView()
        return backgroundImage
    }()

    lazy var braintriView: ExperienceComponentView = {
        var backgroundImage = ExperienceComponentView()
        return backgroundImage
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.prepareView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func prepareView() {
        addSubview(topBackgroundView)
        addSubview(bottomBackgroundView)
        topBackgroundView.addSubview(confidoView)
        bottomBackgroundView.addSubview(braintriView)

        setNeedsUpdateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        topBackgroundView.snp.updateConstraints { make in
            make.left.top.right.equalTo(self)
            make.height.equalTo(self.frame.size.height * 0.5)
        }

        bottomBackgroundView.snp.updateConstraints { make in
            make.left.bottom.right.equalTo(self)
            make.height.equalTo(self.frame.size.height * 0.5)
        }

        confidoView.snp.updateConstraints { make in
            make.edges.equalTo(topBackgroundView)
        }

        braintriView.snp.updateConstraints { make in
            make.edges.equalTo(bottomBackgroundView)
        }
    }
}
