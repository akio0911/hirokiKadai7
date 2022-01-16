import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CalculationView(color: .orange, calculate: +)
                .tabItem{ Text("item1") }

            CalculationView(color: .mint, calculate: -)
                .tabItem{ Text("item2") }
        }
    }
}

struct CalculationView: View {
    @State private var num1: Int?
    @State private var num2: Int?
    @State private var result: Int = 0
    @FocusState private var focus: Bool

    let color: Color
    let calculate: (Int, Int) -> Int

    var body: some View {
        ZStack {
            color.edgesIgnoringSafeArea(.top)
            VStack {
                NumberInputView(num: $num1).focused($focus)
                NumberInputView(num: $num2).focused($focus)
                Button(action: {
                    result = calculate(num1 ?? 0, num2 ?? 0)
                    focus = false
                }) {
                    Text("Button")
                }
                .padding()

                Text("\(result)")
            }
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
