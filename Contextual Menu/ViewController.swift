//
//  ViewController.swift
//  Contextual Menu
//
//  Created by Admin on 3/7/21.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isToolbarHidden = false
        let trashAction = UIAction(title: "") { (_) in
            print("Trash")
        }
        
        let destructiveAction = UIAction(title: "Destructive", attributes: .destructive) { (_) in
            print("Destructive")
        }
        
        let menu = UIMenu(title: "", children: [
            UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up"), handler: { (_) in }),
            UIAction(title: "Mail", image: UIImage(systemName: "envelope"), handler: { (_) in }),
            UIAction(title: "Attach", image: UIImage(systemName: "paperclip"), handler: { (_) in }),
            destructiveAction
        ])
        
        self.toolbarItems = [
            UIBarButtonItem(title: nil, image: UIImage(systemName: "trash"), primaryAction: trashAction, menu: nil),
            UIBarButtonItem(systemItem: .trash, primaryAction: trashAction, menu: nil),
            .flexibleSpace(),
            UIBarButtonItem(image: UIImage(systemName: "list.number"), menu: menu)
        ]
        
        self.menuButton.menu = menu
        self.menuButton.showsMenuAsPrimaryAction = true
    }
}

