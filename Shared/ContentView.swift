//
//  ContentView.swift
//  Shared
//
//  Created by Tony S on 12/06/21.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🚗","🏍","✈️","🚂","🚲","🐎","🚁","🏎"]
    @State var emojiCount = 4
    
    var body: some View{
    
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                    ForEach(emojis[0..<emojiCount], id:\.self, content: { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    })
                }
                .padding(.horizontal)
            }
            Spacer()
            
            HStack{
                add
                Spacer()
                remove
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }

    }
    
    var add: some View{
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
        
    }
    
    var remove: some View{
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
        ZStack{
            
            let rect = RoundedRectangle(cornerRadius: 25.0)
            
            if isFaceUp {
                rect.fill(Color.white)
                rect.strokeBorder(lineWidth: 3.0)
                Text(content).font(.largeTitle)
                
            } else {
                rect.fill()
            }
        }
        .foregroundColor(.red)
        .onTapGesture(perform: {
            isFaceUp = !isFaceUp
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
    
        Group {
            ContentView()
                .previewDevice("iPhone 12 mini")
        }
    }
}
 
