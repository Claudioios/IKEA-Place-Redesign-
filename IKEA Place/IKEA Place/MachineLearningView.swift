//
//  MachineLearningView.swift
//  IKEA Place
//
//  Created by Claudio Silvestri on 13/12/21.
//

import SwiftUI

struct MachineLearningView: View {
    
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack{
            Text("MachineLearning not avaiable")
            
            VStack{
                HStack{
                    Button("Done") {
                        dismiss()
                    }
                    .padding()
                    Spacer()

            }
                Spacer()


            }
        }
    }
}

struct MachineLearningView_Previews: PreviewProvider {
    static var previews: some View {
        MachineLearningView()
    }
}
