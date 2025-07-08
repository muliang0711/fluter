// 1. simple to say if we when we run : class [className] extends StateLessWidget --> We are create a div on a page
class TextStructure extends StatelessWidget {
  const TextStructure({
    super.key,
  }); // 1.1 after we create a div we need to tell flutter to init it

  @override
  Widget build(BuildContext context) {
    // 1.3 and this line tell fluterr how to build the element we define inside it a div/class
    return Column(
      // 2.1 we metion that these children (html element must be structure ads column like flexdirection : cloumn)
      children: [
        // 1️⃣ Centered Container
        Container(
          // Comtainer is just like a div we define in web
          // START :  ---------- here is how we define a div css
          color: Colors.blue.shade100, // Background color
          height: 150, // Fixed height
          width: double.infinity, // Full width
          padding: const EdgeInsets.all(16), // Inner space (like padding)
          margin: const EdgeInsets.symmetric(
            // Outer space (like margin)
            horizontal: 20,
            vertical: 10,
          ),
          alignment: Alignment.center, // Position children inside
          decoration: BoxDecoration(
            // More advanced decoration
            border: Border.all(color: Colors.blue), // Border
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          // END   :    ----------

          // START: ---------- Child widgets (like elements inside <div>)
          child: const Column(
            // children inside the div strcuture as center  : | childrenA |
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 📝 1. Text
              const Text(
                'Hello Flutter!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10), // Space between widgets
              // 🔘 2. Button
              ElevatedButton(
                onPressed: () {
                  print("Button Pressed!");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                  foregroundColor: Colors.white, // Text color
                ),
                child: const Text("Click Me"),
              ),

              const SizedBox(height: 10),

              // ✏️ 3. TextField
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter something...',
                ),
              ),

              const SizedBox(height: 10),

              // 📦 4. Another Container inside (nested div)
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.white,
                child: const Text("I'm inside another div!"),
              ),
            ],
          ),
          // END: ----------
        ),
        // Now we have a pictur like this |          BIG DIV            |
        //                                |-----------------------------|                             |
        //                                |            Div_A            |
        //                                |     text : This is...       |
        //                                |     button : Clcik ME                |
        //                                |     TextField : enter some..|
        //                                |-----------------------------|                             |
        //                                |                             |
        //                                |                             |
        //                                |                             |
        const SizedBox(
          height: 20,
        ), // it just like a empty div , purpose : used to create space between elements
        // Now we have a pictur like this |          BIG DIV            |
        //                                |-----------------------------|                             |
        //                                |            Div_A            |
        //                                |  center : text : This is... |
        //                                |-----------------------------|                             |
        //                                |             space           |
        //
        // 2️⃣ SpaceBetween Container
        Container(
          // 3.1 here we define another dic inside the father div/class
          // START :  ---------- here is how we define a div css
          color: Colors.green.shade100,
          height: 60,
          // provide more example here
          // END   :    ----------
          child: const Row(
            // children inside the div strcuture as center  : | childerenA  ___  childrenB |
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // as you can see here we define the children inside this dev must strucrure as row , simliar like [flexdirection : spaceBetween]
            children: [Text('Left Side'), Text('Right Side')],
          ),
        ),
        // Now we have a pictur like this |          BIG DIV            |
        //                                |-----------------------------|                             |
        //                                |            Div_A            |
        //                                |  center : text : This is... |
        //                                |-----------------------------|                             |
        //                                |             space           |
        //                                |-----------------------------|                             |
        //                                |            Div_B            |
        //                                | text_A               text_B |
        //                                |-----------------------------|
        const SizedBox(height: 20),
        // Now we have a pictur like this |          BIG DIV            |
        //                                |-----------------------------|                             |
        //                                |            Div_A            |
        //                                |  center : text : This is... |
        //                                |-----------------------------|                             |
        //                                |             space           |
        //                                |-----------------------------|                             |
        //                                |            Div_B            |
        //                                | text_A               text_B |
        //                                |-----------------------------|                             |
        //                                |             space           |
        //                                |-----------------------------|
        // 3️⃣ Left-Aligned Container
        Container(
          color: Colors.purple.shade100,
          height: 60,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text('This is Left-Aligned'),
        ),

        const SizedBox(height: 20),
        // Now we have a pictur like this |          BIG DIV            |
        //                                |-----------------------------|                             |
        //                                |            Div_A            |
        //                                |  center : text : This is... |
        //                                |-----------------------------|                             |
        //                                |             space           |
        //                                |-----------------------------|                             |
        //                                |            Div_B            |
        //                                | text_A               text_B |
        //                                |-----------------------------|                             |
        //                                |             space           |
        //                                |-----------------------------|
        //                                |Left_Div_A                   |
        //                                |text                         |
        //                                |-----------------------------|
        //                                |             space           |
        //                                |-----------------------------|
        // 4️⃣ Styled Input Field (Container + TextField)
        Container(
          // START : --------- styling the outer div (container)
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade400), // optional border
          ),
          // END : ---------

          // START : --------- styling the inner input field (TextField)
          child: const TextField(
            style: TextStyle(// 👈 this is where we style the input text
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: 'Enter your name', // placeholder text
              hintStyle: TextStyle(
                // 👈 style the placeholder
                color: Colors.grey,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
              border: InputBorder.none, // remove default border
              prefixIcon: Icon(Icons.person), // optional: add icon inside input
            ),
          ),
          // END : ---------
        ),

        const SizedBox(height: 20),

        // 5️⃣ Button Container
        Container(
          // This outer container acts like a <div> wrapper for the button
          // START : --------- container layout for button
          width: double
              .infinity, // 👈 makes the button stretch to full width of parent\
          padding: EdgeInsets.all(16), // Adds space inside around button
          alignment: Alignment.center, // Align the button inside the container
          // END : ---------
          child: ElevatedButton(
            // 👈 Flutter's built-in styled button
            // Start : --------- here is where you style your button css
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // 🔴 Button background color
              foregroundColor:
                  Colors.white, // ⚪ Text/icon color (like `color: white`)
            ),
            // END : ----------------
            onPressed: () {
              // ✅ Action: This runs when the button is clicked
              print("Button clicked");
            },
            // START : --------- this is where we style the button content
            child: const Text(
              'Submit',
              style: TextStyle(
                fontSize: 16, // ⬅ font size of the text
                fontWeight: FontWeight.bold, // ⬅ make text bold
                color: Colors
                    .white, // ⬅ text color (though ElevatedButton overrides by default)
              ),
            ),
            // END : ---------
          ),
        ),
      ],
    );
  }
}
