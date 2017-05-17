import UIKit
import SnapKit

class HobbysView: CustomUIView {

    lazy var skateboardingView: ImageWithDescriptionView = {
        var image = ImageWithDescriptionView()
        return image
    }()

    lazy var bjjView: ImageWithDescriptionView = {
        var image = ImageWithDescriptionView()
        return image
    }()

    lazy var basketballView: ImageWithDescriptionView = {
        var image = ImageWithDescriptionView()
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
        addSubview(skateboardingView)
        addSubview(basketballView)
        addSubview(bjjView)

        setNeedsUpdateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        let screenHeight = frame.size.height
        let screenWidth = self.frame.size.width
        let viewsHeight = screenHeight / 3

        basketballView.snp.updateConstraints { make in
            make.top.equalTo(self)
            make.left.right.equalTo(self)
            make.width.equalTo(screenWidth)
            make.height.equalTo(viewsHeight)
        }

        skateboardingView.snp.updateConstraints { make in
            make.top.equalTo(basketballView.snp.bottom)
            make.left.right.equalTo(self)
            make.width.equalTo(screenWidth)
            make.height.equalTo(viewsHeight)
        }

        bjjView.snp.updateConstraints { make in
            make.top.equalTo(skateboardingView.snp.bottom)
            make.left.right.equalTo(self)
            make.width.equalTo(screenWidth)
            make.height.equalTo(viewsHeight)
        }
    }
}
