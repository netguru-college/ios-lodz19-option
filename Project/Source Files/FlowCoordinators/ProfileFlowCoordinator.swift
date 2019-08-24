//
//  ProfileFlowCoordinator.swift
//  NetguruCollegeApp
//


import Foundation

class ProfileFlowCoordinator: FlowCoordinator {
    
    override init() {
        super.init()
        
        rootViewController = ProfileViewController() 
    }
}
