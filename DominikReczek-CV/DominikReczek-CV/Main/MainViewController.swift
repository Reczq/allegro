import UIKit
import SnapKit

struct RequestItems {
    var basicData = [APIResultModelProtocol]()
    var experienceData = [APIResultModelProtocol]()
    var educationData = [APIResultModelProtocol]()
    var skillsData = [APIResultModelProtocol]()
    var hobbysData = [APIResultModelProtocol]()
}

class MainViewController: UIPageViewController {

    var items: RequestItems

    let basicDataManager: APIManagerProtocol
    let experienceDataManager: APIManagerProtocol
    let educationDataManager: APIManagerProtocol
    let skillsDataManager: APIManagerProtocol
    let hobbysDataManager: APIManagerProtocol

    let basicDataViewController: BasicDataViewController
    let experienceDataViewController: ExperienceDataViewController
    let educationDataViewController: EducationDataViewController
    let skillsDataViewController: SkillsDataViewController
    let hobbysDataViewController: HobbysDataViewController

    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.basicDataViewController, self.experienceDataViewController, self.educationDataViewController, self.skillsDataViewController, self.hobbysDataViewController]
    }()

    convenience init() {
        self.init(with: RequestItems())
    }

    init(with items: RequestItems) {

        self.items = items

        let apiManager = APIManager()
        basicDataManager = apiManager.createBasicDataManager()
        experienceDataManager = apiManager.createExperienceDataManager()
        educationDataManager = apiManager.createEducationDataManager()
        skillsDataManager = apiManager.createSkillsDataManager()
        hobbysDataManager = apiManager.createHobbysDataManager()

        self.basicDataViewController = BasicDataViewController()
        self.experienceDataViewController = ExperienceDataViewController()
        self.educationDataViewController = EducationDataViewController()
        self.skillsDataViewController = SkillsDataViewController()
        self.hobbysDataViewController = HobbysDataViewController()

        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.edgesForExtendedLayout = []
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self

        updateData()
        prepareView()
    }

    private func prepareView() {
        navigationBarSetup()
        setFirstPage()
        stylePageControl()
    }

    func updateData() {
        getData { [weak self] (items) in
            guard let strongSelf = self else { return }

            strongSelf.basicDataViewController.updateItems(with: items)
            strongSelf.experienceDataViewController.updateItems(with: items)
            strongSelf.educationDataViewController.updateItems(with: items)
            strongSelf.skillsDataViewController.updateItems(with: items)
            strongSelf.hobbysDataViewController.updateItems(with: items)
        }
    }

    private func navigationBarSetup() {
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.005511839408, green: 0.005276903044, blue: 0.01095963083, alpha: 1)

        navigationController?.navigationBar.barStyle = UIBarStyle.default
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
    }

    private func setFirstPage() {
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }

    private func stylePageControl() {
        let pageControl = UIPageControl.appearance()

        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        pageControl.backgroundColor = #colorLiteral(red: 0.01862405054, green: 0.01824281923, blue: 0.04943820089, alpha: 1)
    }
}

extension MainViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else { return nil }

        let previousIndex = viewControllerIndex - 1

        guard previousIndex >= 0 else { return nil }

        guard orderedViewControllers.count > previousIndex else { return nil }

        return orderedViewControllers[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else { return nil }

        let nextIndex = viewControllerIndex + 1

        let orderedViewControllersCount = orderedViewControllers.count

        guard orderedViewControllersCount != nextIndex else { return nil }

        guard orderedViewControllersCount > nextIndex else { return nil }

        return orderedViewControllers[nextIndex]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = orderedViewControllers.index(of: firstViewController) else { return 0 }

        return firstViewControllerIndex
    }
}
