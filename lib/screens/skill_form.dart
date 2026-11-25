
import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/services/api_service.dart';

class SkillFormPage extends StatefulWidget {
  const SkillFormPage({super.key});

  @override
  State<SkillFormPage> createState() => _SkillFormPageState();
}

class _SkillFormPageState extends State<SkillFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _skillName = TextEditingController();
  final _category = TextEditingController();
  final _level = TextEditingController();
  final _description = TextEditingController();

  bool isLoading = false;

  Future<void> saveSkill() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      final success = await ApiService.addSkill(
        name: _skillName.text.trim(),
        category: _category.text.trim(),
        level: _level.text.trim(),
        description: _description.text.trim(),
      );

      if (!mounted) return;

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Skill berhasil ditambahkan!'),
          ),
        );

        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Gagal menambahkan Skill.'),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _skillName.dispose();
    _category.dispose();
    _level.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Skill Form'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              buildField(
                controller: _skillName,
                label: 'Nama Skill',
                hint: 'Contoh: Problem Solving',
              ),
              buildField(
                controller: _category,
                label: 'Kategori',
                hint: 'Contoh: Soft Skill',
              ),
              buildField(
                controller: _level,
                label: 'Level',
                hint: 'Contoh: Intermediate atau -',
              ),
              buildField(
                controller: _description,
                label: 'Deskripsi',
                hint: 'Masukkan deskripsi skill...',
                maxLines: 5,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: isLoading ? null : saveSkill,
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return '$label tidak boleh kosong!';
          }
          return null;
        },
      ),
    );
  }
}
