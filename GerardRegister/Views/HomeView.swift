//
//  HomeView.swift
//  GerardRegister
//
//  Created by Luis Martinez on 04/05/2025.
//

import SwiftUI

struct HomeView: View {
    // 1. Estado para efectos dinámicos
    @State private var isAnimating = false
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        VStack(spacing: 24) {
            // 2. Emoji con efecto 3D (iOS 17+)
            Text("🏡")
                .font(.system(size: 80))
                .symbolEffect(.bounce.up.byLayer, value: isAnimating)
                .rotation3DEffect(
                    .degrees(isAnimating ? 15 : 0),
                    axis: (x: 1, y: 1, z: 0)
                )
            
            // 3. Texto principal con gradiente dinámico
            Text("Bienvenido a la app")
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
                .foregroundStyle(
                    colorScheme == .dark ?
                    LinearGradient(colors: [.mint, .cyan], startPoint: .leading, endPoint: .trailing) :
                    LinearGradient(colors: [.indigo, .purple], startPoint: .leading, endPoint: .trailing)
                )
                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 2)
            
            // 4. Subtítulo con transición
            Text("Te has registrado con éxito")
                .font(.title3)
                .foregroundStyle(.secondary)
                .transition(.opacity.combined(with: .slide))
            
            // 5. Botón con estilo moderno
            Button(action: { /* Acción */ }) {
                Text("Explorar")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(colorScheme == .dark ? .mint : .indigo)
            .controlSize(.large)
            .padding(.top, 16)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            // 6. Fondo con textura (iOS 17+)
            if colorScheme == .dark {
                AnimatedBackground(colors: [.indigo.opacity(0.2), .black])
            } else {
                AnimatedBackground(colors: [.indigo.opacity(0.05), .white])
            }
        }
        .onAppear {
            // 7. Animación al aparecer
            withAnimation(.spring(duration: 1.5)) {
                isAnimating = true
            }
        }
    }
}

// Componente reutilizable para fondo animado
struct AnimatedBackground: View {
    let colors: [Color]
    @State private var startPoint = UnitPoint(x: -0.5, y: 0)
    @State private var endPoint = UnitPoint(x: 1.5, y: 1)
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: colors),
            startPoint: startPoint,
            endPoint: endPoint
        )
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.easeInOut(duration: 8).repeatForever()) {
                startPoint = UnitPoint(x: 1.5, y: 0)
                endPoint = UnitPoint(x: -0.5, y: 1)
            }
        }
    }
}
#Preview {
    HomeView()
}
