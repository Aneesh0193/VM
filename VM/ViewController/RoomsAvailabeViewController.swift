//
//  RoomsAvailabeViewController.swift
//  VM
//
//  Created by Aneesh on 12/05/22.
//

import UIKit


final class RoomsAvailabeViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var roomsTableView: UITableView!
    
    //MARK: - Variables
    private var availableRoomsViewModel: AvailableRoomsViewModel!
    private let httpUtility = HttpUtility()
 
    
    
    //MARK: - ViewLife Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
        getRoomsAvailability()
    }
    
    //MARK: - Setupview
    private func setupview() {
        availableRoomsViewModel = AvailableRoomsViewModel(apiService: httpUtility)
        self.title = kRooms
    }
    
    //MARK: - GetRoomsAvailability
    private func getRoomsAvailability() {
        availableRoomsViewModel.getRoomsList { [weak self] success, response, error in
            guard let self = self else { return }
            success ? self.loadTableView() : ()
        }
    }
    
    //MARK: - Load TableView
    private func loadTableView() {
        roomsTableView.delegate = self
        roomsTableView.dataSource = self
        roomsTableView.reloadData()
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension RoomsAvailabeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return availableRoomsViewModel.getNumberOfRowsInSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kRoomCellIdentifier) as? RoomsTableViewCell else {
            return UITableViewCell()
        }
        guard let model = availableRoomsViewModel.getData(index: indexPath.row) else { return cell }
        cell.occupiedStatusLabel.text = availableRoomsViewModel.getRoomsAvailability(index: indexPath.row)
        cell.maximumOccupancyLabel.text = "\(model.maxOccupancy ?? 0)"
        cell.roomNumberLabel.text = model.id
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

