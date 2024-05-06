
import SwiftUI

struct Playground: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var color1: Color
    @Binding var color2: Color // Raw accent color
    @Binding var accentText: Color // Adjusted accent color
    @State private var useAccentText: Bool = true // Toggle Adaptive Color

    
    var onAccent: Color
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    
                    //Toggle Adaptive Color
                    VStack (alignment: .leading){
                        Toggle("Adaptive Color ✨", isOn: $useAccentText)
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .stroke(Color(.separator).opacity(0.6), lineWidth: 1)
                                    .background(RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .fill(Color(.secondarySystemGroupedBackground)))
                            }
                        Text("Adaptive color will adjust the selected accent color to meet minimum contrast.")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            }
                    .padding(.bottom)
                    
                    
                    
                    // Banner Start
                    HStack(alignment: .top) {
                        Image(systemName: "info.circle")
                            .imageScale(.small)
                            .symbolRenderingMode(.monochrome)
                            .font(.title2)
                            .foregroundStyle(useAccentText ? accentText : color2)
                        
                        VStack {
                            Text("Info")
                                .font(.system(.headline, weight: .bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .clipped()
                                .foregroundStyle(useAccentText ? accentText : color2)
                            Text("There is no interaction in this screen! Do not tap anywhere on the screen!")
                                .font(.callout)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .clipped()
                                .foregroundStyle(.primary.opacity(0.75))
                        }
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke((useAccentText ? accentText : color2).opacity(0.2), lineWidth: 1)
                            .background(RoundedRectangle(cornerRadius: 16, style: .continuous).fill((useAccentText ? accentText : color2).opacity(0.1)))
                    }
                    // Banner END
                    
                    // Card 1 Start
                    VStack {
                        Text("What is WCAG?")
                            .font(.system(.headline, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .clipped()
                            .foregroundStyle(.primary)
                        Text("Web Content Accessibility Guidelines (WCAG) is developed by W3C with a goal of providing a single shared standard for web content accessibility.")
                            .font(.callout)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .clipped()
                            .foregroundStyle(.secondary)
                        Text("Learn more")
                            .font(.system(.callout, weight: .semibold))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .clipped()
                            .foregroundStyle(onAccent)
                            .background(color2)
                            .mask { RoundedRectangle(cornerRadius: 12, style: .continuous) }
                        
                        Text("Bookmark")
                            .font(.system(.callout, weight: .semibold))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .clipped()
                            .foregroundStyle(.primary)
                            .background(Color(.secondarySystemFill))
                            .mask { RoundedRectangle(cornerRadius: 12, style: .continuous) }
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Color(.separator).opacity(0.6), lineWidth: 1)
                            .background(RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color(.secondarySystemGroupedBackground)))
                    }
                    // Card 1 End
                    
                    
                    
                    // Card 2 Start
                    VStack {
                        VStack(spacing: 16) {
                            ForEach(0..<3) { _ in // Replace with your data model here
                                HStack(alignment: .top, spacing: 16) {
                                    Image(systemName: "doc.text")
                                        .imageScale(.small)
                                        .symbolRenderingMode(.monochrome)
                                        .foregroundStyle(onAccent)
                                        .font(.system(.title3, weight: .regular))
                                        .frame(width: 32, height: 32)
                                        .clipped()
                                        .background(color2)
                                        .mask { RoundedRectangle(cornerRadius: 8, style: .continuous) }
                                    VStack(alignment: .leading, spacing: 3) {
                                        // Title
                                        Text("Collaborate in Messages")
                                            .font(.system(.subheadline, weight: .semibold))
                                        // Description
                                        Text("Easily share, discuss, and see updates about your presentation.")
                                            .font(.footnote)
                                            .foregroundStyle(.secondary)
                                    }
                                    .fixedSize(horizontal: false, vertical: true)
                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Color(.separator).opacity(0.6), lineWidth: 1)
                            .background(RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color(.secondarySystemGroupedBackground)))
                    }
                    // Card 2 End
                    
                    // Card 3 Start
                    VStack(spacing: 16) {
                        VStack(alignment: .leading) {
                            Text("Members")
                                .font(.headline)
                            Text("Members in this group will be able to add other members and edit this event!")
                                .foregroundStyle(.secondary)
                                .font(.body)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                        HStack(spacing: 10) {
                            Image(systemName: "plus")
                                .symbolRenderingMode(.monochrome)
                                .frame(width: 40, height: 40)
                                .clipped()
                                .background(Color(.tertiarySystemFill))
                                .mask { RoundedRectangle(cornerRadius: 30, style: .continuous) }
                                .foregroundStyle(useAccentText ? accentText : color2)
                            Text("Add Members")
                                .foregroundStyle(useAccentText ? accentText : color2)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                        HStack(spacing: 10) {
                            Text("A")
                                .frame(width: 40, height: 40)
                                .clipped()
                                .foregroundStyle(onAccent)
                                .background(color2)
                                .mask { RoundedRectangle(cornerRadius: 30, style: .continuous) }
                            Text("Andrew Simons")
                                .foregroundStyle(.primary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                        HStack(spacing: 10) {
                            Text("J")
                                .frame(width: 40, height: 40)
                                .clipped()
                                .foregroundStyle(onAccent)
                                .background(color2)
                                .mask { RoundedRectangle(cornerRadius: 30, style: .continuous) }
                            Text("James Clear")
                                .foregroundStyle(.primary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                        HStack(spacing: 10) {
                            Text("W")
                                .frame(width: 40, height: 40)
                                .clipped()
                                .foregroundStyle(onAccent)
                                .background(color2)
                                .mask { RoundedRectangle(cornerRadius: 30, style: .continuous) }
                            Text("William")
                                .foregroundStyle(.primary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Color(.separator).opacity(0.6), lineWidth: 1)
                            .background(RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color(.secondarySystemGroupedBackground)))
                    }
                    // Card 3 End
                    
                    // Message Card Start
                    VStack {
                        HStack {
                            Text("Hi, I am facing problem with the recent update. Please help me on that.")
                                .font(.body)
                                .frame(width: 200, alignment: .leading)
                                .clipped()
                                .foregroundStyle(.primary)
                                .padding(12)
                                .background(Color(.systemFill))
                                .mask { RoundedRectangle(cornerRadius: 16, style: .continuous) }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                        HStack {
                            Text("Hey 👋, can you give more details on this. Thanks")
                                .font(.body)
                                .frame(width: 200, alignment: .leading)
                                .clipped()
                                .foregroundStyle(onAccent)
                                .padding(12)
                                .background(color2)
                                .mask { RoundedRectangle(cornerRadius: 16, style: .continuous) }
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .clipped()
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Color(.separator).opacity(0.6), lineWidth: 1)
                            .background(RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color(.secondarySystemGroupedBackground)))
                    }
                    // Message Card End
                    
                    // Reminder card Start
                    VStack(spacing: 16) {
                        VStack(alignment: .leading) {
                            Text("Reminder")
                                .font(.headline)
                            Text("Reminders will be sent every 5 minutes. You can always turnoff this in settings.")
                                .foregroundStyle(.secondary)
                                .font(.body)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                        // Tip Section
                        HStack(spacing: 0) {
                            // Tip
                            HStack {
                                Text("5 min")
                                    .foregroundStyle(onAccent)
                                    .font(.callout)
                            }
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .clipped()
                            .background(color2)
                            .mask { RoundedRectangle(cornerRadius: 8, style: .continuous) }
                            // Tip
                            HStack {
                                Text("10 min")
                                    .font(.callout)
                            }
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .clipped()
                            .background(.clear)
                            .mask { RoundedRectangle(cornerRadius: 8, style: .continuous) }
                            // Tip
                            HStack {
                                Text("15 min")
                                    .font(.callout)
                            }
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .clipped()
                            .background(.clear)
                            .mask { RoundedRectangle(cornerRadius: 8, style: .continuous) }
                        }
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .padding(12)
                        .background(Color(.tertiarySystemFill))
                        .mask { RoundedRectangle(cornerRadius: 12, style: .continuous) }
                        HStack {
                            Image(systemName: "checkmark.square.fill")
                                .imageScale(.large)
                                .symbolRenderingMode(.monochrome)
                                .foregroundStyle(useAccentText ? accentText : color2)
                            Text("Make this as default")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .background {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Color(.separator).opacity(0.6), lineWidth: 1)
                            .background(RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color(.secondarySystemGroupedBackground)))
                    }
                    // Reminder card End
                    
                    // Download Card Start
                    VStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Downloading…")
                                .font(.headline)
                            HStack {
                                // Progress
                                Rectangle()
                                    .fill(color2)
                                    .frame(width: 180)
                                    .clipped()
                            }
                            .frame(maxWidth: .infinity, maxHeight: 6, alignment: .leading)
                            .clipped()
                            .background(Color(.tertiarySystemFill))
                            .mask { RoundedRectangle(cornerRadius: 10, style: .continuous) }
                            Text("5 minutes remaining")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .background {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Color(.separator).opacity(0.6), lineWidth: 1)
                            .background(RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color(.secondarySystemGroupedBackground)))
                    }
                    // Download Card End
                    
                    HStack(alignment: .firstTextBaseline) {
                        Text("🐣 Upnext APCA✨")
                            .imageScale(.large)
                    }
                    .padding(.top, 24)
                    .foregroundStyle(useAccentText ? accentText : color2)
                    .font(.subheadline)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 0)
                .padding(.horizontal, 16)
                .overlay(alignment: .top) {
                    Group {
                        
                    }
                }
            }
            .navigationBarTitle("Demo", displayMode: .inline)
            .navigationBarItems(leading: Button("Close") {
                presentationMode.wrappedValue.dismiss()
            }
                .foregroundColor(useAccentText ? accentText : color2)
            )
        }
        
    }
}



#Preview {
    Playground(color1: .constant(.white),color2: .constant(.blue),accentText: .constant(.blue),onAccent: .white)
}


