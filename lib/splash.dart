import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Set a delay for the splash screen (e.g., 3 seconds) before navigating to the login screen.
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen(isLogin: true)), // Start with Login screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(234, 9, 126, 180), // Light navy blue background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Network Image - Replace with your actual network URL
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKf4-d9BAMB0y66NYvNIJXy3ctlQnsI2rDlA&s', // Replace with actual URL
              width: 150,
              height: 150,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                }
              },
              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                return Icon(Icons.error, color: Colors.red);
              },
            ),
            SizedBox(height: 20),
            // Text "YOUR DOCTOR" in white color
            Text(
              'YOUR DOCTOR',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// HomePage Screen (after login)
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row 1: Text "Hi Diya", Subtitle "is everything fine?", and Notification Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi Diya',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Is everything fine?',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.notifications, color: Colors.blue),
              ],
            ),
            SizedBox(height: 20),

            // Row 2: Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Row 3: "Our Services" Title
            Text(
              'Our Services',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Row 4: Two Buttons - Clinic Appointment and Online Appointment
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Clinic Appointment Button
                ElevatedButton.icon(
                  onPressed: () {
                    // Action for Clinic Appointment
                    print('Clinic Appointment tapped');
                  },
                  icon: Icon(Icons.local_hospital),
                  label: Text('Clinic Appointment'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(160, 50),
                  ),
                ),

                // Online Appointment Button
                ElevatedButton.icon(
                  onPressed: () {
                    // Action for Online Appointment
                    print('Online Appointment tapped');
                  },
                  icon: Icon(Icons.video_call),
                  label: Text('Online Appointment'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(160, 50),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Row 5: "Offers" Title
            Text(
              'Offers',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Offer text
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Action for "50% off for your first video call"
                print("Offer tapped");
              },
              child: Text(
                "Offer 50% off for your first video call with your doctor",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 20),

            // Row: "Categories" Title
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Row: 3 Categories (Buttons)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Cardiology Button
                ElevatedButton(
                  onPressed: () {
                    print("Cardiology tapped");
                  },
                  child: Text("Cardiology"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    minimumSize: Size(100, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                // Neurology Button
                ElevatedButton(
                  onPressed: () {
                    print("Neurology tapped");
                  },
                  child: Text("Neurology"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    minimumSize: Size(100, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                // Dermatology Button
                ElevatedButton(
                  onPressed: () {
                    print("Dermatology tapped");
                  },
                  child: Text("Dermatology"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    minimumSize: Size(100, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Row: "TOP DOCTORS" Title
            Text(
              'TOP DOCTORS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Row: Doctor Information without CircleAvatar
            Row(
              children: [
                // Column for doctor information
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Doctor Name in bold
                    Text(
                      'Dr. Diya',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),

                    // Doctor Specialty (Subtitle)
                    Text(
                      'Dermatologist',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 4),

                    // Hospital Name (Subtitle)
                    Text(
                      'City Hospital',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 4),

                    // Rating with Star Icon
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '4.5',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Login Screen / Signup Screen
class LoginScreen extends StatelessWidget {
  final bool isLogin;

  // Constructor to take in a boolean value for determining login/signup screen
  LoginScreen({required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color of the login screen
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
            children: [
              // SplashScreen Logo and Text "YOUR DOCTOR"
              Center(
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKf4-d9BAMB0y66NYvNIJXy3ctlQnsI2rDlA&s', // Replace with actual URL
                  width: 150,
                  height: 150,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    }
                  },
                  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                    return Icon(Icons.error, color: Colors.red);
                  },
                ),
              ),
              SizedBox(height: 20),
              // Text "YOUR DOCTOR"
              Center(
                child: Text(
                  'YOUR DOCTOR',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(height: 30),

              // "Email" text in bold
              Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              // Email TextFormField
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Only show Code and Mobile No in Sign Up screen
              if (!isLogin) ...[
                // Row for "Code" and "Mobile No"
                Row(
                  children: [
                    // Code Field
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Code',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter the code',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16), // Space between the fields
                    // Mobile No Field
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mobile No',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter your mobile number',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],

              // "Password" text in bold
              Text(
                'Password',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              // Password TextFormField
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Forgot Password Text
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // Handle forgot password action here
                    print("Forgot password tapped");
                  },
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Sign In Button inside a rectangle
              Center(
                child: Container(
                  width: double.infinity, // Set the width to take full width
                  padding: EdgeInsets.symmetric(vertical: 16), // 1cm size approximation
                  margin: EdgeInsets.symmetric(horizontal: 16), // Space from the edges
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle sign-in action here
                      print(isLogin ? "Login button tapped" : "Sign Up button tapped");

                      // Navigate to HomePage after successful Sign In/Sign Up
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()), // Navigate to homepage
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, // Make button background transparent
                      shadowColor: Colors.transparent, // Remove the shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Round corners
                      ),
                      padding: EdgeInsets.zero, // No internal padding
                    ),
                    child: Text(
                      isLogin ? 'SIGN IN' : 'SIGN UP', // Change text depending on Login/Signup
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Or continue with text centered
              Center(
                child: Text(
                  'Or continue with',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 20),

              // Facebook and Google Sign In options
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Facebook Button
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.facebook, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Facebook',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  // Google Button
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.red, // Google Red color
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.g_translate, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Google',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Text: Doesn't have an account? Sign up
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Navigate to the Sign-Up screen when tapped
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen(isLogin: false)), // Pass false for Sign up
                    );
                  },
                  child: Text(
                    "Doesn't have an account? Sign up",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
