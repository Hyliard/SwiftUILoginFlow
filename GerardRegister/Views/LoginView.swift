//
//  LoginView.swift
//  GerardRegister
//
//  Created by Luis Martinez on 04/05/2025.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showHome = false
    @State private var emailError = ""
    @State private var passwordError = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.blue, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    Image(systemName: "#")
                    
                    Text("Iniciar sesión")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    // Aqui va lo que vamos a ingresar
                    
                    Group {
                        TextField("Correo Electronico", text: $email)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(40)
                        
                        //aqui mostramos error del correo ojo
                        if !emailError.isEmpty {
                            Text(emailError)
                                .foregroundColor(.red)
                                .font(.caption)
                                .padding(.horizontal)
                        }
                        
                        SecureField("Contraseña", text: $password)
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(40)
                    }
                    .padding(.horizontal)
                    
                    if !passwordError.isEmpty {
                        Text(passwordError)
                            .foregroundColor(.red)
                            .font(.caption)
                            .padding(.horizontal)
                    }
                    
                    
                    //Boton para iniciar sesión
                    
                    Button(action: login) {
                        Text("Ingresar")
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(40)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                
                // Navegacion oculta
                .navigationDestination(isPresented: $showHome) {
                    HomeView()
                }
                
            }
        }
    }
    func login() {
        print("Intentando iniciar sesión con: \(email) y contraseña: \(password)")
        
        emailError = ""
        passwordError = ""
        
        //Validacion de correo
        if !isValidEmail(email) {
            emailError = "Por favor ingrese un correo válido."
        }
        
        // validacion pass
        if password.count < 6 {
            passwordError = "La contraseña debe tener al menos 6 caracteres."
        }
        
        // Si todo esta correcto
        // validacion de campos estan vacios o no
        if !email.isEmpty && !password.isEmpty {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                showHome = true
            }
        }
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
}

#Preview {
    LoginView()
}
