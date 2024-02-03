import SwiftUI

struct LaunchScreenView: View {
    @State private var isJumping = true
    
    var body: some View {
        ZStack {
            Color(hex: "879957").edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Backyard Beaks")
                    .font(.largeTitle)
                    .padding(.top, 30)
                    .foregroundColor(.white)
                
                Spacer()
                
                Image("chick")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 600)
                    .offset(y: isJumping ? -100 : 0)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                            isJumping.toggle()
                        }
                    }
                    .onTapGesture {
                        withAnimation {
                            isJumping = false
                        }
                    }
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        isJumping = false
                    }
                }) {
                    Text("Get Started")
                        .foregroundColor(.black)
                        .frame(width: 200, height: 50)
                        .background(Color.white)
                        .cornerRadius(25)
                }
                .padding()
            }
            .background(
                Ellipse()
                    .fill(Color.white)
                    .frame(width: 300, height: 450)
                    .offset(y: -50)
            )
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

