import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController controller = TextEditingController();

  List<String> tasks = [];

  void addTask() {
    String task = controller.text.trim();

    if (task.isNotEmpty) {
      setState(() {
        tasks.add(task);
        controller.clear();
      });
    }
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Իմ առաջադրանքները'),
        centerTitle: true,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // TextField և Ավելացնել կոճակ
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Գրիր առաջադրանքը',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => addTask(),
                  ),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: addTask,
                  child: const Text('Ավելացնել'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Առաջադրանքների ցանկ
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,

                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(tasks[index]),

                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),

                        onPressed: () {
                          deleteTask(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
