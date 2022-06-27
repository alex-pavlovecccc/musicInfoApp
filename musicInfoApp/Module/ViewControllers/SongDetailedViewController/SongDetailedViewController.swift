//
//  SongDetailedViewController.swift
//  musicInfoApp
//
//  Created by Alexander Pavlovets on 27.06.2022.
//

import UIKit

final class SongDetailedViewController: UIViewController {
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupElement()
        self.setupConstraints()
        self.bind()
    }
    
    //MARK: - ViewModel
    var viewModel: SongDetailedViewControllerProtocol = SongDetailedViewControllerViewModel()
        
    //MARK: - nib file
    private var nibDetailCell = UINib(nibName: "\(SongDetailedViewControllerCell.self)", bundle: nil)
    
    //MARK: - GUI
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(nibDetailCell, forCellReuseIdentifier:  "\(SongDetailedViewControllerCell.self)")
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    
    //MARK: - Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor), self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor), self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor)])
    }
    
    //MARK: - method
    private func setupElement(){
        self.view.addSubview(self.tableView)
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        setupConstraints()
    }
        
    private func bind() {
        viewModel.delegate = self
    }
}


//MARK: - TableViewDataSourse/ TableViewDelegate
extension SongDetailedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countSong
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = viewModel.getSong(indexPath: indexPath)
        let cell = tableView.dequeueReusableCells(type: SongDetailedViewControllerCell.self, indexPath: indexPath)
        cell.setInfo(model: song)
        return cell
    }
}

extension SongDetailedViewController: SongDetailedViewControllerDelegate {
    func tableViewReloadData() {
        self.tableView.reloadData()
    }
}
