import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../widgets/custom_input_field.dart';
import '../../widgets/custom_button.dart';

class DriverRegisterScreen extends StatefulWidget {
  @override
  _DriverRegisterScreenState createState() => _DriverRegisterScreenState();
}

class _DriverRegisterScreenState extends State<DriverRegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _carNameController = TextEditingController();
  final _carTypeController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();
  File? _carImage;
  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _carImage = File(pickedFile.path);
      });
    }
  }

  Future<String> _uploadImage(File image) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('cars/${image.path.split('/').last}');
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  void _register() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      String carImageUrl = '';
      if (_carImage != null) {
        carImageUrl = await _uploadImage(_carImage!);
      }

      // Add driver details and car details to Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': _nameController.text,
        'email': _emailController.text,
        'role': 'driver',
      });

      await _firestore.collection('cars').add({
        'driverId': userCredential.user!.uid,
        'name': _carNameController.text,
        'type': _carTypeController.text,
        'imageUrl': carImageUrl,
      });

      // Navigate to driver's home screen after successful registration
      Navigator.pushReplacementNamed(context, '/driverHome');
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message!;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Driver Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInputField(
                controller: _nameController,
                label: 'Name',
              ),
              CustomInputField(
                controller: _emailController,
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              CustomInputField(
                controller: _passwordController,
                label: 'Password',
                obscureText: true,
              ),
              CustomInputField(
                controller: _carNameController,
                label: 'Car Name',
              ),
              CustomInputField(
                controller: _carTypeController,
                label: 'Car Type',
              ),
              SizedBox(height: 10),
              _carImage == null
                  ? TextButton(
                      onPressed: _pickImage,
                      child: Text('Pick Car Image'),
                    )
                  : Image.file(_carImage!),
              SizedBox(height: 20),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  : CustomButton(
                      text: 'Register',
                      onPressed: _register,
                    ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/driverLogin');
                },
                child: Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _carNameController.dispose();
    _carTypeController.dispose();
    super.dispose();
  }
}
