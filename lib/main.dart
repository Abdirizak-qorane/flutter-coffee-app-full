import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart'; // Correct import

void main() {
  runApp(CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CoffeeHomePage(),
    );
  }
}

// First Screen (Welcome Screen)
class CoffeeHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1610632380989-680fe40816c6?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGNvZmZlZSUyMGN1cHxlbnwwfHwwfHx8MA%3D%3D',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.coffee_rounded, color: Colors.brown[400], size: 100),
                  SizedBox(height: 10),
                  Text(
                    "Welcome to Horseed Coffee",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[400],
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Get Started",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// New Screen (Login Screen)
class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the Home Screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              Text(
                "Welcome Back",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Enter your credential to login",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Username",
                  filled: true,
                  fillColor: Colors.purple[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Password",
                  filled: true,
                  fillColor: Colors.purple[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CoffeeMenuScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text("Login", style: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 20),

              // Forgot Password Text
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                    );
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),

              // Sign Up Text
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpScreen()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo with shadow effect
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Image.network(
                    'https://img.freepik.com/premium-vector/coffee-cup-logo-design-vector-template_712837-214.jpg', // Replace with your actual logo URL
                    height: 100,
                  ),
                ),
                SizedBox(height: 20), // Space between logo and form

                // Form with shadow box
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Reset Your Password",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Enter your registered email to receive password reset instructions.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your email";
                            } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                .hasMatch(value)) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Password reset link sent to ${emailController.text}")),
                              );
                            }
                          },
                          child: Text("Send Reset Link"),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            backgroundColor: Colors.orange,
                            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for input fields
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _showForm = false; // Toggle for showing the form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Form"),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ✅ Logo with Rectangle Shadow
                Container(
                  margin: EdgeInsets.only(bottom: 20), // Space below logo
                  padding: EdgeInsets.all(10), // Padding for shadow effect
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                    boxShadow: [ // ✅ Rectangle shadow
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12), // ✅ Rounded edges for rectangle
                    child: Image.network(
                      "https://img.freepik.com/premium-vector/coffee-cup-logo-design-vector-template_712837-214.jpg", // Replace with your logo URL
                      width: 120, // Adjust logo size
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                if (!_showForm)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showForm = true;
                      });
                    },
                    child: Text("Sign Up"),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      backgroundColor: Colors.orange,
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),

                if (_showForm)
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Create an Account",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText: "Full Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your name";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your email";
                              } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                                return "Enter a valid email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: Icon(Icons.lock),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a password";
                              } else if (value.length < 6) {
                                return "Password must be at least 6 characters long";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Signing Up...")),
                                );
                              }
                            },
                            child: Text("Register"),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                              backgroundColor: Colors.orange,
                              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class CoffeeMenuScreen extends StatefulWidget {
  @override
  _CoffeeMenuScreenState createState() => _CoffeeMenuScreenState();
}

class _CoffeeMenuScreenState extends State<CoffeeMenuScreen> {
  final AdvancedDrawerController _drawerController = AdvancedDrawerController();

  final List<CoffeeItem> coffeeItems = [
    CoffeeItem(
      name: "Cappuccino",
      description: "with Oat Milk",
      price: "\$3.90",
      rating: "4.5",
      imageUrl:
      "https://www.philips.com/c-dam/b2c/master/experience/ho/philips-chef/recipe/drinks-and-ice-creams/delicious-cappuccino/delicious-cappuccino-thumb.jpg",
    ),
    CoffeeItem(
      name: "Latte",
      description: "with Almond Milk",
      price: "\$4.20",
      rating: "4.6",
      imageUrl:
      "https://www.foodandwine.com/thmb/CCe2JUHfjCQ44L0YTbCu97ukUzA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Partners-Latte-FT-BLOG0523-09569880de524fe487831d95184495cc.jpg",
    ),
    CoffeeItem(
      name: "Espresso",
      description: "Rich and Bold",
      price: "\$2.50",
      rating: "4.8",
      imageUrl:
      "https://insanelygoodrecipes.com/wp-content/uploads/2020/07/Cup-Of-Creamy-Coffee.png",
    ),
    CoffeeItem(
      name: "Macchiato",
      description: "with Caramel Drizzle",
      price: "\$4.80",
      rating: "4.7",
      imageUrl:
      "https://images.news18.com/ibnlive/uploads/2024/01/image-76-2024-01-c4b36ce27d9508ae9aa4b2f55a0b220f.jpg?impolicy=website&width=640&height=480",
    ),
  ];

  List<CoffeeItem> filteredItems = [];
  final TextEditingController searchController = TextEditingController();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    filteredItems = coffeeItems;
    searchController.addListener(_filterCoffeeItems);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _filterCoffeeItems() {
    setState(() {
      filteredItems = coffeeItems
          .where((item) =>
          item.name.toLowerCase().contains(searchController.text.toLowerCase()))
          .toList();
    });
  }

