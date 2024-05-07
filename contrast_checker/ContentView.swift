
import SwiftUI

struct ContentView: View {
    @State private var color1 = Color.white
    @State private var color2 = Color.blue //background
    @State private var contrastRatio: Double = 0.0
    @State private var luminance1: Double = 0.0
    @State private var luminance2: Double = 0.0
    @State private var contrastStatus: String = ""
    @State private var showModal = false
    @State private var accentText: Color = Color.blue
    
    @Environment(\.colorScheme) var colorScheme
    
    // on-accent
    var onAccent: Color {
            contrastRatio >= 3 ? .white : .black
        }

    
    var body: some View {
        NavigationView{
        ScrollView{
            VStack {
                
                //Contrast Score Section START
                VStack{
                    Text("Contrast Ratio")
                    Text("\(String(format: "%.1f", contrastRatio)):1")
                        .font(.system(size: 44).weight(.heavy))
                }
                .padding()
                .foregroundColor((contrastRatio >= 3 ? .white : .black)) //Adaptive
//                .foregroundColor(.white) // Static White
                .frame(maxWidth: .infinity,minHeight: 120)
                .background(color2)
                .cornerRadius(60)
                .padding()
                //Contrast Score Section END
                
                
                // Button to open Playground - START
                Button("View Demo") {
                    showModal = true
                }
                .padding()
                .background(color2)
                .clipShape(Capsule())
                .foregroundColor((contrastRatio >= 3 ? .white : .black))
                .sheet(isPresented: $showModal) {  
                    // Modal presentation
                    Playground(color1: $color1, color2: $color2, accentText: $accentText, onAccent: onAccent)
                }
                // Button to open Playground - END
                                
                //Color picker section START
                VStack{
                    
                    // Color picker 2 START
                    VStack(spacing: 16){
                        colorPicker(label: "Select Color", color: $color2)
                            .onAppear{
                                self.accentText = self.color2 // Initial assignment
                                adjustAccentColorProperties() // Accent Color Change
                            }
                            .onChange(of: color2) { _, newColor in
                                self.accentText = newColor // Update when accent color change (color2)
                                calculateContrast() //
                                adjustAccentColorProperties() //⭐️⭐️⭐️ HSB
                            }
                        
                        Text("Luminance: \(String(format: "%.2f",luminance2))")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.fill.quaternary)
                            .cornerRadius(10)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.separator, lineWidth: 1)
                        
                    )
                    // Color picker 2 END
                    
//                                        Display color1 as non-interactive
                    //                    VStack {
                    //                        HStack{
                    //                            Text("Foreground Fixed!")
                    ////                                .padding()
                    //
                    //                            Spacer()
                    //                            HStack {
                    //                                Ellipse()
                    //                                        .frame(width: 24, height: 24)
                    //                                        .foregroundColor(.white) // White fill color
                    //                                        .overlay(
                    //                                            Circle()
                    //                                                .stroke(Color.gray.opacity(0.4), lineWidth: 2)
                    //                                                .frame(width: 24, height: 24)
                    //                                        )
                    //                                Text("#FFFFFF")
                    //                                    .foregroundColor(.secondary)
                    //                            }
                    //                        }
                    //
                    //                        Text("Luminance: \(String(format: "%.2f",luminance1))")
                    //                            .padding()
                    //                            .frame(maxWidth: .infinity)
                    //                            .background(.fill.quaternary)
                    //                            .cornerRadius(10)
                    //                            .foregroundColor(.secondary)
                    //                    }
                    //                                        .padding()
                    //                                        .overlay(
                    //                                            RoundedRectangle(cornerRadius: 20)
                    //                                                .stroke(.separator, lineWidth: 1)
                    //                                        )
                    //                    Display color1 as non-interactive END
                    
                    //Score range START
                    VStack{
                        // WCAG Normal Text AA & AAA START
                        VStack{
                            
                            HStack{
                                Text("WCAG Score")
                                    .font(.system(size: 19,weight: .bold))
                                Spacer()
                            }
                            .padding(.vertical,12)
                            
                            
                            HStack {
                                Text("Normal Text")
                                    .font(.headline)
                                Spacer()
                            }
                            
                            HStack{
                                
                                Text("Minimum 4.5:1")
                                
                                Spacer()
                                
                                HStack{
                                    Text("AA")
                                    Text((contrastRatio >= 4.5 ? "✅" : "❌"))
                                }
                                .padding(.horizontal,12)
                                .padding(.vertical,8)
                                .background(.fill.quaternary)
                                .cornerRadius(24)
                                
                            }
                            HStack{
                                Text("Enhanced 7:1")
                                
                                Spacer()
                                
                                HStack{
                                    Text("AAA")
                                    Text((contrastRatio >= 7 ? "✅" : "❌"))
                                }
                                .padding(.horizontal,12)
                                .padding(.vertical,8)
                                .background(.fill.quaternary)
                                .cornerRadius(24)
                                
                            }
                            
                        }
                        // WCAG Normal Text AA & AAA END
                        
                        // WCAG Large Text AA & AAA START
                        
                        HStack {
                            Text("Large Text")
                                .font(.headline)
                            Spacer()
                        }
                        .padding(.top)
                        
                        
                        VStack{
                            HStack{
                                Text("Minimum 3:1")
                                
                                Spacer()
                                
                                HStack{
                                    Text("AA")
                                    Text((contrastRatio >= 3 ? "✅" : "❌"))
                                }
                                .padding(.horizontal,12)
                                .padding(.vertical,8)
                                .background(.fill.quaternary)
                                .cornerRadius(24)
                                
                            }
                            
                            HStack{
                                Text("Enhanced 4.5:1")
                                
                                Spacer()
                                
                                HStack{
                                    Text("AAA")
                                    Text((contrastRatio >= 4.5 ? "✅" : "❌"))
                                }
                                .padding(.horizontal,12)
                                .padding(.vertical,8)
                                .background(.fill.quaternary)
                                .cornerRadius(24)
                                
                            }
                        }
                        // WCAG Large Text AA & AAA END
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.separator, lineWidth: 1)
                    )
                    //Score range END
                }
                .padding()
                //Color picker section END
                
                
            }
        }
        .navigationTitle("Contrast Checker")
        .navigationBarTitleDisplayMode(.inline)
    }
        
}
    
    
    func colorPicker(label: String, color: Binding<Color>) -> some View {
        HStack {
            ColorPicker(label, selection: color)
            
            Text(colorHex(color.wrappedValue))
        }
    }
    
    
    
    // Calculate Contrast Ratio
    func calculateContrastRatio(_ color1: Color, _ color2: Color) -> Double {
        // Calculate luminance for each color
        let luminance1 = calculateLuminance(color1)
        let luminance2 = calculateLuminance(color2)
        
        // Using the contrast ratio formula specified by WCAG
        // A small constant value of 0.05 is added to both the numerator and denominator. To prevent the value divided by zero
        // max() to get higher value from the two colors that will be used in numerator.
        
        return (max(luminance1, luminance2) + 0.05) / (min(luminance1, luminance2) + 0.05)
    }
    
    //Luminance Calculation - sRGB color space
    func calculateLuminance(_ color: Color) -> Double {
        let ciColor = CIColor(color: UIColor(color))
        
        //linearize sRGB to RGB
        func adjust(colorComponent: CGFloat) -> CGFloat {
            return (colorComponent <= 0.04045) ? (colorComponent / 12.92) : pow((colorComponent + 0.055) / 1.055, 2.4)
        }

        let linearRed = adjust(colorComponent: ciColor.red)
        let linearGreen = adjust(colorComponent: ciColor.green)
        let linearBlue = adjust(colorComponent: ciColor.blue)

        // L = 0.2126 * R + 0.7152 * G + 0.0722 * B 👇
        return 0.2126 * linearRed + 0.7152 * linearGreen + 0.0722 * linearBlue
    }

    
    //RGB to HEX Color conversion
    func colorHex(_ color: Color) -> String {
        let uiColor = UIColor(color)
        guard let components = uiColor.cgColor.components else { return "" }
        
        let red = Int(round(components[0] * 255))
        let green = Int(round(components[1] * 255))
        let blue = Int(round(components[2] * 255))
        
        return String(format: "#%02X%02X%02X", red, green, blue)
    }
    
    //Contrast Check
    func updateContrastStatus() {
            contrastStatus = (contrastRatio >= 4.5) ? "PASS" : "FAIL"
        }
    
    // Execute after selecting color
    func calculateContrast() {
            luminance1 = calculateLuminance(color1)
            luminance2 = calculateLuminance(color2)
            contrastRatio = calculateContrastRatio(color1, color2)
            updateContrastStatus()
        }
    

