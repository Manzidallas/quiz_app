import 'package:flutter/material.dart';

void main() {
  runApp(const Admin());
}

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  AdminState createState() => AdminState();
}

class AdminState extends State<Admin> {
  // Predefined admin user data (for login only)
  final Map<String, String> _adminUser = {
    'email': 'admin@example.com', // Predefined admin email
    'password': 'admin1234',      // Predefined admin password
  };

  // Method to handle successful login
  void loginUser(String email) {
    print('Admin logged in with email: $email'); // For demonstration
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Login',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blue,
        colorScheme: const ColorScheme.light(secondary: Colors.blueAccent),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
      home: const AuthPage(),
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
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Admin Access',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInScreen()),
                  );
                },
                child: const Text('Sign In', style: TextStyle(fontSize: 18)),
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
  final Map<String, String?> _signInData = {
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
        title: const Text('Admin Sign In'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Admin Sign In',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.displayLarge?.color,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your admin email',
                    prefixIcon: Icon(Icons.email, color: theme.iconTheme.color),
                    labelStyle: TextStyle(
                        color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7)),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
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
                const SizedBox(height: 25),
                TextFormField(
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your admin password',
                    prefixIcon: Icon(Icons.lock, color: theme.iconTheme.color),
                    labelStyle: TextStyle(
                        color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7)),
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
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final email = _signInData['email'];
                      final password = _signInData['password'];
                      if (email != null && password != null) {
                        AdminState? appState =
                            context.findAncestorStateOfType<AdminState>();
                        if (appState != null &&
                            appState._adminUser['email'] == email &&
                            appState._adminUser['password'] == password) {
                          appState.loginUser(email);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Admin Sign In Successful!'),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const QuizAppScreen()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Admin Sign In Failed. Invalid credentials.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    }
                  },
                  child: const Text('Sign In', style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Forgot Password? Contact system administrator.'),
                      ),
                    );
                  },
                  child: const Text('Forgot Password?', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class QuizAppScreen extends StatelessWidget {
  const QuizAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz App')),
      body: const Center(
        child: Text('Welcome to the Quiz App!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}