  Widget _buildCoffeeGrid() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Icon(Icons.location_on, color: Colors.red, size: 24),
              SizedBox(width: 8),
              Text(
                "Mogadishu, Somalia",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Search coffee...",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              fillColor: Colors.grey[200],
              filled: true,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CoffeeDetailScreen(coffee: filteredItems[index]),
                      ),
                    );
                  },
                  child: CoffeeCard(coffee: filteredItems[index]),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _getSelectedContent() {
    if (selectedIndex == 0) {
      return _buildCoffeeGrid();
    } else if (selectedIndex == 1) {
      return Center(child: Text("Favorites (Empty)", style: TextStyle(fontSize: 18)));
    } else if (selectedIndex == 2) {
      return Center(child: Text("Notifications (Empty)", style: TextStyle(fontSize: 18)));
    } else {
      return Center(child: Text("Profile (Empty)", style: TextStyle(fontSize: 18)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.orange,
      controller: _drawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 300),
      childDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      drawer: _buildDrawer(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[400],
          title: Text("Horseed Coffee Menu"),
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              _drawerController.showDrawer();
            },
          ),
          actions: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                "https://scontent.fmgq1-2.fna.fbcdn.net/v/t39.30808-1/449188903_1484461375776871_316114795604848882_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=109&ccb=1-7&_nc_sid=1d2534&_nc_ohc=BZ2hKbW3y_AQ7kNvgEo2VjP&_nc_zt=24&_nc_ht=scontent.fmgq1-2.fna&_nc_gid=AmtqccIAa2CFbzIaeCQNcMs&oh=00_AYDlq-Qqed501_I8IKXOE1G_glEpn_HCMrJAPfwByE91AQ&oe=67A57DEB",
              ),
              radius: 18,
            ),
            SizedBox(width: 10),
          ],
        ),
        body: _getSelectedContent(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifications"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(leading: Icon(Icons.home), title: Text("Home"), onTap: () {}),
          ListTile(leading: Icon(Icons.favorite), title: Text("Favorites"), onTap: () {}),
          ListTile(leading: Icon(Icons.notifications), title: Text("Notifications"), onTap: () {}),
          ListTile(leading: Icon(Icons.person), title: Text("Profile"), onTap: () {}),
          ListTile(leading: Icon(Icons.group), title: Text("Our Team"), onTap: () {}),
          ListTile(leading: Icon(Icons.add), title: Text("Add Catagory"), onTap: () {}),
          ListTile(
    leading: Icon(Icons.logout, color: Colors.red),
    title: Text("Logout", style: TextStyle(color: Colors.red)),
    onTap: () {
    // Close the drawer first
    Navigator.of(context).pop();
// Navigate back to Login Screen
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => LoginScreen()), // ✅ Redirect to Login Screen
    );
    },
    ),
    ],
      ),
    );
  }
}



// The rest of the screens (CoffeeDetailScreen, PaymentScreen, CoffeeItem, CoffeeCard, and SizeOption) remain unchanged.

class CoffeeDetailScreen extends StatefulWidget {
  final CoffeeItem coffee;

  CoffeeDetailScreen({required this.coffee});

  @override
  _CoffeeDetailScreenState createState() => _CoffeeDetailScreenState();
}

class _CoffeeDetailScreenState extends State<CoffeeDetailScreen> {
  String selectedSize = "M";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.coffee.imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.coffee.name,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.coffee.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.coffee.price,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[400],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Choose Size",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizeOption(
                        label: "S",
                        isSelected: selectedSize == "S",
                        onTap: () {
                          setState(() {
                            selectedSize = "S";
                          });
                        },
                      ),
                      SizeOption(
                        label: "M",
                        isSelected: selectedSize == "M",
                        onTap: () {
                          setState(() {
                            selectedSize = "M";
                          });
                        },
                      ),
                      SizeOption(
                        label: "L",
                        isSelected: selectedSize == "L",
                        onTap: () {
                          setState(() {
                            selectedSize = "L";
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentScreen(
                              coffee: widget.coffee,
                              size: selectedSize,
                              quantity: 1,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      child: Text("Buy Now"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentScreen extends StatelessWidget {
  final CoffeeItem coffee;
  final String size;
  final int quantity;

  PaymentScreen({
    required this.coffee,
    required this.size,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Payment Method"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(
                  coffee.imageUrl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffee.name,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("Size: $size"),
                    Text("Quantity: $quantity"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Total: ${coffee.price}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Choose Payment Method",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png",
                height: 40,
                width: 40,
              ),
              title: Text("Mastercard"),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Mastercard selected")),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Image.network(
                "https://play-lh.googleusercontent.com/MAs5sz0E_vEA3Ceb1CGqp5QUCfH92rXkPTwv6_70OxaipV4VLTekQuXZlOe4ZByFgbXC",
                height: 40,
                width: 40,
              ),
              title: Text("Waafi"),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Waafi selected")),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvucE7_jq4JJK2h0lr2IOnQ3Hx6_dAGfjmxw&s",
                height: 40,
                width: 40,
              ),
              title: Text("Visa"),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Visa selected")),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSloJW7O9TYXA-51kEZ7sDewynoSWRXXeB8LA&s",
                height: 40,
                width: 40,
              ),
              title: Text("eDahab"),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("eDahab selected")),
                );
              },
            ),
            Divider(),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Payment Successful!")),
                  );
                },
                child: Text("Pay Now"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Coffee Item Model
class CoffeeItem {
  final String name;
  final String description;
  final String price;
  final String rating;
  final String imageUrl;

  CoffeeItem({
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.imageUrl,
  });
}

// Coffee Card Widget
class CoffeeCard extends StatelessWidget {
  final CoffeeItem coffee;

  CoffeeCard({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 2,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                coffee.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(coffee.name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(coffee.description, style: TextStyle(color: Colors.orange)),
                SizedBox(height: 8),
                Text(coffee.price),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Size Option Widget
class SizeOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  SizeOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
