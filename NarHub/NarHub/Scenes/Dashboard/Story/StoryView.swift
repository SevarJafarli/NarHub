
import UIKit
import SnapKit
import SDWebImage
import NarHubUIKit

protocol StoryViewDelegate: AnyObject {
    func onStoryClosed()
    func onStoryWatched(at index: Int)
}

class StoryView: UIView {
    
    // MARK: - Subviews
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var progressBar: StoryProgressBar = {
        let progressBar = StoryProgressBar()
        return progressBar
    }()
    
    
    private lazy var title: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.boldTitleSize20.fontStyle
        lbl.textColor = .lightGray
        lbl.numberOfLines = 0
        return lbl
    }()
    
    // MARK: - Properties
    
    var timer: Timer?
    var stories: [StoryModel]
    var selectedIndex: Int
    
    
    weak var delegate: StoryViewDelegate?
    
    // MARK: - Init
    
    init(stories:  [StoryModel], selectedIndex: Int) {
        self.stories = stories
        self.selectedIndex = selectedIndex
        super.init(frame: .zero)
        self.setupView()
        self.setupGestureRecognizers()
        self.setupConstraints()
        self.startStory()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup
    
    private func setupView() {
        self.addSubview(self.imageView)
        self.addSubview(self.progressBar)
        self.addSubview(self.title)
    }
    //MARK: Setup gestures
    
    private func setupGestureRecognizers() {
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        leftSwipe.direction = .left
        self.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        rightSwipe.direction = .right
        self.addGestureRecognizer(rightSwipe)
        
        let centerTap = UITapGestureRecognizer(target: self, action: #selector(centerAreaTapped))
        self.addGestureRecognizer(centerTap)
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        longPressGesture.minimumPressDuration = 0.2
        self.addGestureRecognizer(longPressGesture)
    }
    
    
    // MARK: - Gesture Recognizers
    
    @objc func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began:
            self.pauseStory()
        case .ended, .cancelled:
            self.resumeStory()
        default:
            break
        }
    }
    
    // MARK: - Story Progress Management
    
    func loadStory(atIndex index: Int) {
        self.configure(with: stories[index])
        print("Loading story at \(index)")
        self.delegate?.onStoryWatched(at: index)
        self.startStory()
    }
    
    private func setupConstraints() {
        self.imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.progressBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(2)
        }
        
        self.title.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-16)
        }
    }
    
    
    // MARK: - Public
    
    public func configure(with storyModel: StoryModel) {
        let url = URL(string: storyModel.url)
        self.imageView.sd_setImage(with: url)
        self.title.text = storyModel.title
    }
}

//MARK: Progress bar

extension StoryView {
    func startStory() {
        progressBar.progress = 0.0
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(updateProgressBar), userInfo: nil, repeats: true)
    }
    
    func pauseStory() {
        timer?.invalidate()
    }
    
    func resumeStory() {
        let remainingTime = (1.0 - progressBar.progress) * 3.0
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(updateProgressBar), userInfo: nil, repeats: true)
        timer?.fireDate = Date().addingTimeInterval(TimeInterval(remainingTime))
    }
    
    func closeStoryView() {
        timer?.invalidate()
        delegate?.onStoryClosed()
    }
}
//MARK: Handle gestures

extension StoryView {
    // MARK: - User Interaction Handlers
    
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        timer?.invalidate()
        if gesture.direction == .left {
            self.showNextStory()
        } else if gesture.direction == .right {
            self.showPreviousStory()
        }
    }
    
    @objc func centerAreaTapped() {
        self.closeStoryView()
    }
    
    @objc func updateProgressBar() {
        self.progressBar.progress += 0.05 / 3.0
        if self.progressBar.progress >= 1.0 {
            self.closeStoryView()
        }
    }
    
    func showNextStory() {
        if self.selectedIndex < self.stories.count - 1 {
            self.selectedIndex += 1
            print("Next story index: \(self.selectedIndex)")
            self.loadStory(atIndex: self.selectedIndex)
            
        } else {
            self.closeStoryView()
        }
    }
    
    func showPreviousStory() {
        if self.selectedIndex > 0 {
            self.selectedIndex -= 1
            print("Previous story index: \(self.selectedIndex)")
            self.loadStory(atIndex: self.selectedIndex)
        }
    }
}