//     Accent Color Change (Light & Dark Theme) 🟢
            func adjustAccentColorProperties() {
                if colorScheme == .dark && luminance2 < 0.20 {
                    // For dark mode
                    self.accentText = color2.safelyAdjustedLuminanceAndSaturation(to: 0.9, saturation: 0.6, colorScheme: .dark)
                } else if colorScheme == .light && luminance2 >= 0.4 {
                    // For light mode
                    self.accentText = color2.safelyAdjustedLuminanceAndSaturation(to: 0.65, saturation: 1, colorScheme: .light)
                }
            }
//     Accent Color Change (Light & Dark Theme) 🟢

}

// 🔴 New Approach
extension UIColor {
    func safelyAdjustedLuminanceAndSaturation(to targetLuminance: CGFloat, saturation targetSaturation: CGFloat, colorScheme: UIUserInterfaceStyle) -> UIColor {
        var hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0

        guard self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) else {
            // The color is grayscale, only adjust brightness
            let whiteValue = self.cgColor.components?.first ?? 0
            return UIColor(white: whiteValue * targetLuminance, alpha: alpha)
        }

        // Adjust brightness only to avoid adding hue to a grayscale color
        if saturation < 0.01 {
            brightness = (colorScheme == .dark) ? 0.8 : 0.3 // Adjust brightness based on the theme
        } else {
            // For colored items, adjust both luminance and saturation
            brightness = targetLuminance
            saturation = targetSaturation
        }

        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
}

extension Color {
    func safelyAdjustedLuminanceAndSaturation(to targetLuminance: CGFloat, saturation targetSaturation: CGFloat, colorScheme: ColorScheme) -> Color {
        return Color(UIColor(self).safelyAdjustedLuminanceAndSaturation(to: targetLuminance, saturation: targetSaturation, colorScheme: colorScheme == .dark ? .dark : .light))
    }
}
// 🔴 New Approach



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
