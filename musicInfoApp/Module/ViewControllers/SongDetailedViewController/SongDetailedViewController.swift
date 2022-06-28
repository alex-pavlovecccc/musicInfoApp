//
//  SongDetailedViewController.swift
//  musicInfoApp
//
//  Created by Alexander Pavlovets on 27.06.2022.
//

import UIKit

final class SongDetailedViewController: UIViewController {
    
    //MARK: size button
    private let buttonSize = CGSize(width: 32, height: 32)
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewConlor()
        self.setupElement()
        self.setupConstraints()
        self.bind()
    }
    
    //MARK: - ViewModel
    var viewModel: SongDetailedViewControllerProtocol = SongDetailedViewControllerViewModel()
    
    //MARK: - nib file
    private let nibDetailCell = UINib(nibName: "\(SongDetailedViewControllerCell.self)", bundle: nil)
    private let nibImageAndButtonCell = UINib(nibName: "\(ImageAndButtonsDetailCell.self)", bundle: nil)
    
    //MARK: - GUI
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(nibDetailCell, forCellReuseIdentifier:  "\(SongDetailedViewControllerCell.self)")
        table.register(nibImageAndButtonCell, forCellReuseIdentifier:  "\(ImageAndButtonsDetailCell.self)")
        table.separatorStyle = .none
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "arrow"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([ self.closeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8),
                                      self.closeButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                      self.closeButton.heightAnchor.constraint(equalToConstant: self.buttonSize.height),
                                      self.closeButton.widthAnchor.constraint(equalToConstant: self.buttonSize.width)])
        
        NSLayoutConstraint.activate([self.tableView.topAnchor.constraint(equalTo: self.closeButton.bottomAnchor),
                                     self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
                                     self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
                                     self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
    }
    
    //MARK: - method
    private func setupElement(){
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.closeButton)
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        setupConstraints()
    }
    
    private func bind() {
        viewModel.delegate = self
    }
    
    private func setupViewConlor(){
        self.view.backgroundColor = .white
    }
    
    //MARK: Action
    @objc func closeButtonDidTap(){
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - TableViewDataSourse/ TableViewDelegate
extension SongDetailedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let song = viewModel.getSong() else { return UITableViewCell() }
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCells(type: ImageAndButtonsDetailCell.self, indexPath: indexPath)
            cell.setter(model: song)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCells(type: SongDetailedViewControllerCell.self, indexPath: indexPath)
            cell.setInfo(model: song)
            return cell
        }
        return UITableViewCell()
    }
}

//MARK: - SongDetailedViewControllerDelegate
extension SongDetailedViewController: SongDetailedViewControllerDelegate {
    func tableViewReloadData() {
        self.tableView.reloadData()
    }
}
