//
//  WelcomeView.swift
//  GerardRegister
//
//  Created by Luis Martinez on 04/05/2025.
//

import SwiftUI


struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.purple, .blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    Spacer()
                    
                    Text("GerardRegister")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Bienvenido a tu app de Registro")
                        .font(.title2)
                        .foregroundColor(.white.opacity(0.8))
                    
                    Spacer()
                    
                    VStack(spacing: 16) {
                        NavigationLink(destination: LoginView()) {
                            Text("Iniciar Sesión")
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                .padding()
                                .background(Color.white.opacity(0.2))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                        
                        Text("Aun no tienes cuenta?")
                            .foregroundColor(.white)
                        
                        NavigationLink(destination: RegisterView()) {
                            Text("Crear Cuenta")
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                .padding()
                                .background(Color.white.opacity(0.2))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
