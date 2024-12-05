import 'package:flutter/material.dart';

class petSupport extends StatefulWidget {
  const petSupport({super.key});

  @override
  SubmitTicketPageState createState() => SubmitTicketPageState();
}

class SubmitTicketPageState extends State<petSupport> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  bool submitting = false;

  // Ticket submission
  void submitTicket() {
    if (formKey.currentState!.validate()) {
      // Network request to submit ticket to the backend
      setState(() {
        submitting = true;
      });


      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          submitting = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ticket submitted successfully!')),
        );


      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit a Ticket'),
        backgroundColor: Colors.brown[600],

    ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Subject textField
                  TextFormField(
                    controller: subjectController,
                    decoration: const InputDecoration(
                      labelText: 'Ticket Subject',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Do not leave blank';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  // Description textField
                  TextFormField(
                    controller: descriptionController,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      labelText: 'Ticket Description',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Do not leave blank';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Submit Button
                  submitting
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                    onPressed: submitTicket,
                    child: const Text('Submit Ticket'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
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
