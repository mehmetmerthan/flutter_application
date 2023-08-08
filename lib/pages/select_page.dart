import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/ModelProvider.dart';
import 'package:flutter_application/pages/next_page.dart';

enum Gender { male, female, unspecified }

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _MyAppState();
}

class _MyAppState extends State<SelectPage> {
  bool _isUploading = false;
  Gender selectedGender = Gender.unspecified;
  @override
  void initState() {
    super.initState();
    fetchCurrentUserAttributes();
  }

  String genderToString(Gender gender) {
    switch (gender) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.unspecified:
        return "Unspecified";
      default:
        return 'Unspecified';
    }
  }

  List<String> selectedGenres = [];
  List<String> selectedInstruments = [];

  final List<String> availableGenres = [
    'Pop',
    'Rock',
    'Hip Hop',
    'Electronic',
    'Classical',
    'Jazz',
    'Country',
    'R&B',
    'Reggae',
  ];

  final List<String> availableInstruments = [
    'Guitar',
    'Piano',
    'Violin',
    'Drums',
    'Saxophone',
    'Flute',
    'Trumpet',
    'Bass Guitar',
    'Synthesizer',
  ];

  bool isGenreSelected(String genre) {
    return selectedGenres.contains(genre);
  }

  bool isInstrumentSelected(String instrument) {
    // Yeni eklenen fonksiyon
    return selectedInstruments.contains(instrument);
  }

  void toggleGenreSelection(String genre) {
    setState(() {
      if (selectedGenres.contains(genre)) {
        selectedGenres.remove(genre);
      } else {
        selectedGenres.add(genre);
      }
    });
  }

  void toggleInstrumentSelection(String instrument) {
    // Yeni eklenen fonksiyon
    setState(() {
      if (selectedInstruments.contains(instrument)) {
        selectedInstruments.remove(instrument);
      } else {
        selectedInstruments.add(instrument);
      }
    });
  }

  void printSelectedGenres() {
    safePrint('Selected Genres: $selectedGenres');
  }

  void printSelectedInstruments() {
    // Yeni eklenen fonksiyon
    safePrint('Selected Instruments: $selectedInstruments');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Music Genres and Instruments'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select your favorite music genres:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 26),
            Wrap(
              spacing: 15,
              runSpacing: 10,
              children: availableGenres.map((genre) {
                Color bgColor =
                    isGenreSelected(genre) ? Colors.blue : Colors.grey;
                Color textColor =
                    isGenreSelected(genre) ? Colors.white : Colors.black;
                return GestureDetector(
                  onTap: () => toggleGenreSelection(genre),
                  child: Container(
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 16),
                    child: Text(
                      genre,
                      style: TextStyle(color: textColor),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 56), // Yeni eklenen boşluk
            const Text(
              'Select the instruments you play:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 26), // Yeni eklenen boşluk
            Wrap(
              spacing: 15,
              runSpacing: 10,
              children: availableInstruments.map((instrument) {
                // Yeni eklendi
                Color bgColor = isInstrumentSelected(instrument)
                    ? Colors.blue
                    : Colors.grey;
                Color textColor = isInstrumentSelected(instrument)
                    ? Colors.white
                    : Colors.black;
                return GestureDetector(
                  onTap: () => toggleInstrumentSelection(instrument),
                  child: Container(
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 16),
                    child: Text(
                      instrument,
                      style: TextStyle(color: textColor),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 56),
            const Text(
              'Select your gender:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButton<Gender>(
              value: selectedGender,
              onChanged: (newValue) {
                setState(() {
                  selectedGender = newValue!;
                });
              },
              items: const [
                DropdownMenuItem(
                  value: Gender.male,
                  child: Text('Male'),
                ),
                DropdownMenuItem(
                  value: Gender.female,
                  child: Text('Female'),
                ),
                DropdownMenuItem(
                  value: Gender.unspecified,
                  child: Text("I don't want to specify"),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            _isUploading = true;
          });

          await saveUserAttributes();

          setState(() {
            _isUploading = false;
          });

          navi();
        },
        child: _isUploading
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ) // Yükleme sırasında gösterilecek widget
            : const Icon(Icons.arrow_forward),
      ),
    );
  }

  String _name = "";
  String _email = "";
  String _age = "";
  Future<void> fetchCurrentUserAttributes() async {
    try {
      final result = await Amplify.Auth.fetchUserAttributes();
      for (final element in result) {
        if (element.userAttributeKey.toString() == "name") {
          _name = element.value.toString();
        } else if (element.userAttributeKey.toString() == "email") {
          _email = element.value.toString();
        } else if (element.userAttributeKey.toString() == "birthdate") {
          int year = 0;
          year = DateTime.now().year -
              DateTime.parse(element.value.toString()).year;
          _age = year.toString();
        }
      }
    } on AuthException catch (e) {
      safePrint('Error fetching user attributes: ${e.message}');
    }
  }

  Future<void> saveUserAttributes() async {
    final result = await Amplify.Auth.getCurrentUser();
    try {
      final existingUsers = await Amplify.DataStore.query(
        User.classType,
        where: User.USER_NAME.eq(result.username),
      );

      if (existingUsers.isNotEmpty) {
        final existingUser = existingUsers.first;

        // Update the existing user's attributes
        final updatedUser = existingUser.copyWith(
            style: selectedGenres,
            instrument: selectedInstruments,
            gender: genderToString(selectedGender));

        await Amplify.DataStore.save(updatedUser);
      } else {
        // Create a new user
        final newUser = User(
            user_name: result.username,
            name: _name,
            age: _age,
            email: _email,
            instrument: selectedInstruments,
            style: selectedGenres,
            gender: genderToString(selectedGender));
        await Amplify.DataStore.save(newUser);
      }
      safePrint('Saved item');
    } catch (e) {
      safePrint('Error saving item: $e');
    }
  }

  Future<void> navi() async {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const NextPage()),
    );
  }
}
