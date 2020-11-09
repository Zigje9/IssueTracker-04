//
//  MilestoneListViewController.swift
//  IssueTracker
//
//  Created by Byoung-Hwi Yoon on 2020/11/08.
//

import UIKit

class MilestoneListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var adapter: MilestoneCollectionViewAdapter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        
        let adapter = MilestoneCollectionViewAdapter(dataManager: MilestoneDatasourceManager())
        self.adapter = adapter
        adapter.loadData()
        collectionView.dataSource = adapter
        collectionView.register(MilestoneListCell.self, forCellWithReuseIdentifier: MilestoneListCell.identifier)
        
        NotificationCenter.default.addObserver(self, selector: #selector(milestoneDeleteRequested(notification:)), name: .milestoneDeleteRequested, object: nil)
    }
    
    @objc private func milestoneDeleteRequested(notification: Notification) {
        guard let milestoneNo = notification.userInfo?["MilestoneNo"] as? Int else {
            return
        }
        adapter?.dataManager.delete(with: milestoneNo) { [weak self] in
            self?.collectionView.deleteItems(at: [$0])
        }
    }
}

extension MilestoneListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
    }
}
