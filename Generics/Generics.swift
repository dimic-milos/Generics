//
//  Generics.swift
//  Generics
//
//  Created by Milos Dimic on 11/29/18.
//  Copyright © 2018 Milos Dimic. All rights reserved.
//

import UIKit

// MARK: Ways of declaring

class Foo<T: UIViewController> {
    
    let type: T
    
    init(type: T) {
        self.type = type
    }
}

class Gru<T> where T : UIScrollView {
    
    let type: T
    
    init(type: T) {
        self.type = type
    }
}

// MARK: Usage Examples

class CustomNavigationController: Foo<UINavigationController> {
    func setUp() {
        _ = type.popViewController(animated: true)
    }
}

class CustomViewController: Foo<UIViewController> {
    func setUp() {
        _ = type.viewDidLoad()
    }
}

class CustomTableView: Gru<UITableView> {
    func setUp() {
        _ = type.cellForRow(at: IndexPath(row: 0, section: 0))
    }
}

class CustomScrollView: Gru<UIScrollView> {
    func setUp() {
        _ = type.scrollRectToVisible(CGRect.init(), animated: true)
    }
}

