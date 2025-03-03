import 'package:flutter/material.dart';
import 'logged_in/main.dart';

void main() {
  runApp(const Admin());
}

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  AdminState createState() => AdminState();
}

class AdminState extends State<Admin> {
  // State to hold current user data
  Map<String, String> _currentUserData = {
    'email': '',
  };

  // State to store registered users (in-memory for this example)
  final List<Map<String, String>> _registeredUsers = [];

  // Method to update current user data upon successful login
  void loginUser(String email) {
    setState(() {
      _currentUserData['email'] = email;
    });
    print('User logged in with email: $email'); // Just for demonstration
  }

  // Method to register a new user
  void registerUser(Map<String, String> userData) {
    setState(() {
      _registeredUsers.add(userData);
    });
    print('Registered new user: $userData'); // Just for demonstration
  }

  // Getter for registered users (optional, for debugging or more complex logic)
  List<Map<String, String>> get registeredUsers => _registeredUsers;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome App',
      theme: ThemeData.light().copyWith( // Applying theme customization
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.light(secondary: Colors.blueAccent),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme( // Default InputDecorationTheme for better consistency
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
      home: const AuthPage(), // Use AuthPage to decide between SignIn and SignUp
      debugShowCheckedModeBanner: false,
    );
  }
}

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0), // Added padding to AuthPage content
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch buttons to fill width
            children: <Widget>[
              const Text(
                'Welcome!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold), // Made Welcome text bolder and larger
              ),
              const SizedBox(height: 40), // Increased spacing
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
                },
                child: const Text('Sign In', style: TextStyle(fontSize: 18)), // Increased button text size
              ),
              const SizedBox(height: 20), // Spacing between buttons
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: const Text('Sign Up', style: TextStyle(fontSize: 18)), // Increased button text size
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  Map<String, String> _signInData = {
    'email': '',
    'password': '',
  };
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Sign In'),
        centerTitle: true, // Center the AppBar title for better aesthetics
      ),
      body: Center(
        child: SingleChildScrollView( // Added SingleChildScrollView for better responsiveness
          padding: const EdgeInsets.all(30.0), // Increased padding around the form
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch form elements to fill width
              children: [
                Text('Sign In', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: theme.textTheme.displayLarge?.color), textAlign: TextAlign.center), // Bolder Sign In text
                const SizedBox(height: 40), // Increased spacing
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    prefixIcon: Icon(Icons.email, color: theme.iconTheme.color), // Added prefix icon
                    labelStyle: TextStyle(color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7)),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _signInData['email'] = value;
                    });
                  },
                ),
                const SizedBox(height: 25), // Increased spacing
                TextFormField(
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: Icon(Icons.lock, color: theme.iconTheme.color), // Added prefix icon
                    labelStyle: TextStyle(color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: theme.iconTheme.color,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _signInData['password'] = value;
                    });
                  },
                ),
                const SizedBox(height: 30), // Increased spacing
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, process sign in
                      String email = _signInData['email']!;
                      String password = _signInData['password']!;

                      // Access the registered users list from AdminState
                      AdminState? appState = context.findAncestorStateOfType<AdminState>();
                      if (appState != null) {
                        // Check if the entered email and password match any registered user
                        bool isSignedIn = false;
                        for (var user in appState.registeredUsers) {
                          if (user['email'] == email && user['password'] == password) {
                            isSignedIn = true;
                            break;
                          }
                        }

                        if (isSignedIn) {
                          appState.loginUser(email); // Call loginUser to update user state in Admin
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Sign In Successful!'),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.pushReplacement( // Navigate to QuizAppPlaceholder on successful login
                            context,
                            MaterialPageRoute(builder: (context) => const QuizAppScreen()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Sign In Failed. Invalid credentials.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      } else {
                        // Handle error if AdminState is not found
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Error: Authentication state not found.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Sign In', style: TextStyle(fontSize: 18)), // Increased button text size
                ),
                const SizedBox(height: 20),
                TextButton( // Using TextButton for a "Forgot Password?" link style
                  onPressed: () {
                    // TODO: Implement forgot password functionality
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Forgot Password? feature not implemented yet.'),
                      ),
                    );
                  },
                  child: const Text('Forgot Password?', style: TextStyle(fontSize: 16)), // Slightly smaller text for link
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
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  Map<String, String> _signUpData = {
    'firstName': '',
    'lastName': '',
    'email': '',
    'password': '',
    'confirmPassword': '',
  };
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true, // Center the AppBar title
      ),
      body: Center(
        child: SingleChildScrollView( // Added SingleChildScrollView for responsiveness
          padding: const EdgeInsets.all(30.0), // Increased padding around the form
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch form elements to fill width
              children: [
                Text('Sign Up', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: theme.textTheme.displayLarge?.color), textAlign: TextAlign.center), // Bolder Sign Up text
                const SizedBox(height: 40), // Increased spacing
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    hintText: 'Enter your first name',
                    prefixIcon: Icon(Icons.person, color: theme.iconTheme.color), // Added prefix icon
                    labelStyle: TextStyle(color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7)),
                  ),
                  style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _signUpData['firstName'] = value;
                    });
                  },
                ),
                const SizedBox(height: 25), // Increased spacing
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    hintText: 'Enter your last name',
                    prefixIcon: Icon(Icons.person, color: theme.iconTheme.color), // Added prefix icon
                    labelStyle: TextStyle(color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7)),
                  ),
                  style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _signUpData['lastName'] = value;
                    });
                  },
                ),
                const SizedBox(height: 25), // Increased spacing
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    prefixIcon: Icon(Icons.email, color: theme.iconTheme.color), // Added prefix icon
                    labelStyle: TextStyle(color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7)),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _signUpData['email'] = value;
                    });
                  },
                ),
                const SizedBox(height: 25), // Increased spacing
                TextFormField(
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: Icon(Icons.lock, color: theme.iconTheme.color), // Added prefix icon
                    labelStyle: TextStyle(color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: theme.iconTheme.color,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _signUpData['password'] = value;
                    });
                  },
                ),
                const SizedBox(height: 25), // Increased spacing
                TextFormField(
                  obscureText: _obscureConfirmPassword,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'Confirm your password',
                    prefixIcon: Icon(Icons.lock_outline, color: theme.iconTheme.color), // Added prefix icon
                    labelStyle: TextStyle(color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                        color: theme.iconTheme.color,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                  ),
                  style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _signUpData['password']) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _signUpData['confirmPassword'] = value;
                    });
                  },
                ),
                const SizedBox(height: 30), // Increased spacing
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, process sign up
                      // Prepare user data to be registered (exclude confirmPassword)
                      Map<String, String> newUser = {
                        'firstName': _signUpData['firstName']!,
                        'lastName': _signUpData['lastName']!,
                        'email': _signUpData['email']!,
                        'password': _signUpData['password']!,
                      };

                      // Access the registerUser function from AdminState
                      AdminState? appState = context.findAncestorStateOfType<AdminState>();
                      if (appState != null) {
                        appState.registerUser(newUser); // Register the new user in Admin State
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Sign Up Successful! Please sign in.'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.pushReplacement( // Navigate to SignInScreen after successful signup
                          context,
                          MaterialPageRoute(builder: (context) => const SignInScreen()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Error: Authentication state not found.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Sign Up', style: TextStyle(fontSize: 18)), // Increased button text size
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class QuizAppPlaceholder extends StatelessWidget { // Placeholder for Quiz App
//   const QuizAppPlaceholder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Quiz App')),
//       body: const Center(
//         child: Text('Welcome to the Quiz App!', style: TextStyle(fontSize: 24)),
//       ),
//     );
//   }
// }