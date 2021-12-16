//
//  ProfileView.swift
//  IKEA Place
//
//  Created by Claudio Silvestri on 09/12/21.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Text("Profile not avaiable")
            
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
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }

