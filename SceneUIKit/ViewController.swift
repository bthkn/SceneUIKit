//
//  ViewController.swift
//  SceneUIKit
//
//  Created by Mikhail Perov on 19.10.2020.
//

import UIKit

private extension CGFloat {
  static let inset: CGFloat = 20
  static let padding: CGFloat = 12
}

class ViewController: UIViewController {
  
  lazy var containerView: UIView = {
    let view = UIView()
    
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
  }()
  
  lazy var label: UILabel = {
    let label = UILabel()
    
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 16, weight: .regular)
    label.textColor = .label
    label.numberOfLines = 0
    label.textAlignment = .center
    label.adjustsFontForContentSizeCategory = true
    label.text = "Hello, World!"
    
    return label
  }()
  
  // MARK: Initalizers
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    
    setUpViews()
  }
  
  private func setUpViews() {
    view.addSubview(containerView)
    
    containerView.addSubview(label)
    
    setUpConstraints()
  }
  
  private func setUpConstraints() {
    var constraints: [NSLayoutConstraint] = []
    
    constraints += createContainerViewConstraints()
    constraints += createLabelConstraints()
    
    NSLayoutConstraint.activate(constraints)
  }
  
  private func createContainerViewConstraints() -> [NSLayoutConstraint] {
    let leading = containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: .inset)
    let trailing = containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -.inset)
    let centerY = containerView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
    
    return [leading, trailing, centerY]
  }
  
  private func createLabelConstraints() -> [NSLayoutConstraint] {
    let top = label.topAnchor.constraint(equalTo: containerView.topAnchor, constant: .padding)
    let bottom = label.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -.padding)
    let leading = label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .padding)
    let trailing = label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -.padding)
    
    return [top, bottom, leading, trailing]
  }


}

