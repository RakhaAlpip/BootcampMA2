import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _birthController = TextEditingController();
  bool _obscure = true;
  DateTime? _birthDate;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _birthController.dispose();
    super.dispose();
  }

  Future<void> _pickBirthDate() async {
    final now = DateTime.now();
    final initial = _birthDate ?? DateTime(now.year - 18, now.month, now.day);
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1900),
      lastDate: now,
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Colors.purpleAccent,
            onPrimary: Colors.white,
            onSurface: Colors.black,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) {
      setState(() {
        _birthDate = picked;
        _birthController.text =
            '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      });
    }
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final birth = _birthController.text;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Registered $username — $email — $birth'),
        backgroundColor: Colors.deepPurple,
      ),
    );

    // For demo: clear fields
    _formKey.currentState!.reset();
    setState(() {
      _birthDate = null;
      _obscure = true;
    });
  }

  InputDecoration _inputDecoration({
    required IconData icon,
    required String hint,
    Color? color,
  }) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, color: color ?? Colors.deepPurple),
      filled: true,
      fillColor: Colors.white.withOpacity(0.9),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: (color ?? Colors.deepPurple)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFfbc2eb), Color(0xFFa6c1ee), Color(0xFFa1c4fd)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 520),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.white, Colors.white70],
                        ),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              CircleAvatar(
                                radius: 26,
                                backgroundColor: Colors.deepPurple,
                                child: Icon(
                                  Icons.person_add,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Create Account',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Sign up to get started — it only takes a minute!',
                            style: TextStyle(color: Colors.black54),
                          ),
                          const SizedBox(height: 18),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _usernameController,
                                  decoration: _inputDecoration(
                                    icon: Icons.person,
                                    hint: 'Username',
                                    color: Colors.deepPurple,
                                  ),
                                  validator: (v) =>
                                      v == null || v.trim().isEmpty
                                      ? 'Please enter a username'
                                      : null,
                                ),
                                const SizedBox(height: 12),
                                TextFormField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: _inputDecoration(
                                    icon: Icons.email,
                                    hint: 'Email',
                                    color: Colors.teal,
                                  ),
                                  validator: (v) {
                                    if (v == null || v.trim().isEmpty)
                                      return 'Please enter an email';
                                    if (!RegExp(
                                      r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}",
                                    ).hasMatch(v))
                                      return 'Enter a valid email';
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 12),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: _obscure,
                                  decoration:
                                      _inputDecoration(
                                        icon: Icons.lock,
                                        hint: 'Password',
                                        color: Colors.orange,
                                      ).copyWith(
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _obscure
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Colors.grey[600],
                                          ),
                                          onPressed: () => setState(
                                            () => _obscure = !_obscure,
                                          ),
                                        ),
                                      ),
                                  validator: (v) => v == null || v.length < 6
                                      ? 'Password must be at least 6 chars'
                                      : null,
                                ),
                                const SizedBox(height: 12),
                                GestureDetector(
                                  onTap: _pickBirthDate,
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      controller: _birthController,
                                      decoration: _inputDecoration(
                                        icon: Icons.cake,
                                        hint: 'Birth date (YYYY-MM-DD)',
                                        color: Colors.pink,
                                      ),
                                      validator: (v) => v == null || v.isEmpty
                                          ? 'Please pick your birth date'
                                          : null,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 18),
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: _submit,
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      elevation: 6,
                                      backgroundColor: Colors.white,
                                      padding: const EdgeInsets.all(0),
                                    ),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF6a11cb),
                                            Color(0xFF2575fc),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: const Text(
                                          'Create Account',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Already have an account?',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text(
                                        'Sign in',
                                        style: TextStyle(
                                          color: Colors.deepPurple,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'By signing up you agree to our Terms & Conditions',
                      style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(height: media.height * 0.06),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
