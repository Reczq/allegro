import UIKit
import SnapKit

struct SkillsViewSizes {
    static let avatarBezierPathSides: CGFloat = UIScreen.main.bounds.width
}

class SkillsView: CustomUIView {

    lazy var backgroundView: CustomUIView = {
        var backgroundImage = CustomUIView()
        backgroundImage.backgroundColor = #colorLiteral(red: 0.02689435841, green: 0.02689435841, blue: 0.02689435841, alpha: 1)
        return backgroundImage
    }()

    lazy var swiftView: ImageWithDescriptionInBackgroundView = {
        var image = ImageWithDescriptionInBackgroundView()
        return image
    }()

    lazy var macOSView: ImageWithDescriptionInBackgroundView = {
        var image = ImageWithDescriptionInBackgroundView()
        return image
    }()

    lazy var gitView: ImageWithDescriptionInBackgroundView = {
        var image = ImageWithDescriptionInBackgroundView()
        return image
    }()

    lazy var xcodeView: ImageWithDescriptionInBackgroundView = {
        var image = ImageWithDescriptionInBackgroundView()
        return image
    }()

    lazy var photoshopView: ImageWithDescriptionInBackgroundView = {
        var image = ImageWithDescriptionInBackgroundView()
        return image
    }()

    lazy var englishView: ImageWithDescriptionInBackgroundView = {
        var image = ImageWithDescriptionInBackgroundView()
        return image
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
        addSubview(swiftView)
        addSubview(macOSView)
        addSubview(gitView)
        addSubview(xcodeView)
        addSubview(photoshopView)
        addSubview(englishView)

        setNeedsUpdateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        let screenWidth = self.frame.size.width
        let screenHeight = self.frame.size.height

        backgroundView.snp.updateConstraints { (make) in
            make.edges.equalTo(self)
        }

        swiftView.snp.updateConstraints { (make) in
            make.top.equalTo(backgroundView).offset(screenHeight * 0.05)
            make.left.equalTo(backgroundView).offset(screenWidth * 0.015)
            make.width.equalTo(screenWidth * 0.48)
            make.height.equalTo(screenHeight * 0.31)
        }

        macOSView.snp.updateConstraints { (make) in
            make.top.equalTo(backgroundView).offset(screenHeight * 0.05)
            make.right.equalTo(backgroundView).offset(-(screenWidth * 0.015))
            make.width.equalTo(screenWidth * 0.48)
            make.height.equalTo(screenHeight * 0.31)
        }

        gitView.snp.updateConstraints { (make) in
            make.top.equalTo(swiftView.snp.bottom).offset(screenHeight * 0.005)
            make.left.equalTo(backgroundView).offset(screenWidth * 0.015)
            make.width.equalTo(screenWidth * 0.48)
            make.height.equalTo(screenHeight * 0.31)
        }

        xcodeView.snp.updateConstraints { (make) in
            make.top.equalTo(macOSView.snp.bottom).offset(screenHeight * 0.005)
            make.right.equalTo(backgroundView).offset(-(screenWidth * 0.015))
            make.width.equalTo(screenWidth * 0.48)
            make.height.equalTo(screenHeight * 0.31)
        }

        photoshopView.snp.updateConstraints { (make) in
            make.top.equalTo(gitView.snp.bottom).offset(screenHeight * 0.005)
            make.left.equalTo(backgroundView).offset(screenWidth * 0.015)
            make.width.equalTo(screenWidth * 0.48)
            make.height.equalTo(screenHeight * 0.31)
        }

        englishView.snp.updateConstraints { (make) in
            make.top.equalTo(xcodeView.snp.bottom).offset(screenHeight * 0.005)
            make.right.equalTo(backgroundView).offset(-(screenWidth * 0.015))
            make.width.equalTo(screenWidth * 0.48)
            make.height.equalTo(screenHeight * 0.31)
        }
    }
}
