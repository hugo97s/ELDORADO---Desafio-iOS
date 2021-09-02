//
//  SegmentedScreen.swift
//  Desafio-iOS
//
//  Created by Hugo Santos on 01/09/21.
//

import SwiftUI

enum SegmentedInfoView: CaseIterable {
    case item1
    case item2
}

extension SegmentedInfoView {
    
    var title: String {
        switch self {
            case .item1: return "ITEM1"
            case .item2: return "ITEM2"
        }
    }
    
}

struct SegmentedScreen: View {
    
    
    @State private var selection: SegmentedInfoView = .item1
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 6) {
                
                Picker("Select", selection: $selection) {
                    ForEach(SegmentedInfoView.allCases, id: \.self) { info in
                        Text(info.title).tag(info)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                switch selection {
                    case .item1:
                        
                        Text("Item1")
                            
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 180)
                    case .item2:
                        Text("Item2")
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 180)
                }
                
            }
            .navigationTitle("Desafio iOS")
        }
    }
}

struct VegetableDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedScreen()
    }
}
