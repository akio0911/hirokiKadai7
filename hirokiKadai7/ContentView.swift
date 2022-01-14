import SwiftUI

struct ContentView: View {
    @State private var num1: Int?
    @State private var num2: Int?
    @State private var num3: Int?
    @State private var num4: Int?
    @State private var sum: Int = 0
    @State private var difference: Int = 0
    @FocusState private var focus: Bool
    
    var body: some View {
        TabView {
            ZStack {
                Color.orange.edgesIgnoringSafeArea(.top)
                VStack {
                    NumberInputView(num: $num1).focused($focus)
                    NumberInputView(num: $num2).focused($focus)
                    Button(action: {
                        sum = (num1 ?? 0) + (num2 ?? 0)
                        focus = false
                    }) {
                        Text("Button")
                    }
                    .padding()
                    
                    Text("\(sum)")
                }
            }
            .tabItem{ Text("item1") }
            
            ZStack {
                Color.mint.edgesIgnoringSafeArea(.top)
                VStack {
                    NumberInputView(num: $num3).focused($focus)
                    NumberInputView(num: $num4).focused($focus)
                    Button(action: {
                        difference = (num3 ?? 0) - (num4 ?? 0)
                        focus = false
                    }) {
                        Text("Button")
                    }
                    .padding()
                    
                    Text("\(difference)")
                }
            }
            .tabItem{ Text("item2") }
        }
    }
}

struct NumberInputView: View {
    @Binding var num: Int?
    
    var body: some View{
        TextField("", value: $num, formatter: NumberFormatter())
            .padding()
            .keyboardType(.numberPad)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
