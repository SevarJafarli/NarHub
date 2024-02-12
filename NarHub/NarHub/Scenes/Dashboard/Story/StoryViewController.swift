//
//  StoryViewController.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 01.02.24.
//

import UIKit


class StoryViewController: UIViewController {
    
    let stories: [StoryModel]
    let selectedIndex: Int
    
    var onCompletion: (_ index: Int?) -> ()
    
    
    lazy var mainView: StoryView = {
        let view = StoryView(stories: stories, selectedIndex: selectedIndex)
        view.configure(with: stories[selectedIndex])
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeToBottomToClose = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeToBottomToClose.direction = .down
        mainView.addGestureRecognizer(swipeToBottomToClose)
    }
    
    override func loadView() {
        super.loadView()
        self.view = mainView
        mainView.delegate = self
    }
    
    //MARK: Init
    
    init(stories: [StoryModel], selectedIndex: Int, onCompetion: @escaping (_ index: Int?) -> ()) {
        self.stories = stories
        self.selectedIndex = selectedIndex
        self.onCompletion = onCompetion
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        self.closeStory()
    }
    
    fileprivate func closeStory() {
        self.dismiss(animated: true)
        self.onCompletion(nil)
    }
}
//MARK: StoryViewDelegate

extension StoryViewController: StoryViewDelegate {
    
    func onStoryClosed() {
        self.closeStory()
    }
    
    func onStoryWatched(at index: Int) {
        self.onCompletion(index)
    }
}
