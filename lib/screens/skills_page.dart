
import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/services/api_service.dart';
import 'package:myportofolio_mobile/screens/skill_form.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  late Future<List<dynamic>> skillsFuture;

  @override
  void initState() {
    super.initState();
    refreshSkills();
  }

  void refreshSkills() {
    skillsFuture = ApiService.getSkills();
  }

  Future<void> openAddForm() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SkillFormPage(),
      ),
    );

    if (result == true && mounted) {
      setState(refreshSkills);
    }
  }

  Future<void> handleStar(String id) async {
    try {
      final success = await ApiService.toggleStar(id);

      if (success && mounted) {
        setState(refreshSkills);
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal mengubah star: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Skills'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: skillsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          final skills = snapshot.data ?? [];

          if (skills.isEmpty) {
            return const Center(
              child: Text('Belum ada Skills.'),
            );
          }

          return ListView.builder(
            itemCount: skills.length,
            itemBuilder: (context, index) {
              final skill = skills[index];

              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: ListTile(
                  title: Text(
                    skill['name'] ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${skill['category']} • ${skill['level']}',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${skill['star_count'] ?? 0}'),
                      IconButton(
                        icon: Icon(
                          skill['is_starred'] == true
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                        ),
                        onPressed: () {
                          handleStar(skill['id'].toString());
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openAddForm,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
