//
//  RegisterView.swift
//  GerardRegister
//
//  Created by Luis Martinez on 04/05/2025.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    // aqui va el control de errores y nav ojo se te olvida
    @State private var errorMessage = ""
    @State private var showHome = false
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: colorScheme == .dark ? [.black, .gray] : [.indigo.opacity(0.1), .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
            VStack(spacing: 24) {
                // emoji
                Text("📝")
                    .font(.system(size: 60))
                    .symbolEffect(.bounce.down, value: name.isEmpty == false)
                
                Text("Crear Cuenta")
                    .font(.largeTitle.bold())
                    .foregroundStyle(LinearGradient(colors: [.purple, .indigo], startPoint: .leading, endPoint: .trailing))
                
                //campos
                VStack(spacing: 16) {
                 //   inputField(icon: "person", placeholder: "nombre", text: $name)
                  //  inputField(icon: "envelope", placeholder: "correo", text: $email)
                  //  secureField(icon: "lock", placeholder: "Contraseña", text: $password)
                   // secureField(icon: "lock.rotation", placeholder: "Confirmar contraseña", text:$confirmPassword)
                }
                .padding()
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 5)
                
                //Mensaje de Error
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                }
                
                //Boton de registro
                Button("Registrar") {
                    register()
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .buttonStyle(.borderedProminent)
                .tint(.indigo)
                .controlSize(.large)
                .padding(.horizontal)
                .shadow(color: .indigo.opacity(0.3), radius: 5, x: 0, y: 3)
                
                
                Spacer()
            }
            .padding()
            .navigationDestination(isPresented: $showHome) {
                HomeView()
            }
        }
    }
}
    private func register() {
        withAnimation {
            if name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
                errorMessage = "Por favor, completa todos los campos."
                return
            }
            
            if !email.contains("@") {
                errorMessage = "Ingresa un correo válido."
                return
            }
            if password != confirmPassword {
                errorMessage = "Las contraseñas no coinciden."
                return
            }
            errorMessage = ""
            showHome = true  // aqui despes colocare el FIREBASE
        }
    }
    
    //subvistas
}



#Preview {
    RegisterView()
}
