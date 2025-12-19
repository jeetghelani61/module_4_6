import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FeedbackFormPage(),
    );
  }
}

class FeedbackFormPage extends StatefulWidget {
  const FeedbackFormPage({super.key});

  @override
  State<FeedbackFormPage> createState() => _FeedbackFormPageState();
}

class _FeedbackFormPageState extends State<FeedbackFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();

  // Dropdown
  String? _selectedRating;

  // Checkboxes
  bool _option1 = false;
  bool _option2 = false;
  bool _option3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name Field
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Feedback Field
                TextFormField(
                  controller: _feedbackController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: "Feedback",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your feedback";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Dropdown for rating
                DropdownButtonFormField<String>(
                  value: _selectedRating,
                  decoration: const InputDecoration(
                    labelText: "Rating",
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: "Excellent",
                      child: Text("Excellent"),
                    ),
                    DropdownMenuItem(
                      value: "Good",
                      child: Text("Good"),
                    ),
                    DropdownMenuItem(
                      value: "Average",
                      child: Text("Average"),
                    ),
                    DropdownMenuItem(
                      value: "Poor",
                      child: Text("Poor"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedRating = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please select a rating";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Checkboxes
                const Text(
                  "What did you like?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                CheckboxListTile(
                  title: const Text("Service"),
                  value: _option1,
                  onChanged: (bool? value) {
                    setState(() {
                      _option1 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("Quality"),
                  value: _option2,
                  onChanged: (bool? value) {
                    setState(() {
                      _option2 = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("Support"),
                  value: _option3,
                  onChanged: (bool? value) {
                    setState(() {
                      _option3 = value ?? false;
                    });
                  },
                ),

                const SizedBox(height: 20),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        String liked = '';
                        if (_option1) liked += 'Service, ';
                        if (_option2) liked += 'Quality, ';
                        if (_option3) liked += 'Support, ';
                        if (liked.isNotEmpty) {
                          liked = liked.substring(0, liked.length - 2);
                        } else {
                          liked = 'None';
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Thank you ${_nameController.text}! Rating: $_selectedRating. Liked: $liked."),
                          ),
                        );

                        // Optional: Clear form
                        _formKey.currentState!.reset();
                        setState(() {
                          _selectedRating = null;
                          _option1 = false;
                          _option2 = false;
                          _option3 = false;
                        });
                      }
                    },
                    child: const Text("Submit"),
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
