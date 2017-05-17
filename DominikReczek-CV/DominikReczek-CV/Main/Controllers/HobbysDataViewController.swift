import UIKit
import Alamofire

class HobbysDataViewController: UIViewController {

    var hobbysData: RequestItems

    convenience init() {
        self.init(with: RequestItems())
    }

    init(with requestItems: RequestItems) {

        self.hobbysData = requestItems

        super.init(nibName: nil, bundle: nil)
        self.edgesForExtendedLayout = []
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = HobbysView()
    }

    func castedHobbysView() -> HobbysView {
        return self.view as! HobbysView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func updateItems(with items: RequestItems) {
        self.hobbysData = items

        prepareData()
        prepareView()
    }

    private func prepareData() {
        loadImages()
        insertTextData()
    }

    private func prepareView() {
        customizeView()
    }

    private func loadImages() {
        if let data = hobbysData.hobbysData[0] as? APIHobbysDataModel {
            castedHobbysView().basketballView.loadImageFromURL(data.hobbysBasketballImageURL, onCompletion: { [weak self] (image) in
                guard let strongSelf = self else { return }
                strongSelf.castedHobbysView().basketballView.imageView.image = image
            })

            castedHobbysView().skateboardingView.loadImageFromURL(data.hobbysSkateboardingImageURL, onCompletion: { [weak self] (image) in
                guard let strongSelf = self else { return }
                strongSelf.castedHobbysView().skateboardingView.imageView.image = image
            })

            castedHobbysView().bjjView.loadImageFromURL(data.hobbysBJJImageURL, onCompletion: { [weak self] (image) in
                guard let strongSelf = self else { return }
                strongSelf.castedHobbysView().bjjView.imageView.image = image
            })
        }
    }

    private func insertTextData() {
        if let data = hobbysData.hobbysData[0] as? APIHobbysDataModel {
            castedHobbysView().basketballView.descriptionLabel.text = data.hobbysBasketball
            castedHobbysView().skateboardingView.descriptionLabel.text = data.hobbysSkateboarding
            castedHobbysView().bjjView.descriptionLabel.text = data.hobbysBJJ
        }
    }

    private func customizeView() {
        castedHobbysView().basketballView.imageView.alpha = 0.7
        castedHobbysView().skateboardingView.imageView.alpha = 0.7
        castedHobbysView().bjjView.imageView.alpha = 0.7
    }
}
